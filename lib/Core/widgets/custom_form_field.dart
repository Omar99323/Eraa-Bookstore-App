import 'package:book_store_eraa/Core/utils/app_colors.dart';
import 'package:book_store_eraa/Core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class CustomFormField extends StatelessWidget {
  const CustomFormField({
    super.key,
    this.controller,
    this.inputType,
    this.obscuretext = false,
    this.hinttext,
    this.prefixicon,
    this.validator,
    this.initvalue,
    this.disenabled = false,
    this.autofocus = false,
    this.label,
    this.onchange,
  });

  final TextEditingController? controller;
  final TextInputType? inputType;
  final bool obscuretext;
  final bool disenabled;
  final bool autofocus;
  final String? hinttext;
  final String? label;
  final String? initvalue;
  final Icon? prefixicon;
  final String? Function(String?)? validator;
  final Function(String)? onchange;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      initialValue: initvalue,
      autofocus: autofocus,
      readOnly: disenabled,
      obscureText: obscuretext,
      keyboardType: inputType,
      onChanged: onchange,
      decoration: InputDecoration(
        prefixIcon: prefixicon,
        hintStyle: AppStyles.textStyle34w900.copyWith(
          fontSize: 20,
        ),

        labelStyle: AppStyles.textStyle34w900.copyWith(
          fontSize: 14,
          fontWeight: FontWeight.normal,
        ),
        labelText: label,
        hintText: hinttext,
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            width: 2,
            color: AppColors.primaryswatch,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: const BorderSide(
            color: AppColors.primaryswatch,
            width: 1,
          ),
        ),
      ),
      validator: validator,
    );
  }
}
