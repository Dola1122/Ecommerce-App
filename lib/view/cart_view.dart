import 'package:ecommerce_app/core/view_model/cart_view_model.dart';
import 'package:ecommerce_app/model/cart_product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartViewModel>(
      init: CartViewModel(),
      builder: (controller) => Scaffold(
        body: SafeArea(
          child: Container(
            padding: EdgeInsets.only(
              top: 16,
              right: 16,
              left: 16,
            ),
            child: ListView.builder(
              itemCount: controller.cartProducts.length,
              itemBuilder: (context, index) {
                CartProductModel model = controller.cartProducts[index];
                return CartItemWidget(
                  product: model,
                  onDecrease: () {
                    if (model.quantity > 1) {
                      model.quantity--;
                      controller.updateCartProduct(model);
                    }
                  },
                  onIncrease: () {
                    model.quantity++;
                    controller.updateCartProduct(model);
                  },
                );
              },
            ),
          ),
        ),
        bottomNavigationBar: CheckoutButtonWidget(
          totalAmount: controller.total,
        ),
      ),
    );
  }
}

class CartItemWidget extends StatelessWidget {
  final CartProductModel product;
  final VoidCallback onDecrease;
  final VoidCallback onIncrease;

  CartItemWidget({
    required this.product,
    required this.onDecrease,
    required this.onIncrease,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      child: Row(
        children: [
          Image.network(
            product.image,
            width: 130,
            height: 130,
            fit: BoxFit.cover,
          ),
          SizedBox(width: 24),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  product.name,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5),
                Text(
                  '\$${product.price}',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.greenAccent.shade700,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                QuantityRowWidget(
                  product: product,
                  onDecrease: onDecrease,
                  onIncrease: onIncrease,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class QuantityRowWidget extends StatelessWidget {
  final CartProductModel product;
  final VoidCallback onDecrease;
  final VoidCallback onIncrease;

  QuantityRowWidget({
    required this.product,
    required this.onDecrease,
    required this.onIncrease,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            color: Colors.grey[200],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: Icon(Icons.remove),
                onPressed: onDecrease,
              ),
              Text(
                product.quantity.toString(),
                style: TextStyle(fontSize: 16),
              ),
              IconButton(
                icon: Icon(Icons.add),
                onPressed: onIncrease,
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 12),
          height: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            color: Colors.grey[200],
          ),
          child: IconButton(
            icon: Icon(Icons.delete),
            color: Colors.red,
            onPressed: () {
              final CartViewModel cartController = Get.find();
              cartController.removeFromCart(product);
            },
          ),
        )
      ],
    );
  }
}

class CheckoutButtonWidget extends StatelessWidget {
  final double totalAmount;

  CheckoutButtonWidget({required this.totalAmount});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      color: Colors.grey[200],
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "TOTAL",
                style: TextStyle(color: Colors.grey),
              ),
              Text(
                '\$${totalAmount.toStringAsFixed(2)}',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.greenAccent.shade700,
                ),
              ),
            ],
          ),
          MaterialButton(
            onPressed: () {
              // Handle checkout logic
            },
            color: Colors.greenAccent.shade700,
            child: Text(
              'Checkout',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
