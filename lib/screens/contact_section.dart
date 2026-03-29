import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../data/portfolio_data.dart';
import '../../utils/theme.dart';
import '../../widgets/common_widgets.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  Future<void> _launchUrl(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) await launchUrl(uri);
  }

  @override
  Widget build(BuildContext context) {
    const info = PortfolioData.info;
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
          const SectionLabel('Contact'),
          const SizedBox(height: 16),
          Text(
            'Get In Touch',
            style: Theme.of(context).textTheme.displaySmall,
          ),
          const SizedBox(height: 16),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 560),
            child: Text(
              'I\'m open to freelance projects, '
              'and interesting collabs. Drop me a message — I reply within 24 hours.',
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge
                  ?.copyWith(fontSize: 17, height: 1.8),
            ),
          ),
          const SizedBox(height: 48),
          // Contact cards
          Wrap(
            spacing: 16,
            runSpacing: 16,
            children: [
              _ContactCard(
                icon: Icons.mail_outline_rounded,
                label: 'Email',
                value: info.email,
                onTap: () => _launchUrl('mailto:${info.email}'),
                copyValue: info.email,
              ),
              _ContactCard(
                icon: Icons.code_rounded,
                label: 'GitHub',
                value: 'github.com/${info.github.split('/').last}',
                onTap: () => _launchUrl(info.github),
              ),
              _ContactCard(
                icon: Icons.business_center_outlined,
                label: 'LinkedIn',
                value: 'linkedin.com/in/${info.linkedin.split('/').last}',
                onTap: () => _launchUrl(info.linkedin),
              ),
            ],
          ),
          const SizedBox(height: 64),
          // CTA banner
          AnimatedSection(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(40),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    AppColors.goldAccent.withOpacity(0.15),
                    AppColors.goldAccent.withOpacity(0.08),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: AppColors.goldAccent.withOpacity(0.25),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Let\'s build something great.',
                    style: Theme.of(context)
                        .textTheme
                        .headlineLarge
                        ?.copyWith(fontSize: 26),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Whether it\'s a full product, a feature, or just a conversation — I\'m always up for it.',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const SizedBox(height: 28),
                  PrimaryButton(
                    label: 'Say Hello',
                    icon: Icons.waving_hand_rounded,
                    onTap: () => _launchUrl('mailto:${info.email}'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ContactCard extends StatefulWidget {
  final IconData icon;
  final String label;
  final String value;
  final VoidCallback onTap;
  final String? copyValue;

  const _ContactCard({
    required this.icon,
    required this.label,
    required this.value,
    required this.onTap,
    this.copyValue,
  });

  @override
  State<_ContactCard> createState() => _ContactCardState();
}

class _ContactCardState extends State<_ContactCard> {
  bool _hovered = false;
  bool _copied = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          width: 260,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: _hovered ? AppColors.surfaceElevated : AppColors.surface,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(
              color: _hovered
                  ? AppColors.goldAccent.withOpacity(0.4)
                  : AppColors.cardBorder,
            ),
          ),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: AppColors.goldAccent.withOpacity(0.12),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(widget.icon, size: 20, color: AppColors.goldAccent),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.label,
                      style: Theme.of(context)
                          .textTheme
                          .labelLarge
                          ?.copyWith(fontSize: 11),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      widget.value,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: AppColors.offWhite,
                            fontSize: 13,
                          ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              if (widget.copyValue != null)
                GestureDetector(
                  onTap: () {
                    Clipboard.setData(ClipboardData(text: widget.copyValue!));
                    setState(() => _copied = true);
                    Future.delayed(const Duration(seconds: 2), () {
                      if (mounted) setState(() => _copied = false);
                    });
                  },
                  child: Icon(
                    _copied ? Icons.check_rounded : Icons.copy_rounded,
                    size: 16,
                    color: _copied
                        ? const Color(0xFF4ADE80)
                        : AppColors.offWhiteMuted,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
