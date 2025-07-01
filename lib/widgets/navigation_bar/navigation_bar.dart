import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    final String? currentRoute = ModalRoute.of(context)?.settings.name;
    final double width = MediaQuery.of(context).size.width;
    final bool isLargeScreen = width >= 800;
    final double logoHeight = width >= 800 ? 100 : 60;
    final double logoWidth = width >= 800 ? 200 : 150;

    final double navFontSize = calculateFontSize(width, 18, 25);
    final double buttonFontSize = calculateFontSize(width, 18, 23);
    final double horizontalPadding = width < 900 ? 20 : 50;
    if (isLargeScreen) {
      return Container(
        height: 100,
        color: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: () => Navigator.pushNamed(context, '/'),
                child: SizedBox(
                  height: logoHeight,
                  width: logoWidth,
                  child: Image.asset('assets/logo.png', fit: BoxFit.contain),
                ),
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                _NavBarItem(
                  'PRESS',
                  fontSize: navFontSize,
                  isActive: currentRoute == '/press',
                  onTap: () => Navigator.pushNamed(context, '/press'),
                ),
                SizedBox(width: horizontalPadding + 10),
                _NavBarItem(
                  'FAQ\'S',
                  fontSize: navFontSize,
                  isActive: currentRoute == '/faq',
                  onTap: () => Navigator.pushNamed(context, '/faq'),
                ),
                SizedBox(width: horizontalPadding + 10),
                _NavBarItem1(
                  'CONTACT',
                  fontSize: buttonFontSize,

                  onPressed: () => Navigator.pushNamed(context, '/contact'),
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
                child: Image.asset('assets/logo.png', fit: BoxFit.contain),
              ),
            ),
          ],
        ),
      );
    }
  }
}

class _NavBarItem1 extends StatelessWidget {
  final String title;
  final VoidCallback? onPressed;
  final double fontSize;

  const _NavBarItem1(this.title, {this.onPressed, this.fontSize = 18});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(minWidth: 150, minHeight: 60),
      child: FilledButton(
        onPressed: onPressed,
        style: FilledButton.styleFrom(
          backgroundColor: const Color.fromARGB(255, 149, 149, 149),
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: Text(title, style: TextStyle(fontSize: fontSize)),
      ),
    );
  }
}

class _NavBarItem extends StatefulWidget {
  final String title;
  final VoidCallback? onTap;
  final bool isActive;
  final double fontSize;

  const _NavBarItem(
    this.title, {
    this.onTap,
    this.isActive = false,
    this.fontSize = 18,
  });

  @override
  State<_NavBarItem> createState() => _NavBarItemState();
}

class _NavBarItemState extends State<_NavBarItem> {
  bool _isHovering = false;

  @override
  Widget build(BuildContext context) {
    final bool underline = widget.isActive || _isHovering;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovering = true),
      onExit: (_) => setState(() => _isHovering = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: Text(
          widget.title,
          style: TextStyle(
            fontSize: widget.fontSize,
            decoration: underline
                ? TextDecoration.underline
                : TextDecoration.none,
            decorationThickness: 2,
            fontWeight: widget.isActive ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }
}
