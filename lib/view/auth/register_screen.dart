import 'package:ecommerce_app/core/utils/constants.dart';
import 'package:ecommerce_app/core/utils/styles.dart';
import 'package:ecommerce_app/core/view_model/auth_view_model.dart';
import 'package:ecommerce_app/view/widgets/custom_button.dart';
import 'package:ecommerce_app/view/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterScreen extends GetWidget<AuthViewModel> {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // PreferredSize(
      //   preferredSize: Size.fromHeight(130.0),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.arrow_back_ios_outlined,
            color: Colors.black,
          ),
        ),
      ),
      body: Container(
        color: Colors.white,
        padding: const EdgeInsets.only(left: 16, right: 16, top: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.25),
                      spreadRadius: 1,
                      blurRadius: 10,
                      offset: Offset(0, 2), // changes position of shadow
                    ),
                  ],
                ),
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Welcome,",
                          style: Styles.textStyle30,
                        ),
                        Text(
                          "Sign Up",
                          style:
                              Styles.textStyle18.copyWith(color: customGreen),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Align(
                      child: Text(
                        "Sign in to Continue",
                        style: Styles.textStyle14.copyWith(color: Colors.grey),
                      ),
                      alignment: Alignment.centerLeft,
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    CustomTextFormField(
                      label: "Name",
                      hintText: "David Spade",
                      onChanged: (String value) {
                        controller.name = value;
                      },
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    CustomTextFormField(
                      label: "Email",
                      hintText: "iamdavid@gmail.com",
                      onChanged: (String value) {
                        controller.email = value;
                      },
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    CustomTextFormField(
                      label: "Password",
                      hintText: "* * * * * * * *",
                      onChanged: (String value) {
                        controller.password = value;
                      },
                    ),
                    SizedBox(
                      height: 60,
                    ),
                    CustomButton(
                      text: "SIGN UP",
                      onPressed: () {
                        controller.signUpWithEmailAndPassword();
                      },
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
