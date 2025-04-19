import 'package:blood_donation_app/util/appstyles.dart';
import 'package:flutter/material.dart';


class CommonTextField extends StatelessWidget{
const CommonTextField({
  super.key, required this.hintText,
  required this.textInputType, this.obscureText,
  required this.controller});

final String hintText;
final TextInputType textInputType;
final bool? obscureText;
final TextEditingController controller;


@override
Widget build(BuildContext context){
return TextFormField(
  keyboardType: textInputType,
  controller: controller,
  style: AppStyles.normalTextStyle.copyWith(color: Colors.black),
  decoration: InputDecoration(
    hintText: hintText,
    hintStyle: AppStyles.normalTextStyle.copyWith(color: Colors.black),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(30),
      borderSide: const BorderSide(color: Colors.black,width: 1.0),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(30),
      borderSide: const BorderSide(color:Colors.black,width:1.0),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(30),
      borderSide: const BorderSide(color:Colors.black,width:1.0),
    ),
    contentPadding: const EdgeInsets.symmetric(horizontal: 10.0),
  ),
);
}
}
