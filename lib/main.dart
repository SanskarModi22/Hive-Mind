import 'package:flutter/material.dart';
import 'package:reddit_clone/features/auth/screens/login_screen.dart';

import 'theme/pallete.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: Palette.darkModeAppTheme,
      home: const LoginScreen(),
    );
  }
}
