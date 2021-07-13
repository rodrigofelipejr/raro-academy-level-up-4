import 'package:flutter/material.dart';
import 'package:posts/src/features/home/home_page.dart';
import 'package:posts/src/features/splash/splash_page.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Posts',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      initialRoute: '/splash',
      routes: {
        '/splash': (_) => SplashPage(),
        '/home': (_) => HomePage(),
      },
    );
  }
}
