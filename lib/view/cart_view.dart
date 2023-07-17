import 'package:flutter/material.dart';

class CartView extends StatelessWidget {
  List<String> names = [
    "product1",
    "product2",
    "product3",
    "product4",
    "product5",
  ];
  List<String> images = [
    "assets/images/watch.png",
    "assets/images/watch.png",
    "assets/images/watch.png",
    "assets/images/watch.png",
    "assets/images/watch.png",
  ];
  List<double> prices = [
    110,
    720,
    360,
    320,
    1050,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView.builder(
          itemCount: names.length,
          itemBuilder: (context, index) {
            return CartItemWidget(
              name: names[index],
              image: images[index],
              price: prices[index],
            );
          },
        ),
      ),
      bottomNavigationBar: CheckoutButtonWidget(),
    );
  }
}

class CartItemWidget extends StatelessWidget {
  final String name;
  final String image;
  final double price;

  CartItemWidget({required this.name, required this.image, required this.price});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      child: Row(
        children: [
          Image.asset(
            image,
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
                  name,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5),
                Text(
                  '\$$price', // Use the actual price for the product
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.greenAccent.shade700,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                QuantityRowWidget(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class QuantityRowWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
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
            onPressed: () {
              // Handle decrease quantity logic
            },
          ),
          Text(
            '2', // Replace with the actual quantity for the product
            style: TextStyle(fontSize: 16),
          ),
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              // Handle increase quantity logic
            },
          ),
        ],
      ),
    );
  }
}

class CheckoutButtonWidget extends StatelessWidget {
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
                '\$19.98', // Replace with the actual total amount
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