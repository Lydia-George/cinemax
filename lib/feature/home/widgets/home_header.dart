import 'package:cinemax/core/theme/app_colors.dart';
import 'package:cinemax/core/theme/app_spacing.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/app_strings.dart';
import '../../../core/theme/app_text_styles.dart';

class HomeHeader extends StatelessWidget {
  final ImageProvider avatar;
  final VoidCallback onWishlistPressed;

  const HomeHeader({
    super.key,
    required this.avatar,
    required this.onWishlistPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(radius: 20, backgroundImage: avatar),
        const SizedBox(width: AppSpacing.md),
        const Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(AppStrings.homeGreeting, style: AppTextStyles.homeGreeting),
              SizedBox(height: 4),
              Text(AppStrings.homeSubtitle, style: AppTextStyles.homeSubtitle),
            ],
          ),
        ),
        const SizedBox(width: AppSpacing.xs),
        IconButton(
          onPressed: onWishlistPressed,
          tooltip: 'Wishlist',
          icon: Icon(Icons.favorite, color: Colors.redAccent),
          style: IconButton.styleFrom(
            backgroundColor: AppColors.inputBorder,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
      ],
    );
  }
}
