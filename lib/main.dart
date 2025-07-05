import 'package:flutter/material.dart';
import 'package:homlistic/views/home/home_view.dart';
import 'package:homlistic/views/press/press_page.dart';
import 'package:homlistic/views/faq/faq_page.dart';
import 'package:homlistic/views/contact/contact_page.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:provider/provider.dart';
import 'package:homlistic/controller/language_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale('en', 'US'),
        Locale('es', 'ES'),
        Locale('sr', 'RS'),
        Locale('zh', 'CN'),
      ],
      path: 'assets/translations',
      fallbackLocale: const Locale('en', 'US'),
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => LanguageController()),
        ],
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    context.watch<LanguageController>();
    return MaterialApp(
      title: 'Homlistic',
      theme: ThemeData(
        textTheme: Theme.of(
          context,
        ).textTheme.apply(fontFamily: 'Neutraface Text'),
      ),
      initialRoute: '/',
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      routes: {
        '/': (context) => const HomeView(),
        '/press': (context) => const PressPage(),
        '/faq': (context) => const FaqPage(),
        '/contact': (context) => const ContactPage(),
        //to add more routes add here
      },
    );
  }
}
