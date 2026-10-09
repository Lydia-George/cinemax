import 'package:cinemax/core/constants/app_strings.dart';
import 'package:cinemax/core/theme/app_colors.dart';
import 'package:cinemax/core/theme/app_spacing.dart';
import 'package:cinemax/core/theme/app_text_styles.dart';
import 'package:cinemax/feature/home/data/models/genre_model.dart';
import 'package:flutter/material.dart';

class MovieCategories extends StatelessWidget {
  final List<GenreModel> genres;
  final int? selectedGenreId;
  final ValueChanged<int?> onGenreSelected;

  const MovieCategories({
    super.key,
    required this.genres,
    required this.selectedGenreId,
    required this.onGenreSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(padding: EdgeInsets.symmetric(horizontal: AppSpacing.lg),
          child: Text(AppStrings.categories, style: AppTextStyles.homeGreeting,),
          ),
          SizedBox(height: AppSpacing.sm,),
          SizedBox(height: 48,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(
                horizontal: AppSpacing.lg,
              ),
              itemCount: genres.length +1,
            separatorBuilder: (_, _) => const SizedBox(
              width: AppSpacing.xs,
            ),
              itemBuilder: (context, index){
            final GenreModel? genre = index == 0 ? null : genres[index -1];

            final isSelected = selectedGenreId == genre?.id;

            return ChoiceChip(label: Text(genre?.name ?? AppStrings.allCategories),
                selected: isSelected,
            onSelected: (_) => onGenreSelected(genre?.id),
              showCheckmark: false,
              backgroundColor: AppColors.backgroundColor,
              selectedColor:AppColors.accentColor.withValues(alpha: 0.12),
              labelStyle: AppTextStyles.categoryLabel.copyWith(
                color: isSelected ? AppColors.accentColor : AppColors.textPrimary,
              ),
              side: BorderSide.none,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8)
              ),
            );
          },

              ),
          )
        ]);
  }
}
