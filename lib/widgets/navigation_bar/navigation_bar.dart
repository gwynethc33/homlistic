import 'package:flutter/material.dart';
import 'package:homlistic/controller/language_controller.dart';
import 'package:homlistic/widgets/translated_text/translated_text.dart';
import 'package:provider/provider.dart';

class NavigationBar extends StatefulWidget {
  final VoidCallback? onMenuPressed;

  const NavigationBar({super.key, this.onMenuPressed});

  @override
  State<NavigationBar> createState() => _NavigationBarState();
}

class _NavigationBarState extends State<NavigationBar> {
  double calculateFontSize(double screenWidth, double minFont, double maxFont) {
    const minWidth = 320.0;
    const maxWidth = 2560.0;

    final clampedWidth = screenWidth.clamp(minWidth, maxWidth);
    final scale = (clampedWidth - minWidth) / (maxWidth - minWidth);

    double baseSize = minFont + (maxFont - minFont) * scale;

    if (screenWidth > 1920) {
      final extraScale = ((screenWidth - 1920) / (maxWidth - 1920)).clamp(0, 1);
      final extraBoost = (maxFont * 0.3) * extraScale;
      return baseSize + extraBoost;
    }
    return baseSize;
  }

  void _showLanguageModal(BuildContext context, double screenWidth) {
    final double clampedWidth = screenWidth.clamp(320, 1200);

    final double dialogWidth = clampedWidth < 400
        ? clampedWidth * 0.9
        : clampedWidth < 1200
        ? 400
        : 700;

    final double baseFontSize = screenWidth < 400
        ? 14
        : screenWidth < 900
        ? 18
        : screenWidth < 1200
        ? 22
        : 30;

    final double titleFontSize = clampedWidth < 400
        ? 18
        : clampedWidth < 900
        ? 22
        : 30;

    final double optionFontSize = baseFontSize;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        LanguageController controller = context.read<LanguageController>();

        return AlertDialog(
          title: Text(
            'Select Language',
            style: TextStyle(fontSize: titleFontSize),
          ),

          content: SizedBox(
            width: dialogWidth,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _LanguageOption(
                  locale: Locale('en'),
                  label: '🇺🇸 English',
                  onPressed: () {
                    controller.setLocale(context, const Locale('en', 'US'));
                  },
                  fontSize: optionFontSize,
                ),
                _LanguageOption(
                  locale: Locale('es', 'ES'),
                  label: '🇪🇸 Español',
                  onPressed: () {
                    controller.setLocale(context, const Locale('es', 'ES'));
                  },
                  fontSize: optionFontSize,
                ),

                _LanguageOption(
                  locale: Locale('sr'),
                  label: '🇷🇸 Српски',
                  onPressed: () {
                    controller.setLocale(context, const Locale('sr', 'RS'));
                  },
                  fontSize: optionFontSize,
                ),
                _LanguageOption(
                  locale: Locale('zh'),
                  label: '🇨🇳 中文',
                  onPressed: () {
                    controller.setLocale(context, const Locale('zh', 'CN'));
                  },
                  fontSize: optionFontSize,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final String? currentRoute = ModalRoute.of(context)?.settings.name;
    final double width = MediaQuery.of(context).size.width;
    final bool isLargeScreen = width >= 800;
    double iconSize;
    if (width < 600) {
      iconSize = 20;
    } else if (width < 1200) {
      iconSize = 28;
    } else {
      iconSize = 36;
    }

    final double navFontSize = calculateFontSize(width, 18, 25);
    final double horizontalPadding = width < 900 ? 20 : 50;
    if (isLargeScreen) {
      return Container(
        height: 100,
        color: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _NavBarItem(
              'homlistic',
              fontSize: navFontSize + 8,
              letterSpacing: 3.0,
              isActive: currentRoute == '/',
              onTap: () => Navigator.pushNamed(context, '/'),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(
                    Icons.language,
                    color: Colors.black,
                    size: iconSize,
                  ),
                  tooltip: 'Change Language',
                  onPressed: () => _showLanguageModal(
                    context,
                    MediaQuery.of(context).size.width,
                  ),
                ),
                SizedBox(width: horizontalPadding),
                _NavBarItem(
                  'press',
                  fontSize: navFontSize,
                  isActive: currentRoute == '/press',
                  onTap: () => Navigator.pushNamed(context, '/press'),
                ),
                SizedBox(width: horizontalPadding + 10),
                _NavBarItem(
                  'faqs',
                  fontSize: navFontSize,
                  isActive: currentRoute == '/faq',
                  onTap: () => Navigator.pushNamed(context, '/faq'),
                ),
                SizedBox(width: horizontalPadding + 10),
                _NavBarItem(
                  'contact',
                  fontSize: navFontSize,
                  isActive: currentRoute == '/contact',
                  onTap: () => Navigator.pushNamed(context, '/contact'),
                ),
              ],
            ),
          ],
        ),
      );
    } else {
      // Small screen
      return Container(
        height: 60,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        color: Colors.white,
        child: Row(
          children: [
            IconButton(
              icon: const Icon(Icons.menu),
              onPressed: widget.onMenuPressed,
            ),
            const SizedBox(width: 10),
            GestureDetector(
              onTap: () => Navigator.pushNamed(context, '/'),
              child: SizedBox(
                height: 40,
                width: 120,
                child: SizedBox(
                  width: 120,
                  child: _NavBarItem(
                    'homlistic',
                    fontSize: navFontSize, // smaller
                    letterSpacing: 3.0,
                    isActive: currentRoute == '/',
                    onTap: () => Navigator.pushNamed(context, '/'),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }
  }
}

class _NavBarItem extends StatelessWidget {
  final String titleKey;
  final VoidCallback? onTap;
  final bool isActive;
  final double fontSize;
  final double letterSpacing;

  const _NavBarItem(
    this.titleKey, {
    this.onTap,
    this.isActive = false,
    this.fontSize = 18,
    this.letterSpacing = 1.0,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: TranslatedText(
          titleKey,
          softWrap: false,
          overflow: TextOverflow.visible,
          style: TextStyle(
            fontSize: fontSize,
            decoration: TextDecoration.none,
            fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
            letterSpacing: letterSpacing,
          ),
        ),
      ),
    );
  }
}

class _LanguageOption extends StatelessWidget {
  final Locale locale;
  final String label;
  final double fontSize;
  final VoidCallback? onPressed;

  const _LanguageOption({
    required this.locale,
    required this.label,
    this.fontSize = 16,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(label, style: TextStyle(fontSize: fontSize)),
      onTap: () {
        if (onPressed != null) {
          onPressed!();
        }
        Navigator.pop(context);
      },
    );
  }
}
