import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.hintText,
    this.label,
    this.filled,
    this.fillColor,
    this.prefixIcon,
    this.suffixIcon,
    this.onTap,
    this.validator,
    this.obscureText,
    this.controller,
    this.keyboardType,
    this.textAlign,
    this.maxLines,
    this.errorStyle,
    this.hintStyle,
    this.onChanged,
    this.onSaved,
    this.border,
    this.enabledBorder,
    this.focusedBorder,
    this.focusNode,
    this.onFieldSubmitted,
  });
  final String? hintText;
  final Function(dynamic)? onChanged;
  final Function(dynamic)? onSaved;
  final Function(dynamic)? onFieldSubmitted;
  final Widget? label;
  final bool? filled;
  final Color? fillColor;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Function()? onTap;
  final String? Function(String?)? validator;
  final bool? obscureText;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextStyle? errorStyle;
  final TextStyle? hintStyle;
  final InputBorder? border;
  final InputBorder? enabledBorder;
  final InputBorder? focusedBorder;
  final FocusNode? focusNode;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: focusNode,
      maxLines: obscureText == true ? 1 : maxLines,
      textAlign: textAlign ?? TextAlign.start,
      onTap: onTap,
      validator: validator,
      onChanged: onChanged,
      onSaved: onSaved,
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText ?? false,
      onTapUpOutside: (event) {
        FocusScope.of(context).unfocus();
      },
      onFieldSubmitted: onFieldSubmitted,
      decoration: InputDecoration(
        hintStyle: hintStyle,
        errorStyle: errorStyle,
        contentPadding: EdgeInsets.zero,
        hintText: hintText,
        label: label,
        border: border,
        enabledBorder: enabledBorder,
        focusedBorder: focusedBorder,
        filled: filled,
        fillColor: fillColor,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
      ),
    );
  }
}
