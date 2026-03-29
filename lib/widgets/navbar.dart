import 'package:flutter/material.dart';
import '../../utils/theme.dart';
import '../../widgets/common_widgets.dart';

class PortfolioNavBar extends StatelessWidget {
  final ScrollController scrollController;
  final Map<String, GlobalKey> sectionKeys;

  const PortfolioNavBar({
    super.key,
    required this.scrollController,
    required this.sectionKeys,
  });

  void _scrollTo(GlobalKey key) {
    final ctx = key.currentContext;
    if (ctx == null) return;
    Scrollable.ensureVisible(
      ctx,
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    final isWide = MediaQuery.of(context).size.width > 900;
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isWide ? 80 : 20,
        vertical: 16,
      ),
      decoration: BoxDecoration(
        color: AppColors.background.withOpacity(0.92),
        border: const Border(
          bottom: BorderSide(color: AppColors.divider, width: 1),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Logo
          ShaderMask(
            shaderCallback: (bounds) =>
                AppColors.goldGradient.createShader(bounds),
            child: Text(
              'Ashlin.',
              style: Theme.of(context).textTheme.displayLarge?.copyWith(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.w800,
                letterSpacing: -0.5,
              ),
            ),
          ),
          // Nav links (desktop only)
          if (isWide)
            Row(
              children: [
                NavItem(
                  label: 'About',
                  onTap: () => _scrollTo(sectionKeys['hero']!),
                ),
                NavItem(
                  label: 'Projects',
                  onTap: () => _scrollTo(sectionKeys['projects']!),
                ),
                NavItem(
                  label: 'Skills',
                  onTap: () => _scrollTo(sectionKeys['skills']!),
                ),
                NavItem(
                  label: 'Experience',
                  onTap: () =>
                      _scrollTo(sectionKeys['experience']!),
                ),
                NavItem(
                  label: 'Contact',
                  onTap: () => _scrollTo(sectionKeys['contact']!),
                ),
              ],
            ),
          // // CTA
          // PrimaryButton(
          //   label: isWide ? 'Resume' : 'CV',
          //   icon: Icons.download_rounded,
          //   onTap: () {},
          // ),
        ],
      ),
    );
  }
}
