import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:typing_animation/typing_animation.dart';

class Menuscreen extends StatelessWidget {
  const Menuscreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final List<String> menuItems = [
      'Steamed Blue Crabs',
      'Singapore Chili Crabs',
      'Roasted Dungeness  Crab',
      'Singapore  Crabs',
      'Lobster bisque',
      'Shrimp scampi with pasta',
      'Shrimp and grits',
      'Shrimp cocktail',
      'Shrimp Creole',
    ]; // Add your menu items here

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            SizedBox(
              width: screenWidth,
              height: screenHeight,
              child: Image.asset(
                'assets/images/menune.jpg', // Ensure correct path
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(28.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: TypingAnimation(
                      text: 'Today Menu...',
                      textStyle: GoogleFonts.italianno(
                        color: Colors.white,
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.5,
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  Expanded(
                    child: ListView.builder(
                      itemCount: menuItems.length,
                      itemBuilder: (context, index) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const Text(
                                  '• ',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 25,
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    menuItems[index],
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ), // Add space between items
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
