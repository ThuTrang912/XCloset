import 'package:flutter/material.dart';
import 'package:xcloset/ClosetPage.dart';
import 'package:xcloset/HelpPage.dart';
import 'package:xcloset/LoginPage.dart';

import 'package:xcloset/MyHomePage.dart';
import 'package:xcloset/NoticePage.dart';
import 'package:xcloset/RegisterPage.dart';
import 'package:xcloset/Wellcome.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const Wellcome(),
        '/login': (context) => const LoginPage(),
        '/register': (context) => RegisterPage(),
        '/myhomepage': (context) => const MyHomePage(),
        // '/closetpage': (context) => const ClosetPage(
        //       drawerItems: 4,
        //     ),
        // '/noticepage': (context) => const NoticePage(),
        // '/helppage': (context) => const HelpPage(),
      },
    );
  }
}
