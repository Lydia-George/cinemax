import 'package:cinemax/core/theme/app_colors.dart';
import 'package:cinemax/core/theme/app_spacing.dart';
import 'package:cinemax/feature/home/data/models/movie_model.dart';
import 'package:cinemax/feature/home/widgets/movie_banner_card.dart';
import 'package:flutter/material.dart';

class MoviesBanner extends StatefulWidget {
  final List<MovieModel> movies;

  const MoviesBanner({super.key, required this.movies});

  @override
  State<MoviesBanner> createState() => _MoviesBannerState();
}

class _MoviesBannerState extends State<MoviesBanner> {
  final PageController _pageController = PageController(viewportFraction: 0.85);

  int _currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.movies.isEmpty) {
      return SizedBox.shrink();
    }

    return Column(
      children: [
        SizedBox(
          height: 180,
          child: PageView.builder(
            controller: _pageController,
            itemCount: widget.movies.length,
            onPageChanged: (index) {
              setState(() => _currentPage = index);
            },
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 6),
                child: MovieBannerCard(movie: widget.movies[index]),
              );
            },
          ),
        ),
        SizedBox(height: AppSpacing.sm),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(widget.movies.length, (index) {
            final isActive = index == _currentPage;

            return AnimatedContainer(
              duration: Duration(milliseconds: 250),
              margin: EdgeInsets.symmetric(horizontal: 3),
              width: isActive ? 24 : 6,
              height: 6,
              decoration: BoxDecoration(
                color: isActive
                    ? AppColors.accentColor
                    : AppColors.accentColor.withValues(alpha: 0.35),
                borderRadius: BorderRadius.circular(12),
              ),
            );
          }),
        ),
      ],
    );
  }
}
