import 'package:cinemax/core/constants/app_strings.dart';
import 'package:cinemax/core/constants/images_strings.dart';
import 'package:cinemax/core/theme/app_colors.dart';
import 'package:cinemax/core/theme/app_spacing.dart';
import 'package:cinemax/core/theme/app_text_styles.dart';
import 'package:cinemax/feature/auth/login/presentation/ui/login_screen.dart';
import 'package:cinemax/feature/auth/signup/presentation/ui/signup_screen.dart';
import 'package:cinemax/feature/auth/widgets/auth_button.dart';
import 'package:flutter/material.dart';

class LoginOrSignupScreen extends StatelessWidget {
  const LoginOrSignupScreen({super.key});

  void _openScreen(BuildContext context, Widget screen) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(builder: (_) => screen),
    );
  }

  void _showSocialMessage(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Social sign up is not connected yet')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.lg,
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: constraints.maxHeight * 0.18),

                      Image.asset(
                        ImagesStrings.appIconLogo,
                        height: 88,
                        width: 88,
                        fit: BoxFit.contain,
                      ),
                      const SizedBox(height: AppSpacing.md),

                      Text(
                        AppStrings.appName,
                        style: AppTextStyles.appName,
                      ),
                      const SizedBox(height: 4),

                      Text(
                        AppStrings.subTitle,
                        textAlign: TextAlign.center,
                        style: AppTextStyles.authSubtitle,
                      ),

                      SizedBox(height: constraints.maxHeight * 0.075),

                      AuthButton(
                        title: AppStrings.signupButtonTitle,
                        onPressed: () => _openScreen(
                          context,
                          const SignupScreen(),
                        ),
                      ),
                      const SizedBox(height: AppSpacing.xl),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            AppStrings.alreadyHaveAccount,
                            style: AppTextStyles.welcomeFooter,
                          ),
                          GestureDetector(
                            onTap: () => _openScreen(
                              context,
                              const LoginScreen(),
                            ),
                            child: const Text(
                              AppStrings.loginButtonTitle,
                              style: TextStyle(
                                color: AppColors.accentColor,
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: AppSpacing.xxl),

                      Row(
                        children: [
                          const Expanded(
                            child: Divider(color: AppColors.inputBorder),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: AppSpacing.sm,
                            ),
                            child: Text(
                              AppStrings.orSignUpWith,
                              style: AppTextStyles.welcomeSubtitle,
                            ),
                          ),
                          const Expanded(
                            child: Divider(color: AppColors.inputBorder),
                          ),
                        ],
                      ),

                      const SizedBox(height: AppSpacing.lg),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _SocialButton(
                            backgroundColor: Colors.white,
                            onPressed: () => _showSocialMessage(context),
                            child: const Text(
                              'G',
                              style: TextStyle(
                                color: Color(0xFF4285F4),
                                fontSize: 29,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(width: AppSpacing.xl),
                          _SocialButton(
                            backgroundColor: const Color(0xFF4267A9),
                            onPressed: () => _showSocialMessage(context),
                            child: const Icon(
                              Icons.facebook,
                              color: Colors.white,
                              size: 29,
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: AppSpacing.xxl),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class _SocialButton extends StatelessWidget {
  const _SocialButton({
    required this.backgroundColor,
    required this.onPressed,
    required this.child,
  });

  final Color backgroundColor;
  final VoidCallback onPressed;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 64,
      height: 64,
      child: IconButton(
        onPressed: onPressed,
        icon: child,
        style: IconButton.styleFrom(
          backgroundColor: backgroundColor,
          shape: const CircleBorder(),
        ),
      ),
    );
  }
}