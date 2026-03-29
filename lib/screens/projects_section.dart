import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:url_launcher/url_launcher.dart';
import '../data/portfolio_data.dart';
import '../utils/theme.dart';
import '../widgets/common_widgets.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isWide = MediaQuery.of(context).size.width > 900;
    final featured =
        PortfolioData.projects.where((p) => p.featured).toList();
    final others =
        PortfolioData.projects.where((p) => !p.featured).toList();

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isWide ? 80 : 24,
        vertical: 80,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionLabel('Projects'),
          const SizedBox(height: 16),
          Text(
            'Things I\'ve Built',
            style: Theme.of(context).textTheme.displaySmall,
          ),
          const SizedBox(height: 8),
          Text(
            'A selection of products, tools, and experiments.',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(height: 48),

          // Featured projects grid
          LayoutBuilder(builder: (context, constraints) {
            final cols = constraints.maxWidth > 700 ? 3 : 1;
            final itemWidth = cols == 1 
                ? constraints.maxWidth 
                : (constraints.maxWidth - (cols - 1) * 20) / cols - 0.1;
            return Wrap(
              spacing: 20,
              runSpacing: 20,
              children: featured.asMap().entries.map((entry) {
                return SizedBox(
                  width: itemWidth,
                  child: _ProjectCard(
                    project: entry.value,
                    index: entry.key,
                  ),
                );
              }).toList(),
            );
          }),

          const SizedBox(height: 20),

          // Other projects
          LayoutBuilder(builder: (context, constraints) {
            final cols = constraints.maxWidth > 700 ? 3 : 1;
            final itemWidth = cols == 1 
                ? constraints.maxWidth 
                : (constraints.maxWidth - (cols - 1) * 20) / cols - 0.1;
            return Wrap(
              spacing: 20,
              runSpacing: 20,
              children: others.asMap().entries.map((entry) {
                return SizedBox(
                  width: itemWidth,
                  child: _ProjectCard(
                    project: entry.value,
                    index: entry.key + featured.length,
                    compact: true,
                  ),
                );
              }).toList(),
            );
          }),
        ],
      ),
    );
  }
}

class _ProjectCard extends StatefulWidget {
  final Project project;
  final int index;
  final bool compact;

  const _ProjectCard({
    required this.project,
    required this.index,
    this.compact = false,
  });

  @override
  State<_ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<_ProjectCard> {
  bool _hovered = false;

  Future<void> _launchUrl(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) await launchUrl(uri);
  }

  @override
  Widget build(BuildContext context) {
    final p = widget.project;
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color:
              _hovered ? AppColors.surfaceElevated : AppColors.surface,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: _hovered
                ? AppColors.goldAccent.withOpacity(0.4)
                : AppColors.cardBorder,
          ),
          boxShadow: _hovered
              ? [
                  BoxShadow(
                    color: AppColors.goldAccent.withOpacity(0.08),
                    blurRadius: 32,
                  )
                ]
              : [],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  p.emoji,
                  style: TextStyle(
                      fontSize: widget.compact ? 28 : 36),
                ),
                Row(
                  children: [
                    if (p.githubUrl != null)
                      _iconButton(
                        Icons.code_rounded,
                        () => _launchUrl(p.githubUrl!),
                      ),
                    if (p.liveUrl != null) ...[
                      const SizedBox(width: 8),
                      _iconButton(
                        Icons.open_in_new_rounded,
                        () => _launchUrl(p.liveUrl!),
                      ),
                    ],
                  ],
                ),
              ],
            ),
            const SizedBox(height: 24),
            // Title
            Text(
              p.title,
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium
                  ?.copyWith(
                    fontSize: widget.compact ? 16 : 20,
                    color: _hovered
                        ? AppColors.offWhite
                        : AppColors.offWhite,
                  ),
            ),
            const SizedBox(height: 8),
            // Description
            Text(
              p.description,
              style:
                  Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontSize: widget.compact ? 12 : 13,
                        height: 1.6,
                      ),
              maxLines: widget.compact ? 2 : 3,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 16),
            // Tags
            Wrap(
              spacing: 6,
              runSpacing: 6,
              children:
                  p.tags.take(widget.compact ? 3 : 5).map((t) => TagChip(t)).toList(),
            ),
          ],
        ),
      ),
    )
        .animate()
        .fadeIn(
          delay: Duration(milliseconds: 100 * widget.index),
          duration: 500.ms,
        )
        .slideY(begin: 0.06, end: 0);
  }

  Widget _iconButton(IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: AppColors.goldAccent.withOpacity(0.1),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(icon, size: 16, color: AppColors.goldAccent),
      ),
    );
  }
}