import 'package:ecommerce_app/core/services/firestore_user.dart';
import 'package:ecommerce_app/core/utils/local_storage_data.dart';
import 'package:ecommerce_app/model/user_model.dart';
import 'package:ecommerce_app/view/auth/login_view.dart';
import 'package:ecommerce_app/view/control_view.dart';
import 'package:ecommerce_app/view/home_view.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthViewModel extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final LocalStorageData _localStorageData = Get.find<LocalStorageData>();
  String email = "", password = "", name = "";
  Rx<User?> _user = Rx<User?>(null);

  String? get user => _user.value?.email;

  @override
  void onInit() {
    super.onInit();
    _user.bindStream(_auth.authStateChanges());
  }
  Future<void> signInWithEmailAndPassword() async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      _user.value = userCredential.user;

      // Store user data in local storage
      final UserModel user = UserModel(
        userId: userCredential.user?.uid ?? '',
        name: userCredential.user?.displayName ?? '',
        email: userCredential.user?.email ?? '',
        picture: '', // Set the user's picture if available
      );

      await _localStorageData.setUser(user);

      Get.offAll(ControlView());

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

      await saveUserToFireStore(userCredential);

      _user.value = userCredential.user;

      // Store user data in local storage
      final UserModel user = UserModel(
        userId: userCredential.user?.uid ?? '',
        name: userCredential.user?.displayName ?? '',
        email: userCredential.user?.email ?? '',
        picture: '', // Set the user's picture if available
      );

      await _localStorageData.setUser(user);

      Get.offAll(ControlView());

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
        UserCredential userCredential =
            await _auth.signInWithCredential(credential);

        await saveUserToFireStore(userCredential);

        _user.value = userCredential.user;

        // Store user data in local storage
        final UserModel user = UserModel(
          userId: userCredential.user?.uid ?? '',
          name: userCredential.user?.displayName ?? '',
          email: userCredential.user?.email ?? '',
          picture: '', // Set the user's picture if available
        );

        await _localStorageData.setUser(user);

        Get.offAll(ControlView());

        print(userCredential);
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

  Future<void> signUpWithEmailAndPassword() async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (userCredential.user != null) {
        await saveUserToFireStore(userCredential);

        Get.offAll(ControlView());
      }

      // Handle successful sign-up
      print('Sign-up successful: ${userCredential.user?.email}');
    } catch (e) {
      // Handle sign-up failure
      print('Sign-up error: $e');
    }
  }

  Future<void> saveUserToFireStore(UserCredential userCredential) async {
    FirestoreUser firestoreUser = FirestoreUser();

    UserModel user = UserModel(
      userId: userCredential.user!.uid,
      email: userCredential.user!.email!,
      name: name == "" ? userCredential.user!.displayName! : name,
      picture: "",
    );
    await firestoreUser.addUser(user);
  }
}
