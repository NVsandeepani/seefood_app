import 'package:flutter/material.dart';

class ThempCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String time;
  final String rating;
  final String price;
  final VoidCallback onBasketPressed;

  const ThempCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.time,
    required this.rating,
    required this.price,
    required this.onBasketPressed,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double cardWidth =
            constraints.maxWidth * 0.8; // Adjust the width as needed
        double cardHeight =
            constraints.maxHeight * 0.8; // Adjust the height as needed

        return Container(
          padding: EdgeInsets.all(10),
          width: cardWidth < 159 ? cardWidth : 159,
          height: cardHeight < 209 ? cardHeight : 209,
          decoration: ShapeDecoration(
            color: Color(0xFFD9D9D9),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            shadows: [
              BoxShadow(
                color: Color(0x3F000000),
                blurRadius: 8.30,
                offset: Offset(0, 4),
                spreadRadius: 0,
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Align(
                alignment: Alignment.topRight,
                child: Icon(
                  Icons.favorite,
                  size: 12,
                  color: const Color.fromARGB(255, 5, 38, 65),
                ),
              ),
              Image.asset(imagePath, height: 95, width: 100),
              Text(
                title,
                style: TextStyle(
                  color: Color(0xFF020113),
                  fontSize: 12,
                  fontFamily: 'Bree Serif',
                  fontWeight: FontWeight.w400,
                  letterSpacing: 0.60,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    time,
                    style: TextStyle(
                      color: Color(0xFF12108C),
                      fontSize: 10,
                      fontFamily: 'Itim',
                      fontWeight: FontWeight.w400,
                      letterSpacing: 1.87,
                    ),
                  ),
                  SizedBox(width: 7),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.yellow, size: 10),
                      SizedBox(width: 5),
                      Text(
                        rating,
                        style: TextStyle(
                          color: Color(0xFF020113),
                          fontSize: 11,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                          letterSpacing: 0.24,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    price,
                    style: TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                  IconButton(
                    onPressed: onBasketPressed,
                    icon: Icon(
                      Icons.shopping_basket_outlined,
                      color: Colors.green,
                      size: 20,
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
