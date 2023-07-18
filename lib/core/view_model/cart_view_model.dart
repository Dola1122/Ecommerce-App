import 'package:ecommerce_app/core/services/database/cart_database_helper.dart';
import 'package:get/get.dart';
import 'package:ecommerce_app/model/cart_product_model.dart';

class CartViewModel extends GetxController {
  List<CartProductModel> cartProducts = [];
  bool isLoading = true;
  double total = 0;

  @override
  void onInit() {
    super.onInit();
    fetchCartProducts();
  }

  Future<void> fetchCartProducts() async {
    try {
      isLoading = true;
      update();
      final products = await CartDatabaseHelper.getCartProducts();
      cartProducts = products;
      isLoading = false;
      update();
      updateTotalAmount(); // Update the total amount after fetching the products
    } catch (e) {
      // Handle error while fetching cart products
      isLoading = false;
      update();
      // Show error message or snackbar
    }
  }

  Future<void> addToCart(CartProductModel product) async {
    try {
      await CartDatabaseHelper.saveCartProduct(product);
      cartProducts.add(product);
      update();
      updateTotalAmount(); // Update the total amount after adding the product
      // Show success message or snackbar
    } catch (e) {
      // Handle error while adding to cart
      // Show error message or snackbar
    }
  }

  Future<void> updateCartProduct(CartProductModel product) async {
    try {
      await CartDatabaseHelper.updateCartProduct(product);
      final index =
      cartProducts.indexWhere((p) => p.productId == product.productId);
      if (index != -1) {
        cartProducts[index] = product;
      }
      update();
      updateTotalAmount(); // Update the total amount after updating the product
    } catch (e) {
      // Handle error while updating cart product
      // Show error message or snackbar
    }
  }

  Future<void> removeFromCart(CartProductModel product) async {
    try {
      await CartDatabaseHelper.deleteCartProduct(product.productId);
      cartProducts.remove(product);
      update();
      updateTotalAmount(); // Update the total amount after removing the product
      // Show success message or snackbar
    } catch (e) {
      // Handle error while removing from cart
      // Show error message or snackbar
    }
  }

  void updateTotalAmount() {
    total = 0;
    for (final product in cartProducts) {
      total += (product.price * product.quantity);
    }
    update();
  }
}
