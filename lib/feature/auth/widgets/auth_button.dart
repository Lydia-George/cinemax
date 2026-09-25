import 'package:cinemax/core/theme/app_colors.dart';
import 'package:cinemax/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/app_strings.dart';

class AuthButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;

  const AuthButton({
    super.key,
    required this.title,
    required this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 54,
      child: FilledButton(
        onPressed: onPressed,
        style: FilledButton.styleFrom(
          backgroundColor: AppColors.accentColor,
          foregroundColor: AppColors.backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(28),
          )
        ),
        child: Text(title, style: AppTextStyles.button,),
      ),
    );
  }
}
