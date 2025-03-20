import 'package:flutter/material.dart';
import 'package:seefood_app/screen/spalshscreen.dart' show SplashScreen;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Stylish Bottom Navigation Bar Example',
      theme: ThemeData(
        // useMaterial3: true,
        primarySwatch: Colors.green,
      ),

      home: const SplashScreen(),
    );
  }
}
