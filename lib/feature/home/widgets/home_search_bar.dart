import 'package:cinemax/core/constants/app_strings.dart';
import 'package:cinemax/core/theme/app_colors.dart';
import 'package:cinemax/core/theme/app_spacing.dart';
import 'package:cinemax/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class HomeSearchBar extends StatelessWidget {
  final VoidCallback onSearchPressed;
  final VoidCallback onFilterPressed;

  const HomeSearchBar({
    super.key,
    required this.onSearchPressed,
    required this.onFilterPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.inputBorder,
      borderRadius: BorderRadius.circular(24),
      clipBehavior: Clip.antiAlias,
      child: Row(
        children: [
          Expanded(
            child: InkWell(
              onTap: onSearchPressed,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: AppSpacing.md,
                  vertical: AppSpacing.md,
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.search,
                      size: 20,
                      color: AppColors.textSecondary,
                    ),
                    SizedBox(width: AppSpacing.sm),
                    Expanded(
                      child: Text(
                        AppStrings.searchHint,
                        style: AppTextStyles.inputHint,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
            child: VerticalDivider(color: AppColors.textSecondary, width: 1),
          ),
          IconButton(
            onPressed: onFilterPressed,
            tooltip: AppStrings.searchFilters,
            icon: Icon(Icons.tune, size: 20, color: AppColors.textPrimary),
          ),
        ],
      ),
    );
  }
}
