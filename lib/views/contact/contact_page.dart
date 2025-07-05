import 'package:flutter/material.dart';
//import 'package:homlistic/widgets/centered_view/centered_view.dart';
import 'package:homlistic/widgets/navigation_bar/navigation_bar.dart' as my_nav;
import 'package:homlistic/widgets/contact_content/contact_content.dart';
import 'package:homlistic/widgets/footer/footer.dart';
import 'package:provider/provider.dart';
import 'package:homlistic/controller/language_controller.dart';
import 'package:homlistic/widgets/translated_text/translated_text.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactViewState();
}

class _ContactViewState extends State<ContactPage> {
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
                child: TranslatedText(
                  'Pages',
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
              ),
            ),
            _DrawerNavItem(
              titleKey: 'press',
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/press');
              },
            ),
            _DrawerNavItem(
              titleKey: 'faqs',
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/faq');
              },
            ),
            _DrawerNavItem(
              titleKey: 'contact',
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/contact');
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.language),
              title: const Text('Change Language'),
              onTap: () {
                Navigator.pop(context);
                _showLanguageModal(context);
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
          SliverToBoxAdapter(child: ContactContent()),
          const SliverToBoxAdapter(child: AppFooter()),
        ],
      ),
    );
  }
}

void _showLanguageModal(BuildContext context) {
  LanguageController controller = context.read<LanguageController>();
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Select Language'),

        content: SizedBox(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _LanguageOption(
                locale: Locale('en'),
                label: '🇺🇸 English',
                onPressed: () {
                  controller.setLocale(context, const Locale('en', 'US'));
                },
              ),
              _LanguageOption(
                locale: Locale('es'),
                label: '🇪🇸 Español',
                onPressed: () {
                  controller.setLocale(context, const Locale('es', 'ES'));
                },
              ),
              _LanguageOption(
                locale: Locale('sr'),
                label: '🇷🇸 Српски',
                onPressed: () {
                  controller.setLocale(context, const Locale('sr', 'RS'));
                },
              ),
              _LanguageOption(
                locale: Locale('zh'),
                label: '🇨🇳 中文',
                onPressed: () {
                  controller.setLocale(context, const Locale('zh', 'CN'));
                },
              ),
            ],
          ),
        ),
      );
    },
  );
}

class _LanguageOption extends StatelessWidget {
  final Locale locale;
  final String label;
  final VoidCallback? onPressed;

  const _LanguageOption({
    required this.locale,
    required this.label,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(label),
      onTap: () {
        if (onPressed != null) {
          onPressed!();
        }
        Navigator.pop(context);
      },
    );
  }
}

class _DrawerNavItem extends StatelessWidget {
  final String titleKey;
  final VoidCallback onTap;

  const _DrawerNavItem({required this.titleKey, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(title: TranslatedText(titleKey), onTap: onTap);
  }
}
