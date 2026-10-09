import 'package:cinemax/core/networking/api_constants.dart';
import 'package:cinemax/core/theme/app_spacing.dart';
import 'package:cinemax/core/theme/app_text_styles.dart';
import 'package:cinemax/feature/home/data/models/movie_model.dart';
import 'package:flutter/material.dart';

class MovieBannerCard extends StatelessWidget {
  final MovieModel movie;

  const MovieBannerCard({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    final backdropPath = movie.backdropPath;

    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Stack(
        fit: StackFit.expand,
        children: [
          if (backdropPath != null && backdropPath.isNotEmpty)
            Image.network(
              '${ApiConstants.imageBaseUrl}$backdropPath',
              fit: BoxFit.cover,
              errorBuilder: (_, error, stackTrace) {
                return const Center(child: Icon(Icons.broken_image_outlined));
              },
            )
          else
            const Center(child: Icon(Icons.movie_outlined)),

          DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.transparent, Colors.black87],
              ),
            ),
          ),

          Positioned(
            left: AppSpacing.md,
            right: AppSpacing.md,
            bottom: AppSpacing.md,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  movie.title,
                  style: AppTextStyles.homeGreeting,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                if (movie.releaseDate.isNotEmpty) ...[
                  SizedBox(height: 4),
                  Text(movie.releaseDate, style: AppTextStyles.homeSubtitle),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}
