import 'package:ecommerce_app/core/utils/constants.dart';
import 'package:ecommerce_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomButtonSocial extends StatelessWidget {
  const CustomButtonSocial({
    super.key,
    required this.text,
    required this.assetImagePath,
  });

  final String text;
  final String assetImagePath;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      elevation: 0,
      height: 45,
      minWidth: double.infinity,
      color: Colors.white,
      onPressed: () {},
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
          side: const BorderSide(
            color: buttonBorderColor,
          )),
      child: Row(
        children: [
          Expanded(
            child: Image.asset(
              assetImagePath,
              height: 20,
            ),
          ),
          Text(
            text,
            style: Styles.textStyle14.copyWith(fontWeight: FontWeight.w500),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
