import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../data/portfolio_data.dart';
import '../../utils/theme.dart';
import '../../widgets/common_widgets.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isWide = MediaQuery.of(context).size.width > 900;
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isWide ? 80 : 24,
        vertical: 80,
      ),
      color: AppColors.surface.withOpacity(0.4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionLabel('Expertise'),
          const SizedBox(height: 16),
          Text(
            'Skills & Stack',
            style: Theme.of(context).textTheme.displaySmall,
          ),
          const SizedBox(height: 8),
          Text(
            'Technologies I work with every day.',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(height: 48),
          LayoutBuilder(builder: (context, constraints) {
            final cols = constraints.maxWidth > 700 ? 2 : 1;
            final itemWidth = cols == 1 
                ? constraints.maxWidth 
                : (constraints.maxWidth - (cols - 1) * 20) / cols - 0.1;
            return Wrap(
              spacing: 20,
              runSpacing: 20,
              children: PortfolioData.skills.asMap().entries.map((entry) {
                final i = entry.key;
                final skill = entry.value;
                return SizedBox(
                  width: itemWidth,
                  child: PortfolioCard(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(skill.icon,
                                style: const TextStyle(fontSize: 24)),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Text(
                                skill.category,
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineMedium
                                    ?.copyWith(fontSize: 18),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Wrap(
                          spacing: 8,
                          runSpacing: 8,
                          children: skill.items
                              .map((item) => TagChip(item))
                              .toList(),
                        ),
                      ],
                    ),
                  )
                      .animate()
                      .fadeIn(
                        delay: Duration(milliseconds: 120 * i),
                        duration: 500.ms,
                      )
                      .slideY(begin: 0.06, end: 0),
                );
              }).toList(),
            );
          }),
        ],
      ),
    );
  }
}
