import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:typing_animation/typing_animation.dart';
import 'dart:async';

import 'animationbottembar.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 5), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => AnimatedBarExample()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background Image
          Image.asset('assets/images/bgtree.jpg', fit: BoxFit.cover),
          // Centered Text
          Center(
            child: TypingAnimation(
              text: 'Sea Food...',

              textStyle: GoogleFonts.italianno(
                color: Colors.white,
                fontSize: 80,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.5,
              ),
            ),
          ),
          // Progress Bar at the Bottom
          Positioned(
            bottom: 80,
            left: 40,
            right: 40,
            child: LinearProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              // ignore: deprecated_member_use
              backgroundColor: Colors.grey.withOpacity(0.5),
            ),
          ),
        ],
      ),
    );
  }
}
