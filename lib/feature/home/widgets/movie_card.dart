import 'package:cinemax/core/networking/api_constants.dart';
import 'package:cinemax/core/theme/app_colors.dart';
import 'package:cinemax/core/theme/app_spacing.dart';
import 'package:cinemax/core/theme/app_text_styles.dart';
import 'package:cinemax/feature/home/data/models/movie_model.dart';
import 'package:flutter/material.dart';

class MovieCard extends StatelessWidget {
  final MovieModel movie;
  final String genreName;

  const MovieCard({super.key, required this.movie, required this.genreName});

  @override
  Widget build(BuildContext context) {
    final posterPath = movie.posterPath;

    return SizedBox(
      width: 120,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: SizedBox(
              height: 180,
              width: double.infinity,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  ColoredBox(
                    color: AppColors.inputBorder,
                    child: posterPath == null || posterPath.isEmpty
                        ? const Icon(Icons.movie_outlined)
                        : Image.network(
                            '${ApiConstants.imageBaseUrl}$posterPath',
                            fit: BoxFit.cover,
                            errorBuilder: (_, _, _) {
                              return const Icon(Icons.broken_image_outlined);
                            },
                          ),
                  ),
                  Positioned(
                    top: AppSpacing.xs,
                    right: AppSpacing.xs,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 6, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.black.withValues(alpha: 0.65),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(
                            Icons.star_rounded,
                            color: AppColors.ratingColor,
                            size: 14,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            movie.voteAverage.toStringAsFixed(1),
                            style: AppTextStyles.movieRating,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: AppSpacing.xs,),
          Text(movie.title, style: AppTextStyles.movieTitle,maxLines: 1,overflow: TextOverflow.ellipsis,),
          const SizedBox(height: 4,),
          Text(genreName, style: AppTextStyles.movieGenre,maxLines: 1,overflow: TextOverflow.ellipsis,)
        ],
      ),
    );
  }
}
