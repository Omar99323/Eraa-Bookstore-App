import 'package:book_store_eraa/Core/utils/app_colors.dart';
import 'package:book_store_eraa/Core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class CustomFormField extends StatelessWidget {
  const CustomFormField(
      {super.key,
      this.controller,
      this.inputType,
      this.obscuretext = false,
      this.hinttext,
      this.prefixicon, this.validator});
      
  final TextEditingController? controller;
  final TextInputType? inputType;
  final bool obscuretext;
  final String? hinttext;
  final Icon? prefixicon;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscuretext,
      keyboardType: inputType,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(15),
        prefixIcon: prefixicon,
        hintStyle: AppStyles.textStyle34w900.copyWith(
          fontSize: 20,
        ),
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
