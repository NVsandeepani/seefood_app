import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:seefood_app/screen/profilescreen.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';
import 'HomeScreen.dart';
import 'Menuscreen.dart';
import 'cart_Screen.dart';

class AnimatedBarExample extends StatefulWidget {
  const AnimatedBarExample({super.key});

  @override
  State<AnimatedBarExample> createState() => _AnimatedBarExampleState();
}

class _AnimatedBarExampleState extends State<AnimatedBarExample> {
  int selected = 0;
  bool heart = false;
  final controller = PageController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true, //to make floating action button notch transparent
      //to avoid the floating action button overlapping behavior,
      // when a soft keyboard is displayed
      // resizeToAvoidBottomInset: false,
      bottomNavigationBar: StylishBottomBar(
        backgroundColor: Colors.blue[50], // Add this line
        option: DotBarOptions(
          dotStyle: DotStyle.tile,
          gradient: const LinearGradient(
            colors: [Colors.deepPurple, Colors.blue],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        items: [
          BottomBarItem(
            icon: const Icon(Icons.home_outlined),
            selectedIcon: const Icon(Icons.home_rounded),
            selectedColor: Colors.orangeAccent,
            title: const Text('Home'),
          ),
          BottomBarItem(
            icon: const Icon(Icons.set_meal_outlined),
            selectedIcon: const Icon(Icons.set_meal_sharp),
            selectedColor: Colors.orangeAccent,
            title: const Text('Menu'),
          ),

          BottomBarItem(
            icon: const Icon(Icons.shopping_cart_outlined),
            selectedIcon: const Icon(Icons.shopping_cart_rounded),
            selectedColor: Colors.teal,
            unSelectedColor: Colors.grey,
            title: const Text('Cart'),
            badge: const Text('2+'),
            showBadge: true,
            badgeColor: Colors.orangeAccent,
            badgePadding: const EdgeInsets.only(left: 4, right: 4),
          ),
          BottomBarItem(
            icon: const Icon(Icons.person_outline),
            selectedIcon: const Icon(Icons.person),
            selectedColor: Colors.teal,
            unSelectedColor: Colors.grey,
            title: const Text('Profile'),
            badge: const Text('9+'),
            showBadge: true,
            badgeColor: Colors.orangeAccent,
            badgePadding: const EdgeInsets.only(left: 4, right: 4),
          ),
        ],
        hasNotch: true,
        fabLocation: StylishBarFabLocation.end,
        currentIndex: selected,
        notchStyle: NotchStyle.square,
        onTap: (index) {
          if (index == selected) return;
          controller.jumpToPage(index);
          setState(() {
            selected = index;
          });
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            heart = !heart;
          });
        },
        backgroundColor: Colors.blue[50], // Add this line
        child: Icon(
          heart ? CupertinoIcons.heart_fill : CupertinoIcons.heart,
          color: Colors.orangeAccent,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      body: SafeArea(
        child: PageView(
          controller: controller,
          children: const [
            Homescreen(), // Replace with your Home screen widget
            Menuscreen(), // Replace with your Star screen widget
            CartPage(
              imagePath: 'assets/images/Ellipse 8.png',
              foodName: 'Steamed Blue Crabs',
              size: 'L',
              quantity: 2,
            ), // Replace with your Style screen widget
            Profilescreen(), // Replace with your Profile screen widget
          ],
        ),
      ),
    );
  }
}
