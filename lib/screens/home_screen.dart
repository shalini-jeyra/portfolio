import 'package:flutter/material.dart';
import '../../screens/hero_section.dart';
import '../../screens/projects_section.dart';
import '../../screens/skills_section.dart';
import '../../screens/experience_section.dart';
import '../../screens/contact_section.dart';
import '../../widgets/navbar.dart';
import '../../widgets/footer.dart';
import '../../utils/theme.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _scrollController = ScrollController();

  final _heroKey = GlobalKey();
  final _projectsKey = GlobalKey();
  final _skillsKey = GlobalKey();
  final _experienceKey = GlobalKey();
  final _contactKey = GlobalKey();

  late final Map<String, GlobalKey> _sectionKeys;

  @override
  void initState() {
    super.initState();
    _sectionKeys = {
      'hero': _heroKey,
      'projects': _projectsKey,
      'skills': _skillsKey,
      'experience': _experienceKey,
      'contact': _contactKey,
    };
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Subtle bg grain / glow
          Positioned.fill(
            child: CustomPaint(painter: _BgPainter()),
          ),
          Column(
            children: [
              // Sticky nav
              PortfolioNavBar(
                scrollController: _scrollController,
                sectionKeys: _sectionKeys,
              ),
              // Scrollable content
              Expanded(
                child: SingleChildScrollView(
                  controller: _scrollController,
                  child: Column(
                    children: [
                      KeyedSubtree(
                        key: _heroKey,
                        child: HeroSection(
                          onContactTap: () => Scrollable.ensureVisible(
                            _contactKey.currentContext!,
                            duration: const Duration(milliseconds: 600),
                            curve: Curves.easeInOut,
                          ),
                          onProjectsTap: () => Scrollable.ensureVisible(
                            _projectsKey.currentContext!,
                            duration: const Duration(milliseconds: 600),
                            curve: Curves.easeInOut,
                          ),
                        ),
                      ),
                      const Divider(color: AppColors.divider, height: 1),
                      KeyedSubtree(
                        key: _projectsKey,
                        child: const ProjectsSection(),
                      ),
                      KeyedSubtree(
                        key: _skillsKey,
                        child: const SkillsSection(),
                      ),
                      KeyedSubtree(
                        key: _experienceKey,
                        child: const ExperienceSection(),
                      ),
                      KeyedSubtree(
                        key: _contactKey,
                        child: const ContactSection(),
                      ),
                      const PortfolioFooter(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// Subtle warm background painter
class _BgPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Warm amber glow top-right
    final paint1 = Paint()
      ..shader = RadialGradient(
        colors: [
          AppColors.goldAccent.withOpacity(0.06),
          Colors.transparent,
        ],
        radius: 0.6,
      ).createShader(
        Rect.fromCenter(
          center: Offset(size.width * 0.85, size.height * 0.05),
          width: size.width,
          height: size.height,
        ),
      );
    canvas.drawRect(Offset.zero & size, paint1);

    // Rust glow bottom-left
    final paint2 = Paint()
      ..shader = RadialGradient(
        colors: [
          AppColors.goldAccent.withOpacity(0.04),
          Colors.transparent,
        ],
        radius: 0.5,
      ).createShader(
        Rect.fromCenter(
          center: Offset(size.width * 0.1, size.height * 0.9),
          width: size.width,
          height: size.height,
        ),
      );
    canvas.drawRect(Offset.zero & size, paint2);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
