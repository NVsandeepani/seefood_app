import 'package:flutter/material.dart';
import 'dart:math';

import 'cart_Screen.dart';

class ViewScreen extends StatefulWidget {
  const ViewScreen({super.key});

  @override
  State<ViewScreen> createState() => _ViewScreenState();
}

class _ViewScreenState extends State<ViewScreen>
    with SingleTickerProviderStateMixin {
  final Map<String, double> sizeConstants = {
    'S': 150.0,
    'M': 200.0,
    'L': 250.0,
  };

  late AnimationController _controller;
  late Animation<double> _rotationAnimation;
  late Animation<double> _scaleAnimation;

  double imageSize = 150.0;

  int _quantity = 1;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );

    _rotationAnimation = Tween<double>(
      begin: 0,
      end: 2 * pi,
    ).animate(_controller);
    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.0).animate(_controller);
  }

  void updateImageSize(String size) {
    double newSize = sizeConstants[size] ?? 150.0;

    setState(() {
      _scaleAnimation = Tween<double>(
        begin: 1.0,
        end: (size == 'S') ? 1.0 : 1.2, // No zoom for 'S', zoom for 'M' & 'L'
      ).animate(_controller);

      imageSize = newSize;
    });

    _controller.forward(from: 0);
  }

  void incrementQuantity() {
    setState(() {
      _quantity++;
    });
  }

  void decrementQuantity() {
    if (_quantity > 1) {
      setState(() {
        _quantity--;
      });
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            decoration: const BoxDecoration(
              gradient: RadialGradient(
                center: Alignment(10, 10),
                radius: 0.50,
                colors: [
                  Color(0xFF91B8DD),
                  Color(0xFF1875CC),
                  Color(0xFF538DC3),
                  Color(0xFF5B81A4),
                  Color(0xFF0C3A66),
                ],
              ),
            ),
            child: Column(
              children: [
                SizedBox(height: 20),
                Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_back_ios, color: Colors.white),
                  ),
                ),
                SizedBox(height: 20),
                Column(
                  children: [
                    AnimatedBuilder(
                      animation: _controller,
                      builder: (context, child) {
                        return Transform.rotate(
                          angle: _rotationAnimation.value,
                          child: Transform.scale(
                            scale: _scaleAnimation.value,
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 300),
                              width: imageSize,
                              height: imageSize,
                              child: CircleAvatar(
                                radius: imageSize / 2,
                                backgroundColor: Colors.blue.withOpacity(0.1),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(
                                    imageSize / 2,
                                  ),
                                  child: Image.asset(
                                    'assets/images/Ellipse 15.png',
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                    SizedBox(height: 10),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(40),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                IconButton(
                                  icon: const Icon(
                                    Icons.remove,
                                    color: Colors.blue,
                                  ),
                                  onPressed: decrementQuantity,
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 20,
                                    vertical: 5,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.blue[100],
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Text(
                                    "$_quantity",
                                    style: const TextStyle(fontSize: 18),
                                  ),
                                ),
                                IconButton(
                                  icon: const Icon(
                                    Icons.add,
                                    color: Colors.blue,
                                  ),
                                  onPressed: incrementQuantity,
                                ),
                              ],
                            ),
                            SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                TextButton(
                                  onPressed: () => updateImageSize('S'),
                                  child: Text(
                                    "S",
                                    style: TextStyle(
                                      color: Colors.blue,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                                TextButton(
                                  onPressed: () => updateImageSize('M'),
                                  child: Text(
                                    "M",
                                    style: TextStyle(
                                      color: Colors.blue,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                                TextButton(
                                  onPressed: () => updateImageSize('L'),
                                  child: Text(
                                    "L",
                                    style: TextStyle(
                                      color: Colors.blue,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 30),
                            const Text(
                              "Roasted Dungeness Crab",
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 20),
                            Text(
                              "Lorem ipsum dolor sit amet consectetur, adipiscing elit.",
                              textAlign: TextAlign.left,
                              style: TextStyle(color: Colors.black87),
                            ),
                            const SizedBox(height: 30),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.access_time,
                                      color: Colors.blue,
                                      size: 20,
                                    ),
                                    const SizedBox(width: 5),
                                    const Text(
                                      "40 Min",
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.star_rate_rounded,
                                      color: Colors.amber,
                                      size: 25,
                                    ),
                                    const SizedBox(width: 5),
                                    const Text(
                                      "4.5K",
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  ],
                                ),
                                const Text(
                                  "\$160.00",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 50),
                            SizedBox(
                              width: 200,
                              height: 50,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFF125899),
                                ),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder:
                                          (context) => CartPage(
                                            imagePath:
                                                'assets/images/Ellipse 15.png',
                                            foodName: "Roasted Dungeness Crab",
                                            quantity: _quantity,
                                            size:
                                                sizeConstants.entries
                                                    .firstWhere(
                                                      (entry) =>
                                                          entry.value ==
                                                          imageSize,
                                                    )
                                                    .key,
                                          ),
                                    ),
                                  );
                                },
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Icon(
                                      Icons.shopping_cart,
                                      color: Colors.white,
                                    ),
                                    const Text(
                                      "Add To Cart",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
