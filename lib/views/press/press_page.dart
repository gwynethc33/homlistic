import 'package:flutter/material.dart';
//import 'package:homlistic/widgets/centered_view/centered_view.dart';
import 'package:homlistic/widgets/navigation_bar/navigation_bar.dart' as my_nav;
import 'package:homlistic/widgets/press_content/press_content.dart';
import 'package:homlistic/widgets/footer/footer.dart';

class PressPage extends StatefulWidget {
  const PressPage({super.key});

  @override
  State<PressPage> createState() => _PressPageState();
}

class _PressPageState extends State<PressPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void _openDrawer() {
    _scaffoldKey.currentState?.openDrawer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color.from(
                  alpha: 1,
                  red: 0.18,
                  green: 0.38,
                  blue: 0.592,
                ),
              ),
              child: Center(
                child: Text(
                  'Pages',
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
              ),
            ),
            _DrawerNavItem(
              title: 'PRESS',
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/press');
              },
            ),
            _DrawerNavItem(
              title: 'FAQ\'S',
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/faq');
              },
            ),
            _DrawerNavItem(
              title: 'CONTACT',
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/contact');
              },
            ),
          ],
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            elevation: 0,
            backgroundColor: Colors.white,
            surfaceTintColor: Colors.transparent,
            shadowColor: Colors.transparent,
            automaticallyImplyLeading: false,
            toolbarHeight: 100,
            title: Material(
              color: Colors.white,
              elevation: 0,
              child: my_nav.NavigationBar(onMenuPressed: _openDrawer),
            ),
          ),
          SliverToBoxAdapter(child: PressContent()),
          const SliverToBoxAdapter(child: AppFooter()),
        ],
      ),
    );
  }
}

class _DrawerNavItem extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const _DrawerNavItem({required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(title: Text(title), onTap: onTap);
  }
}
