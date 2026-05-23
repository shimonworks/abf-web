import 'package:flutter/material.dart';

import 'theme/app_theme.dart';

import 'pages/home_page.dart';
import 'pages/manifesto_page.dart';

void main() {
  runApp(const ABFApp());
}

class ABFApp extends StatelessWidget {
  const ABFApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,

      title: 'ALL BADDIES FRONT',

      theme: AppTheme.darkTheme,

      initialRoute: '/',

      routes: {

        '/': (context) => const HomePage(),

        '/manifesto': (context) =>
            const ManifestoPage(),
      },
    );
  }
}