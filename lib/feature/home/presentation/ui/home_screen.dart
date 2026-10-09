import 'package:cinemax/core/constants/images_strings.dart';
import 'package:cinemax/core/theme/app_spacing.dart';
import 'package:cinemax/feature/home/presentation/cubit/movies_cubit.dart';
import 'package:cinemax/feature/home/presentation/cubit/movies_state.dart';
import 'package:cinemax/feature/home/widgets/home_header.dart';
import 'package:cinemax/feature/home/widgets/home_search_bar.dart';
import 'package:cinemax/feature/home/widgets/movie_categories.dart';
import 'package:cinemax/feature/home/widgets/movies_banner.dart';
import 'package:cinemax/feature/home/widgets/popular_movies_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(AppSpacing.lg),
              child: HomeHeader(
                avatar: const AssetImage(ImagesStrings.userAvatar),
                onWishlistPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Wishlist is not connected yet'),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.lg,
              ),
              child: HomeSearchBar(
                onSearchPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Search screen is coming next'),
                    ),
                  );
                },
                onFilterPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Search filters are coming next'),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: AppSpacing.lg),
            Expanded(
              child: BlocBuilder<MoviesCubit, MoviesState>(
                builder: (context, state) {
                  switch (state.status) {
                    case MoviesStatus.initial:
                    case MoviesStatus.loading:
                      return const Center(
                        child: CircularProgressIndicator(),
                      );

                    case MoviesStatus.error:
                      return Center(
                        child: Text(
                          state.errorMessage ?? 'Could not load movies.',
                          textAlign: TextAlign.center,
                        ),
                      );

                    case MoviesStatus.success:
                      if (state.movies.isEmpty) {
                        return const Center(
                          child: Text('No Movies Found'),
                        );
                      }

                      return ListView(
                        padding: const EdgeInsets.only(
                          bottom: AppSpacing.lg,
                        ),
                        children: [
                          MoviesBanner(
                            movies: state.movies.take(3).toList(),
                          ),
                          const SizedBox(height: AppSpacing.lg),
                          MovieCategories(
                            genres: state.genres,
                            selectedGenreId: state.selectedGenreId,
                            onGenreSelected: (genreId) {
                              context
                                  .read<MoviesCubit>()
                                  .selectGenre(genreId);
                            },
                          ),
                          const SizedBox(height: AppSpacing.lg),
                          PopularMoviesSection(
                            movies: state.filteredMovies,
                            genres: state.genres,
                          ),
                        ],
                      );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}