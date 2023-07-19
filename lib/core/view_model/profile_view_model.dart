import 'package:ecommerce_app/core/utils/local_storage_data.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class ProfileViewModel extends GetxController {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<void> signOut() async {
    try {
      // Sign out from Firebase email and password authentication
      await _firebaseAuth.signOut();
    } catch (e) {
      print('Error signing out from Firebase: $e');
      // Handle the error or display a message to the user
    }

    try {
      // Sign out from Google
      await _googleSignIn.signOut();
    } catch (e) {
      print('Error signing out from Google: $e');
      // Handle the error or display a message to the user
    }

    try {
      // Sign out from Facebook
      await FacebookAuth.instance.logOut();
    } catch (e) {
      print('Error signing out from Facebook: $e');
      // Handle the error or display a message to the user
    }

    try {
      // Delete user data from local storage
      final LocalStorageData localStorage = Get.find<LocalStorageData>();
      await localStorage.deleteUser();
    } catch (e) {
      print('Error deleting user data from local storage: $e');
      // Handle the error or display a message to the user
    }
  }

}
