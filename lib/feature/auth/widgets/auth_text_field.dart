import 'package:cinemax/core/theme/app_colors.dart';
import 'package:cinemax/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class AuthTextField extends StatefulWidget {
  const AuthTextField({
    super.key,
    required this.controller,
    required this.label,
    required this.hintText,
    this.validator,
    this.keyboardType,
    this.isPassword = false,
    this.onChanged,
  });

  final TextEditingController controller;
  final String label;
  final String hintText;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final bool isPassword;
  final ValueChanged<String>? onChanged;

  @override
  State<AuthTextField> createState() => _AuthTextFieldState();
}

class _AuthTextFieldState extends State<AuthTextField> {
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      validator: widget.validator,
      onChanged: widget.onChanged,
      keyboardType: widget.keyboardType,
      obscureText: widget.isPassword && _obscurePassword,
      style: AppTextStyles.inputText,
      decoration: InputDecoration(
        labelText: widget.label,
        hintText: widget.hintText,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: widget.isPassword
            ? IconButton(
          onPressed: () {
            setState(() {
              _obscurePassword = !_obscurePassword;
            });
          },
          icon: Icon(
            _obscurePassword
                ? Icons.visibility_off_outlined
                : Icons.visibility_outlined,
            color: AppColors.textSecondary,
          ),
        )
            : null,
      ),
    );
  }
}