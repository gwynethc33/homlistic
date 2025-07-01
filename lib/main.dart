import 'package:flutter/material.dart';
import 'package:homlistic/views/home/home_view.dart';
import 'package:homlistic/views/press/press_page.dart';
import 'package:homlistic/views/faq/faq_page.dart';
import 'package:homlistic/views/contact/contact_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Homlistic',
      theme: ThemeData(
        textTheme: Theme.of(
          context,
        ).textTheme.apply(fontFamily: 'Neutraface Text'),
      ),
      initialRoute: '/',
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
