import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import '../../data/portfolio_data.dart';
import '../../utils/theme.dart';
import '../../widgets/common_widgets.dart';

class HeroSection extends StatelessWidget {
  final VoidCallback onContactTap;
  final VoidCallback onProjectsTap;

  const HeroSection({
    super.key,
    required this.onContactTap,
    required this.onProjectsTap,
  });

  @override
  Widget build(BuildContext context) {
    final info = PortfolioData.info;
    final isWide = MediaQuery.of(context).size.width > 900;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isWide ? 80 : 24,
        vertical: isWide ? 100 : 60,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Availability badge
          AnimatedSection(
            child: Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
              decoration: BoxDecoration(
                color: AppColors.goldAccent.withOpacity(0.12),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                    color: AppColors.goldAccent.withOpacity(0.3)),
              ),
              child: Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  Container(
                    width: 8,
                    height: 8,
                    decoration: const BoxDecoration(
                      color: Color(0xFF4ADE80),
                      shape: BoxShape.circle,
                    ),
                  )
                      .animate(onPlay: (c) => c.repeat())
                      .scale(
                        begin: const Offset(1, 1),
                        end: const Offset(1.3, 1.3),
                        duration: 1000.ms,
                      )
                      .then()
                      .scale(
                        begin: const Offset(1.3, 1.3),
                        end: const Offset(1, 1),
                        duration: 1000.ms,
                      ),
                  const SizedBox(width: 8),
                  Text(
                    'Available for freelance projects',
                    style:
                        Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: AppColors.goldAccentLight,
                              fontWeight: FontWeight.w500,
                            ),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 32),

          // Name
          AnimatedSection(
            delayMs: 100,
            child: Text(
              'Hi, I\'m',
              style:
                  Theme.of(context).textTheme.headlineMedium?.copyWith(
                        color: AppColors.offWhiteMuted,
                        fontWeight: FontWeight.w400,
                      ),
            ),
          ),
          AnimatedSection(
            delayMs: 150,
            child: GradientText(
              info.name,
              style: Theme.of(context).textTheme.displayLarge?.copyWith(
                    fontSize: isWide ? 80 : 52,
                  ),
            ),
          ),

          const SizedBox(height: 16),

          // Animated role
          AnimatedSection(
            delayMs: 200,
            child: Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                Text(
                  'I build ',
                  style:
                      Theme.of(context).textTheme.displaySmall?.copyWith(
                            color: AppColors.offWhiteMuted,
                            fontWeight: FontWeight.w400,
                            fontSize: isWide ? 28 : 20,
                          ),
                ),
                AnimatedTextKit(
                  repeatForever: true,
                  animatedTexts: [
                    TyperAnimatedText(
                      'beautiful Flutter apps.',
                      textStyle: Theme.of(context)
                          .textTheme
                          .displaySmall
                          ?.copyWith(
                            color: AppColors.goldAccent,
                            fontSize: isWide ? 28 : 20,
                          ),
                      speed: const Duration(milliseconds: 60),
                    ),
                    TyperAnimatedText(
                      'cross-platform experiences.',
                      textStyle: Theme.of(context)
                          .textTheme
                          .displaySmall
                          ?.copyWith(
                            color: AppColors.goldAccentLight,
                            fontSize: isWide ? 28 : 20,
                          ),
                      speed: const Duration(milliseconds: 60),
                    ),
                    TyperAnimatedText(
                      'performant mobile products.',
                      textStyle: Theme.of(context)
                          .textTheme
                          .displaySmall
                          ?.copyWith(
                            color: AppColors.goldAccentLight,
                            fontSize: isWide ? 28 : 20,
                          ),
                      speed: const Duration(milliseconds: 60),
                    ),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(height: 28),

          // Bio
          AnimatedSection(
            delayMs: 300,
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 620),
              child: Text(
                info.bio,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontSize: 17,
                      height: 1.8,
                    ),
              ),
            ),
          ),

          const SizedBox(height: 40),

          // Stats row
          AnimatedSection(
            delayMs: 400,
            child: Wrap(
              spacing: 40,
              runSpacing: 20,
              children: [
                _stat(context, '${info.yearsOfExperience}', 'Years Experience'),
                _stat(context, '${PortfolioData.projects.length}+', 'Projects Shipped'),
                _stat(context, '50k+', 'App Users'),
                _stat(context, '4.7★', 'Avg App Rating'),
              ],
            ),
          ),

          const SizedBox(height: 48),

          // CTA buttons
          AnimatedSection(
            delayMs: 500,
            child: Wrap(
              spacing: 16,
              runSpacing: 12,
              children: [
                PrimaryButton(
                  label: 'View Projects',
                  icon: Icons.arrow_forward_rounded,
                  onTap: onProjectsTap,
                ),
                GhostButton(
                  label: 'Get in Touch',
                  icon: Icons.mail_outline_rounded,
                  onTap: onContactTap,
                ),
              ],
            ),
          ),

          const SizedBox(height: 48),

          // Location
          AnimatedSection(
            delayMs: 600,
            child: Row(
              children: [
                const Icon(Icons.location_on_outlined,
                    size: 16, color: AppColors.offWhiteMuted),
                const SizedBox(width: 6),
                Text(
                  info.location,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _stat(BuildContext context, String value, String label) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ShaderMask(
          shaderCallback: (bounds) =>
              AppColors.goldGradient.createShader(bounds),
          child: Text(
            value,
            style: Theme.of(context).textTheme.displaySmall?.copyWith(
                  color: Colors.white,
                  fontSize: 36,
                  fontWeight: FontWeight.w700,
                ),
          ),
        ),
        Text(
          label,
          style: Theme.of(context)
              .textTheme
              .bodyMedium
              ?.copyWith(fontSize: 13),
        ),
      ],
    );
  }
}
