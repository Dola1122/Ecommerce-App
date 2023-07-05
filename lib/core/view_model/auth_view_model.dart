import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';


class AuthViewModel extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<void> signInWithGoogle() async {
    try {
      // Sign in with Google and get the user account
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      // Get the authentication credentials for the signed-in user
      final GoogleSignInAuthentication googleAuth = await googleUser!.authentication;
      // Create the Firebase credential using the access token and ID token from Google
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      // Sign in to Firebase using the Google credential
      UserCredential userCredential =  await _auth.signInWithCredential(credential);
      print(userCredential);

      // Handle successful sign-in
    } catch (e) {
      // Handle sign-in failure
    }
  }
}
