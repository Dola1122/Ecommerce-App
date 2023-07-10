import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/model/user_model.dart';

class FirestoreUser {
  final CollectionReference _usersCollection =
      FirebaseFirestore.instance.collection('Users');

  Future<void> addUser(UserModel user) async {
    try {
      await _usersCollection.doc(user.userId).set(user.toJson());
      print('User added successfully!');
    } catch (e) {
      print('Failed to add user: $e');
    }
  }
}
