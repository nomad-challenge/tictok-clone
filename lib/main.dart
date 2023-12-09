import 'package:flutter/material.dart';
import 'package:mynote/constants/sizes.dart';
import 'package:mynote/features/authentication/sign_up_screen.dart';
import 'package:mynote/features/inbox/activity_screen.dart';
import 'package:mynote/features/main_navigation/main_navigation_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Note',
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: false,
          primaryColor: Colors.blueAccent.shade700,
          textSelectionTheme:
              TextSelectionThemeData(cursorColor: Colors.blueAccent.shade700),
          splashColor: Colors.transparent, // 버튼 클릭시 번지는 효과 제거
          appBarTheme: const AppBarTheme(
            foregroundColor: Colors.black,
            backgroundColor: Colors.white,
            elevation: 0,
            titleTextStyle: TextStyle(
              fontSize: Sizes.size16 + Sizes.size2,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          )),
      home: const MainNavigationScreen(),
    );
  }
}
