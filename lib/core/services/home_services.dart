import 'package:cloud_firestore/cloud_firestore.dart';

class HomeServices {
  final CollectionReference categoriesRef =
  FirebaseFirestore.instance.collection('Categories');
  final CollectionReference productsRef =
  FirebaseFirestore.instance.collection('Products');

  Future<List<Object?>> getCategories() async {
    try {
      QuerySnapshot snapshot = await categoriesRef.get();
      return snapshot.docs.map((doc) => doc.data()).toList();
    } catch (e) {
      // Handle error
      print('Error fetching categories: $e');
      return [];
    }
  }

  Future<List<Object?>> getProducts() async {
    try {
      QuerySnapshot snapshot = await productsRef.get();
      return snapshot.docs.map((doc) => doc.data()).toList();
    } catch (e) {
      // Handle error
      print('Error fetching products: $e');
      return [];
    }
  }
}
