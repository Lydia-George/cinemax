import 'package:cinemax/core/theme/app_spacing.dart';
import 'package:cinemax/core/theme/app_text_styles.dart';
import 'package:cinemax/feature/home/data/models/genre_model.dart';
import 'package:cinemax/feature/home/data/models/movie_model.dart';
import 'package:cinemax/feature/home/widgets/movie_card.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/app_strings.dart';

class PopularMoviesSection extends StatelessWidget {
  final List<MovieModel> movies;
  final List<GenreModel> genres;

  const PopularMoviesSection({
    super.key,
    required this.movies,
    required this.genres,
  });

  @override
  Widget build(BuildContext context) {
    final genreNames = {for (final genre in genres) genre.id: genre.name};

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSpacing.lg),
          child: Text(
            AppStrings.mostPopular,
            style: AppTextStyles.homeGreeting,
          ),
        ),
        const SizedBox(height: AppSpacing.md),
        if (movies.isEmpty)
          const Padding(
            padding: EdgeInsets.all(AppSpacing.lg),
            child: Center(
              child: Text(
                AppStrings.noMoviesInCategory,
                textAlign: TextAlign.center,
              ),
            ),
          )
        else
          SizedBox(
            height: 250,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: AppSpacing.lg),
              separatorBuilder: (_, _) => const SizedBox(width: AppSpacing.md),
              itemCount: movies.length,
              itemBuilder: (context, index) {
                final movie = movies[index];

                final genreName = movie.genreIds
                    .map((id) => genreNames[id])
                    .whereType<String>()
                    .take(2)
                    .join(',');

                return MovieCard(movie: movie, genreName: genreName);
              },
            ),
          ),
      ],
    );
  }
}
