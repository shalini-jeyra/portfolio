import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../data/portfolio_data.dart';
import '../../utils/theme.dart';
import '../../widgets/common_widgets.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isWide = MediaQuery.of(context).size.width > 900;
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isWide ? 80 : 24,
        vertical: 80,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionLabel('Career'),
          const SizedBox(height: 16),
          Text('Experience', style: Theme.of(context).textTheme.displaySmall),
          const SizedBox(height: 8),
          Text(
            'Where I\'ve worked and what I\'ve built.',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(height: 48),
          ...PortfolioData.experiences.asMap().entries.map((entry) {
            final i = entry.key;
            final exp = entry.value;
            return _ExperienceItem(
              experience: exp,
              index: i,
              isLast: i == PortfolioData.experiences.length - 1,
            );
          }),
        ],
      ),
    );
  }
}

class _ExperienceItem extends StatelessWidget {
  final dynamic experience;
  final int index;
  final bool isLast;

  const _ExperienceItem({
    required this.experience,
    required this.index,
    required this.isLast,
  });

  @override
  Widget build(BuildContext context) {
    final isWide = MediaQuery.of(context).size.width > 700;
    return Stack(
      children: [
        // Timeline Line
        if (!isLast)
          Positioned(
            left: 15,
            top: 22,
            bottom: 0,
            width: 2,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    AppColors.goldAccent.withOpacity(0.4),
                    AppColors.divider,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
          ),
        
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Timeline Dot
            SizedBox(
              width: 32,
              child: Align(
                alignment: Alignment.topCenter,
                child: Container(
                  width: 14,
                  height: 14,
                  margin: const EdgeInsets.only(top: 4),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: experience.isCurrent
                        ? AppColors.goldGradient
                        : null,
                    color: experience.isCurrent
                        ? null
                        : AppColors.cardBorder,
                    border: experience.isCurrent
                        ? null
                        : Border.all(
                            color: AppColors.divider, width: 2),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 20),
            // Content
            Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Role + period
                  isWide
                      ? Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(child: _roleTitle(context)),
                            const SizedBox(width: 16),
                            _period(context),
                          ],
                        )
                      : Column(
                          crossAxisAlignment:
                              CrossAxisAlignment.start,
                          children: [
                            _roleTitle(context),
                            const SizedBox(height: 4),
                            _period(context),
                          ],
                        ),
                  const SizedBox(height: 4),
                  Text(
                    experience.company,
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.copyWith(
                          color: AppColors.goldAccent,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    experience.description,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 16),
                  // Highlights
                  ...experience.highlights.map(
                    (h) => Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Row(
                        crossAxisAlignment:
                            CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(top: 6),
                            child: Icon(
                              Icons.arrow_right_rounded,
                              size: 16,
                              color: AppColors.goldAccent,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              h,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
                                    color: AppColors.offWhite
                                        .withOpacity(0.85),
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      ],
    )
        .animate()
        .fadeIn(
          delay: Duration(milliseconds: 150 * index),
          duration: 500.ms,
        )
        .slideX(begin: -0.04, end: 0);
  }

  Widget _roleTitle(BuildContext context) {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        Text(
          experience.role,
          style:
              Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontSize: 20,
                  ),
        ),
        if (experience.isCurrent) ...[
          const SizedBox(width: 10),
          Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            decoration: BoxDecoration(
              color: AppColors.goldAccent.withOpacity(0.15),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Text(
              'Current',
              style:
                  Theme.of(context).textTheme.labelLarge?.copyWith(
                        fontSize: 10,
                      ),
            ),
          ),
        ],
      ],
    );
  }

  Widget _period(BuildContext context) {
    return Text(
      experience.period,
      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: AppColors.offWhiteMuted.withOpacity(0.6),
            fontFamily: 'monospace',
          ),
    );
  }
}
