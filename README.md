# 🌿 Flutter Developer Portfolio

A production-grade personal portfolio built entirely in Flutter — runs on **Web, iOS, Android, macOS, Windows & Linux** from a single codebase.

## Design

- **Palette**: Earthy warm — deep charcoal backgrounds, amber/rust accents, cream text
- **Typography**: Fraunfer (display) + DM Sans (body)
- **Animations**: flutter_animate for scroll reveals, animated_text_kit for the hero typewriter

---

## 🚀 Getting Started

### Prerequisites
- Flutter SDK ≥ 3.0.0
- Dart ≥ 3.0.0

### Install & Run

```bash
# Install dependencies
flutter pub get

# Run on Chrome (web)
flutter run -d chrome

# Run on macOS
flutter run -d macos

# Run on iOS simulator
flutter run -d ios

# Build for web (production)
flutter build web --release
```

---

## 📁 Project Structure

```
lib/
├── main.dart                    # Entry point
├── data/
│   └── portfolio_data.dart      # ✏️  EDIT THIS — your personal info, projects, etc.
├── models/
│   └── portfolio_model.dart     # Data models
├── screens/
│   ├── home_screen.dart         # Main layout + scroll assembly
│   ├── hero_section.dart        # Hero / About section
│   ├── projects_section.dart    # Projects grid
│   ├── skills_section.dart      # Skills & tech stack
│   ├── experience_section.dart  # Career timeline
│   └── contact_section.dart     # Contact section
├── widgets/
│   ├── common_widgets.dart      # Reusable UI components
│   ├── navbar.dart              # Sticky top navigation
│   └── footer.dart             # Footer
└── utils/
    └── theme.dart               # Colors, fonts, theme
```

---

## ✏️ Personalizing

**All your personal content lives in one file:**

```
lib/data/portfolio_data.dart
```

Update the `PortfolioData` class with:
- Your name, title, bio, location, email, GitHub, LinkedIn
- Your real projects (title, description, tags, links)
- Your skills / tech stack
- Your work experience

### Changing Colors

Edit `AppColors` in `lib/utils/theme.dart` to adjust the palette.

### Adding a Resume Download

In `lib/widgets/navbar.dart`, find the Resume button and point it to your PDF URL:

```dart
onTap: () => launchUrl(Uri.parse('https://your-domain.com/resume.pdf')),
```

---

## 🌐 Deploying to Web

```bash
flutter build web --release
# Upload the build/web/ folder to Netlify, Vercel, Firebase Hosting, or GitHub Pages
```

---

## 📦 Key Dependencies

| Package | Purpose |
|---|---|
| `google_fonts` | Fraunfer + DM Sans typography |
| `flutter_animate` | Scroll reveal animations |
| `animated_text_kit` | Typewriter effect in hero |
| `url_launcher` | Open GitHub, LinkedIn, email links |

---

Built with Flutter 💙
