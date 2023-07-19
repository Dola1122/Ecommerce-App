import 'package:ecommerce_app/core/utils/constants.dart';
import 'package:ecommerce_app/core/utils/styles.dart';
import 'package:ecommerce_app/core/view_model/auth_view_model.dart';
import 'package:ecommerce_app/view/auth/register_view.dart';
import 'package:ecommerce_app/view/widgets/custom_button.dart';
import 'package:ecommerce_app/view/widgets/custom_button_social.dart';
import 'package:ecommerce_app/view/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginView extends GetWidget<AuthViewModel> {
  LoginView({Key? key}) : super(key: key);

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
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
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Welcome,",
                            style: Styles.textStyle30,
                          ),
                          InkWell(
                            onTap: () {
                              Get.to(RegisterScreen());
                            },
                            child: Text(
                              "Sign Up",
                              style: Styles.textStyle18
                                  .copyWith(color: customGreen),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Align(
                        child: Text(
                          "Sign in to Continue",
                          style:
                              Styles.textStyle14.copyWith(color: Colors.grey),
                        ),
                        alignment: Alignment.centerLeft,
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      CustomTextFormField(
                          label: "Email",
                          hintText: "iamdavid@gmail.com",
                          onChanged: (value) {
                            controller.email = value;
                          }),
                      SizedBox(
                        height: 40,
                      ),
                      CustomTextFormField(
                          label: "Password",
                          hintText: "* * * * * * * * ",
                          onChanged: (value) {
                            controller.password = value;
                          }),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: Align(
                          child: Text(
                            "Forgot Password?",
                            style: Styles.textStyle14,
                          ),
                          alignment: Alignment.centerRight,
                        ),
                      ),
                      CustomButton(
                        text: "SIGN IN",
                        onPressed: () async {
                          await controller.signInWithEmailAndPassword();
                        },
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 28,
              ),
              Text(
                "-OR-",
                style: Styles.textStyle18,
              ),
              // Spacer(),
              SizedBox(
                height: 20,
              ),
              CustomButtonSocial(
                text: "Sign In with Facebook",
                assetImagePath: 'assets/images/facebook.png',
                onPressed: () async {
                  await controller.signInWithFacebook();
                },
              ),
              SizedBox(
                height: 20,
              ),
              CustomButtonSocial(
                text: "Sign In with Google",
                assetImagePath: 'assets/images/google.png',
                onPressed: () async {
                  await controller.signInWithGoogle();
                },
              ),
              // Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
