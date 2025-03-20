import 'package:flutter/material.dart';
import 'package:seefood_app/screen/view_screen.dart';

import '../widget/cardwidget.dart';
import '../widget/carouselsilder.dart';
import '../widget/category.dart';
import '../widget/searchbar.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  TextEditingController searchController = TextEditingController();
  final List<String> image = [
    'assets/images/imageslider_fourr.jpg',

    'assets/images/imageslider0ne.jpg',
    'assets/images/imageslider_fivee.jpg',
    'assets/images/imageslider_sec.jpg',
    'assets/images/imageslider_third.jpg',
  ];
  final List<String> descriptions = [
    'Creamy new potatoes add substance to this quick one-pan skillet dinner of tender shrimp',
    'Creamy new potatoes add substance to this quick one-pan skillet dinner of tender shrimp',
    'Creamy new potatoes add substance to this quick one-pan skillet dinner of tender shrimp,',
    'Creamy new potatoes add substance to this quick one-pan skillet dinner of tender shrimp.',
    'springy bite reminiscent of lobster, is firm and sweet.',
  ];
  final List<String> titles = [
    'Cold Poached Salmon ',
    'Kwame Escovitch Snapper',
    'Buttery Shrimp',
    'Salvadoran-Style Pescado Frito ',
    'Maine-Style Lobster',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              ImageSliderWidget(
                images: image,
                descriptions: descriptions,
                titles: titles,
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15.0,
                  vertical: 10,
                ),
                child: SizedBox(
                  // color: Colors.deepPurple,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: 'Find The ',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontFamily: 'Kanit',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            TextSpan(
                              text: 'Best  Food',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontFamily: 'Kanit',
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            TextSpan(
                              text: '  Around You',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontFamily: 'Kanit',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Spacer(),

                      SearchHeaderBar(
                        leading: Icon(Icons.search),
                        text: 'Search your food',
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 19),
                child: CategorySelector(),
              ),
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 28),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ThempCard(
                          imagePath: 'assets/images/Ellipse 6.png',
                          title: 'Steamed Blue Crabs',
                          time: '20 Min',
                          rating: '4.5 K',
                          price: '155.00\$',
                          onBasketPressed: () {
                            // Handle basket button press
                          },
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ViewScreen(),
                              ), // Replace with your next page
                            );
                          },
                          child: ThempCard(
                            imagePath: 'assets/images/Ellipse 7.png',
                            title: 'Steamed Blue Crabs',
                            time: '20 Min',
                            rating: '4.5 K',
                            price: '155.00\$',
                            onBasketPressed: () {
                              // Handle basket button press
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ViewScreen(),
                              ), // Replace with your next page
                            );
                          },
                          child: ThempCard(
                            imagePath: 'assets/images/Ellipse 8.png',
                            title: 'Steamed Blue Crabs',
                            time: '20 Min',
                            rating: '4.5 K',
                            price: '155.00\$',
                            onBasketPressed: () {
                              // Handle basket button press
                            },
                          ),
                        ),
                        ThempCard(
                          imagePath: 'assets/images/Ellipse 9.png',
                          title: 'Steamed Blue Crabs',
                          time: '20 Min',
                          rating: '4.5 K',
                          price: '155.00\$',
                          onBasketPressed: () {
                            // Handle basket button press
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
