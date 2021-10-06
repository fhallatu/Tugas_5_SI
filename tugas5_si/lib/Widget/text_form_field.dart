import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {Key? key,
      this.labelText,
      this.hintText,
      this.icon,
      this.validator,
      this.controller})
      : super(key: key);

  final TextEditingController? controller;
  final String? labelText;
  final String? hintText;
  final Icon? icon;
  final String? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      style: const TextStyle(color: Colors.purple),
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        labelText: labelText,
        labelStyle: const TextStyle(color: Colors.purple),
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.purple),
        prefixIcon: icon,
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.purple),
          borderRadius: BorderRadius.circular(20),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.purple),
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}
