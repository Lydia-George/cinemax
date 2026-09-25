import 'package:cinemax/core/theme/app_colors.dart';
import 'package:cinemax/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

import '../../../core/theme/app_spacing.dart';

class AuthHeader extends StatelessWidget {
  final String screenName;
  final String title;
  final String subTitle;

  const AuthHeader({
    super.key,
    required this.screenName,
    required this.title,
    required this.subTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 40,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Text(screenName, style: AppTextStyles.authAppBar),
              Align(
                alignment: Alignment.centerLeft,
                child: IconButton(
                  onPressed: () => Navigator.of(context).maybePop(),
                  icon: Icon(Icons.chevron_left, size: 22),
                  style: IconButton.styleFrom(
                    backgroundColor: AppColors.inputBorder,
                    minimumSize: const Size(32, 32),
                    padding: EdgeInsets.zero,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: AppSpacing.xxl),
        Text(
          title,
          textAlign: TextAlign.center,
          style: AppTextStyles.authTitle,
        ),
        const SizedBox(height: 6),
        Text(
          subTitle,
          textAlign: TextAlign.center,
          style: AppTextStyles.authSubtitle,
        ),
      ],
    );
  }
}
