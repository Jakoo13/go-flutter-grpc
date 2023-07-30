import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.labelText,
    this.onChanged,
    this.textInputType = TextInputType.text,
    this.obscureText = false,
    this.errorText,
    this.inputFormatters,
    this.validator,
    this.controller,
  }) : super(key: key);

  final String labelText;
  final Function(String)? onChanged;
  final TextInputType textInputType;
  final bool obscureText;
  final String? errorText;
  final List<TextInputFormatter>? inputFormatters;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * .8,
      height: 60,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Colors.lightBlue,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: TextFormField(
        textAlign: TextAlign.center,
        onChanged: onChanged,
        validator: validator,
        controller: controller,
        keyboardType: textInputType,
        obscureText: obscureText,
        inputFormatters: inputFormatters,
        style: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w500,
          fontSize: 20,
        ),
        decoration: InputDecoration(
          border: InputBorder.none,
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue, width: 1.0),
          ),
          hintText: labelText,
          errorText: errorText,
          hintStyle: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w400,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
