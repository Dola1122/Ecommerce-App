import 'package:ecommerce_app/core/view_model/profile_view_model.dart';
import 'package:ecommerce_app/view/auth/login_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileViewModel>(
      init: ProfileViewModel(),
      builder: (controller) => Scaffold(
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 18),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 60,
                      backgroundImage: NetworkImage(
                        'https://image.winudf.com/v2/image1/bmV0LndsbHBwci5ib3lzX3Byb2ZpbGVfcGljdHVyZXNfc2NyZWVuXzBfMTY2NzUzNzYxN18wOTk/screen-0.webp?fakeurl=1&type=.webp',
                      ),
                    ),
                    SizedBox(width: 24),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'John Doe',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'john.doe@example.com',
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Divider(),
              ListTile(
                leading: Container(
                  padding: EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: Colors.greenAccent.shade100.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Icon(Icons.edit, color: Colors.black),
                ),
                title: Text('Edit Profile'),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.black,
                ),
                onTap: () {
                  // Handle Edit Profile tap
                },
              ),
              ListTile(
                leading: Container(
                  padding: EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: Colors.greenAccent.shade100.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Icon(Icons.location_on, color: Colors.black),
                ),
                title: Text('Shipping Address'),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.black,
                ),
                onTap: () {
                  // Handle Shipping Address tap
                },
              ),
              ListTile(
                leading: Container(
                  padding: EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: Colors.greenAccent.shade100.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Icon(Icons.history, color: Colors.black),
                ),
                title: Text('Order History'),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.black,
                ),
                onTap: () {
                  // Handle Order History tap
                },
              ),
              ListTile(
                leading: Container(
                  padding: EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: Colors.greenAccent.shade100.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Icon(Icons.credit_card, color: Colors.black),
                ),
                title: Text('Cards'),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.black,
                ),
                onTap: () {
                  // Handle Cards tap
                },
              ),
              ListTile(
                leading: Container(
                  padding: EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: Colors.greenAccent.shade100.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Icon(Icons.notifications, color: Colors.black),
                ),
                title: Text('Notifications'),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.black,
                ),
                onTap: () {
                  // Handle Notifications tap
                },
              ),
              ListTile(
                leading: Container(
                  padding: EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: Colors.greenAccent.shade100.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Icon(Icons.logout, color: Colors.black),
                ),
                title: Text('Log Out'),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.black,
                ),
                onTap: () {
                  // Handle Log Out tap
                  controller.signOut();
                  Get.offAll(LoginView());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
