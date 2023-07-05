import 'package:ecommerce_app/view/auth/login_screen.dart';
import 'package:ecommerce_app/view/home_view.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthViewModel extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  String email = "", password = "";

  Future<void> signInWithEmailAndPassword() async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      Get.offAll(HomeView());

      // Handle successful sign-in
      print('Sign-in successful: ${userCredential.user?.email}');
    } catch (e) {
      // Handle sign-in failure
      print('Sign-in error: $e');
    }
  }

  Future<void> signInWithGoogle() async {
    try {
      // Sign in with Google and get the user account
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      // Get the authentication credentials for the signed-in user
      final GoogleSignInAuthentication googleAuth =
          await googleUser!.authentication;
      // Create the Firebase credential using the access token and ID token from Google
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      // Sign in to Firebase using the Google credential
      UserCredential userCredential =
          await _auth.signInWithCredential(credential);
      print(userCredential);

      // Handle successful sign-in
    } catch (e) {
      print('Google sign-in error: $e');
      // Handle sign-in failure
    }
  }

  Future<void> signInWithFacebook() async {
    try {
      // Sign in with Facebook and get the result
      final result = await FacebookAuth.instance.login();

      // Check the status of the sign-in result
      if (result.status == LoginStatus.success) {
        final accessToken = result.accessToken;
        final credential = FacebookAuthProvider.credential(accessToken!.token);

        // Sign in to Firebase using the Facebook credential
        await _auth.signInWithCredential(credential);
        // Handle successful sign-in
      } else if (result.status == LoginStatus.cancelled) {
        // Handle cancellation
        print('Facebook sign-in cancelled');
      } else {
        // Handle other errors
        print('Facebook sign-in error: ${result.message}');
      }
    } catch (e) {
      // Handle sign-in failure
      print('Facebook sign-in error: $e');
    }
  }


}
