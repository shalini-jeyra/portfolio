import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../utils/theme.dart';

// ── Section Label ──────────────────────────────────────────────────────────
class SectionLabel extends StatelessWidget {
  final String text;
  const SectionLabel(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 32,
          height: 2,
          decoration: const BoxDecoration(
            gradient: AppColors.goldGradient,
          ),
        ),
        const SizedBox(width: 12),
        Text(
          text.toUpperCase(),
          style: Theme.of(context).textTheme.labelLarge,
        ),
      ],
    );
  }
}

// ── Gradient Text ──────────────────────────────────────────────────────────
class GradientText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  const GradientText(this.text, {super.key, this.style});

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) =>
          AppColors.goldGradient.createShader(bounds),
      child: Text(
        text,
        style: (style ?? Theme.of(context).textTheme.displayLarge)
            ?.copyWith(color: Colors.white),
      ),
    );
  }
}

// ── Animated Section Wrapper ───────────────────────────────────────────────
class AnimatedSection extends StatelessWidget {
  final Widget child;
  final int delayMs;
  const AnimatedSection({super.key, required this.child, this.delayMs = 0});

  @override
  Widget build(BuildContext context) {
    return child
        .animate()
        .fadeIn(delay: Duration(milliseconds: delayMs), duration: 600.ms)
        .slideY(begin: 0.08, end: 0, delay: Duration(milliseconds: delayMs));
  }
}

// ── Card Container ─────────────────────────────────────────────────────────
class PortfolioCard extends StatefulWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final VoidCallback? onTap;
  const PortfolioCard({
    super.key,
    required this.child,
    this.padding,
    this.onTap,
  });

  @override
  State<PortfolioCard> createState() => _PortfolioCardState();
}

class _PortfolioCardState extends State<PortfolioCard> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: widget.padding ?? const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: _hovered
                ? AppColors.surfaceElevated
                : AppColors.surface,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: _hovered
                  ? AppColors.goldAccent.withOpacity(0.4)
                  : AppColors.cardBorder,
              width: 1,
            ),
            boxShadow: _hovered
                ? [
                    BoxShadow(
                      color: AppColors.goldAccent.withOpacity(0.08),
                      blurRadius: 24,
                      spreadRadius: 0,
                    ),
                  ]
                : [],
          ),
          child: widget.child,
        ),
      ),
    );
  }
}

// ── Tag Chip ───────────────────────────────────────────────────────────────
class TagChip extends StatelessWidget {
  final String label;
  const TagChip(this.label, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: AppColors.goldAccent.withOpacity(0.12),
        borderRadius: BorderRadius.circular(6),
        border: Border.all(
          color: AppColors.goldAccent.withOpacity(0.25),
        ),
      ),
      child: Text(
        label,
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: AppColors.goldAccentLight,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
      ),
    );
  }
}

// ── Primary Button ─────────────────────────────────────────────────────────
class PrimaryButton extends StatefulWidget {
  final String label;
  final VoidCallback? onTap;
  final IconData? icon;
  const PrimaryButton({
    super.key,
    required this.label,
    this.onTap,
    this.icon,
  });

  @override
  State<PrimaryButton> createState() => _PrimaryButtonState();
}

class _PrimaryButtonState extends State<PrimaryButton> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          padding:
              const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
          decoration: BoxDecoration(
            gradient: _hovered
                ? const LinearGradient(
                    colors: [AppColors.goldAccentLight, AppColors.goldAccentLight],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  )
                : AppColors.goldGradient,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: AppColors.goldAccent
                    .withOpacity(_hovered ? 0.4 : 0.2),
                blurRadius: _hovered ? 20 : 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (widget.icon != null) ...[
                Icon(widget.icon,
                    size: 16, color: AppColors.background),
                const SizedBox(width: 8),
              ],
              Text(
                widget.label,
                style: const TextStyle(
                  color: AppColors.background,
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                  letterSpacing: 0.3,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ── Ghost Button ───────────────────────────────────────────────────────────
class GhostButton extends StatefulWidget {
  final String label;
  final VoidCallback? onTap;
  final IconData? icon;
  const GhostButton({
    super.key,
    required this.label,
    this.onTap,
    this.icon,
  });

  @override
  State<GhostButton> createState() => _GhostButtonState();
}

class _GhostButtonState extends State<GhostButton> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          padding:
              const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
          decoration: BoxDecoration(
            color: _hovered
                ? AppColors.goldAccent.withOpacity(0.08)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: _hovered ? AppColors.goldAccent : AppColors.cardBorder,
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (widget.icon != null) ...[
                Icon(widget.icon,
                    size: 16,
                    color:
                        _hovered ? AppColors.goldAccent : AppColors.offWhiteMuted),
                const SizedBox(width: 8),
              ],
              Text(
                widget.label,
                style: TextStyle(
                  color:
                      _hovered ? AppColors.goldAccent : AppColors.offWhiteMuted,
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ── Nav Item ───────────────────────────────────────────────────────────────
class NavItem extends StatefulWidget {
  final String label;
  final VoidCallback onTap;
  final bool active;
  const NavItem({
    super.key,
    required this.label,
    required this.onTap,
    this.active = false,
  });

  @override
  State<NavItem> createState() => _NavItemState();
}

class _NavItemState extends State<NavItem> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final active = widget.active || _hovered;
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          padding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Text(
            widget.label,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: active ? AppColors.goldAccent : AppColors.offWhiteMuted,
                  fontWeight:
                      active ? FontWeight.w600 : FontWeight.normal,
                ),
          ),
        ),
      ),
    );
  }
}
