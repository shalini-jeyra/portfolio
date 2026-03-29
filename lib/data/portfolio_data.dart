class PersonalInfo {
  final String name;
  final String title;
  final String tagline;
  final String bio;
  final String location;
  final String email;
  final String github;
  final String linkedin;
  final String yearsOfExperience;

  const PersonalInfo({
    required this.name,
    required this.title,
    required this.tagline,
    required this.bio,
    required this.location,
    required this.email,
    required this.github,
    required this.linkedin,
    required this.yearsOfExperience,
  });
}

class Project {
  final String title;
  final String description;
  final List<String> tags;
  final String? githubUrl;
  final String? liveUrl;
  final String emoji;
  final bool featured;

  const Project({
    required this.title,
    required this.description,
    required this.tags,
    this.githubUrl,
    this.liveUrl,
    required this.emoji,
    this.featured = false,
  });
}

class Skill {
  final String category;
  final List<String> items;
  final String icon;

  const Skill({
    required this.category,
    required this.items,
    required this.icon,
  });
}

class Experience {
  final String role;
  final String company;
  final String period;
  final String description;
  final List<String> highlights;
  final bool isCurrent;

  const Experience({
    required this.role,
    required this.company,
    required this.period,
    required this.description,
    required this.highlights,
    this.isCurrent = false,
  });
}

// ── EDIT THIS DATA TO PERSONALIZE ──────────────────────────────────────────
class PortfolioData {
  static const PersonalInfo info = PersonalInfo(
    name: 'Ashlin',
    title: 'Senior Flutter Developer & Team Lead',
    tagline: 'Senior Flutter Developer with 5+ years of experience | Open for Freelance.',
    bio:
        'I\'m a Senior Flutter Developer with 5+ years of experience building '
        'scalable, production-ready cross-platform apps. My expertise lies in '
        'Clean Architecture, reactive state management, and delivering polished '
        'iOS & Android experiences that perform at scale. '
        'Open to high-impact freelance projects that require architectural depth and premium UI.',
    location: 'Bengaluru, India',
    email: 'ashlinshalini@gmail.com',
    github: 'https://github.com/ashilinshalini',
    linkedin: 'https://www.linkedin.com/in/ashilinshalini',
    yearsOfExperience: '5+',
  );

  static const List<Project> projects = [
    Project(
      title: 'HashFame',
      description:
          'An influencer marketing platform connecting brands with over 70,000 verified creators. '
          'Migrated to a scalable Bloc-based state management system, integrated deep-linking, '
          'and managed end-to-end CI/CD release pipelines.',
      tags: ['Flutter', 'Bloc', 'Deep Linking', 'CI/CD'],
      liveUrl: 'https://apps.apple.com/in/app/hashfame/id6452017249',
      emoji: '🚀',
      featured: true,
    ),
    Project(
      title: 'CargoEZ',
      description:
          'Enterprise CRM logistics application. Optimized Flutter UI rendering for complex dashboards, '
          'secured REST API integrations, and streamlined production deployments.',
      tags: ['Flutter', 'REST APIs', 'Enterprise', 'CRM'],
      liveUrl: 'https://apps.apple.com/us/app/cargoez/id1629677253',
      emoji: '📦',
      featured: true,
    ),
    Project(
      title: 'Nutrimate',
      description:
          'A calorie-based food delivery app targeting both vendors and customers, '
          'built with custom reactive UIs for a seamless ordering experience.',
      tags: ['Flutter', 'Reactive UI', 'Food Tech'],
      emoji: '🥗',
      featured: true,
    ),
    Project(
      title: 'CargoEZ Portal',
      description:
          'Mobile version of the enterprise logistics web portal with optimized UI for field operations.',
      tags: ['Flutter', 'REST APIs', 'Enterprise'],
      liveUrl: 'https://apps.apple.com/us/app/cargoez-portal/id1612437626',
      emoji: '🌐',
    ),
    Project(
      title: 'Supply Space',
      description:
          'Mobile marketplace for construction materials and hardware tools, '
          'featuring robust offline-first capabilities.',
      tags: ['Flutter', 'Offline-First', 'Marketplace'],
      emoji: '🏗️',
    ),
  ];

  static const List<Skill> skills = [
    Skill(
      category: 'Flutter & Dart',
      icon: '📱',
      items: [
        'Flutter (iOS, Android, Web, PWA)',
        'Custom Animations & Painters',
        'Platform Channels',
        'Widget Architecture & Performance',
        'Flutter Web',
      ],
    ),
    Skill(
      category: 'Architecture & State',
      icon: '🏗️',
      items: [
        'Clean Architecture & Modularization',
        'Bloc Pattern & ValueNotifier',
        'Reactive UI Architectures',
        'TDD & Unit Testing',
      ],
    ),
    Skill(
      category: 'Real-time & Network',
      icon: '☁️',
      items: [
        'Firebase Realtime Database (RTDB)',
        'Stream-based UI Synchronization',
        'Dio Interceptors & Precision Networking',
        'Granular Error Classification',
        'REST & GraphQL / OAuth',
      ],
    ),
    Skill(
      category: 'Automation & DevOps',
      icon: '⚙️',
      items: [
        'Fastlane & CI/CD Automation',
        'Bitbucket macOS LaunchAgent Runners',
        'App Store / TestFlight Automation',
        'Android Build Lifecycle',
        'Agile & Team Leadership',
      ],
    ),
  ];

  static const List<Experience> experiences = [
    Experience(
      role: 'Senior Software Engineer / Team Lead',
      company: 'HashFame',
      period: '2023 – Present',
      description:
          'Leading mobile development for a creator-centric influencer marketing platform with 70k+ verified creators.',
      highlights: [
        'Migrated to a scalable Bloc-based state management system',
        'Integrated deep-linking for seamless user acquisition flows',
        'Managed end-to-end CI/CD release pipelines',
        'Mentored developers and optimized Agile workflows',
      ],
      isCurrent: true,
    ),
    Experience(
      role: 'Flutter Developer',
      company: 'Avow Solutions Inc',
      period: '2021 – 2023',
      description:
          'Developed and optimized enterprise CRM logistics applications for CargoEZ.',
      highlights: [
        'Optimized Flutter UI rendering for complex logistics dashboards',
        'Secured REST API integrations across multiple services',
        'Streamlined production deployments and Android build lifecycle',
      ],
    ),
    Experience(
      role: 'Software Developer',
      company: 'CoreIllustrio',
      period: '2020 – 2021',
      description:
          'Delivered cross-platform mobile solutions for food tech and construction verticals.',
      highlights: [
        'Built Nutrimate, a calorie-based food delivery app for vendors & customers',
        'Developed Supply Space for construction material ordering with offline-first support',
      ],
    ),
  ];
}