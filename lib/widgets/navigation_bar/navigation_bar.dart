import 'package:flutter/material.dart';

class NavigationBar extends StatefulWidget {
  final VoidCallback? onMenuPressed;

  const NavigationBar({super.key, this.onMenuPressed});

  @override
  State<NavigationBar> createState() => _NavigationBarState();
}

class _NavigationBarState extends State<NavigationBar> {
  @override
  Widget build(BuildContext context) {
    final String? currentRoute = ModalRoute.of(context)?.settings.name;
    final double width = MediaQuery.of(context).size.width;
    final bool isLargeScreen = width >= 800;

    if (isLargeScreen) {
      return Container(
        height: 100,
        color: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: () => Navigator.pushNamed(context, '/'),
                child: SizedBox(
                  height: 80,
                  width: 160,
                  child: Image.asset('assets/logo.png', fit: BoxFit.contain),
                ),
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                _NavBarItem(
                  'PRESS',
                  isActive: currentRoute == '/press',
                  onTap: () => Navigator.pushNamed(context, '/press'),
                ),
                const SizedBox(width: 60),
                _NavBarItem(
                  'FAQ\'S',
                  isActive: currentRoute == '/FAQ\'S',
                  onTap: () => Navigator.pushNamed(context, '/FAQ\'S'),
                ),
                const SizedBox(width: 60),
                _NavBarItem1('CONTACT'),
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
  const _NavBarItem1(this.title);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      height: 60,
      child: FilledButton(
        onPressed: () {},
        style: FilledButton.styleFrom(
          backgroundColor: const Color.fromARGB(255, 149, 149, 149),
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: Text(title, style: const TextStyle(fontSize: 18)),
      ),
    );
  }
}

class _NavBarItem extends StatefulWidget {
  final String title;
  final VoidCallback? onTap;
  final bool isActive;

  const _NavBarItem(this.title, {this.onTap, this.isActive = false});

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
            fontSize: 18,
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
