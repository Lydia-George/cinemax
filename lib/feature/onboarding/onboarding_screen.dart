import 'package:cinemax/core/constants/app_strings.dart';
import 'package:cinemax/core/constants/images_strings.dart';
import 'package:cinemax/core/theme/app_colors.dart';
import 'package:cinemax/core/theme/app_spacing.dart';
import 'package:cinemax/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  static const List<String> _images = [
    ImagesStrings.onboarding1,
    ImagesStrings.onboarding2,
    ImagesStrings.onboarding3,
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _nextPage() {
    if (_currentPage < _images.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
      return;
    }

    // هنبدّل الرسالة بالانتقال إلى Login بعد إنشاء شاشتها.
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Login screen is next')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(
            AppSpacing.lg,
            AppSpacing.md,
            AppSpacing.lg,
            AppSpacing.lg,
          ),
          child: LayoutBuilder(
            builder: (context, constraints) {
              return Column(
                children: [
                  SizedBox(
                    height: constraints.maxHeight * 0.47,
                    child: PageView.builder(
                      controller: _pageController,
                      itemCount: _images.length,
                      onPageChanged: (index) {
                        setState(() => _currentPage = index);
                      },
                      itemBuilder: (context, index) {
                        return Center(
                          child: Image.asset(
                            _images[index],
                            fit: BoxFit.contain,
                          ),
                        );
                      },
                    ),
                  ),

                  const SizedBox(height: AppSpacing.md),

                  const Text(
                    AppStrings.onboardingTitle,
                    textAlign: TextAlign.center,
                    style: AppTextStyles.onboardingTitle,
                  ),

                  const SizedBox(height: AppSpacing.sm),

                  const Text(
                    AppStrings.onboardingDescription,
                    textAlign: TextAlign.center,
                    style: AppTextStyles.onboardingDescription,
                  ),

                  const Spacer(),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: List.generate(_images.length, (index) {
                          final isActive = index == _currentPage;

                          return AnimatedContainer(
                            duration: const Duration(milliseconds: 250),
                            margin: const EdgeInsets.only(right: 6),
                            width: isActive ? 24 : 5,
                            height: 5,
                            decoration: BoxDecoration(
                              color: isActive
                                  ? AppColors.accentColor
                                  : AppColors.accentColor.withValues(
                                alpha: 0.45,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          );
                        }),
                      ),

                      SizedBox(
                        width: 46,
                        height: 46,
                        child: FilledButton(
                          onPressed: _nextPage,
                          style: FilledButton.styleFrom(
                            backgroundColor: AppColors.accentColor,
                            foregroundColor: AppColors.backgroundColor,
                            padding: EdgeInsets.zero,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: const Icon(Icons.chevron_right),
                        ),
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}