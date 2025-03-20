import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class ImageSliderWidget extends StatelessWidget {
  final List<String> images;
  final List<String> descriptions;
  final List<String> titles;

  const ImageSliderWidget({
    super.key,
    required this.images,
    required this.descriptions,
    required this.titles,
  });

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 250.0, // Set height of images
        autoPlay: true, // Auto-slide enabled
        autoPlayInterval: Duration(seconds: 3), // Slide every 3 sec
        autoPlayAnimationDuration: Duration(
          milliseconds: 300,
        ), // Animation time
        autoPlayCurve: Curves.fastOutSlowIn, // Smooth animation curve
        enlargeCenterPage: true, // Zoom effect on current image
        viewportFraction: 1.2, // Controls the width of images
      ),
      items:
          images.asMap().entries.map((entry) {
            int index = entry.key;
            String img = entry.value;
            String description = descriptions[index];

            return Builder(
              builder: (BuildContext context) {
                return Stack(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(img),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 5.0,
                      left: 20.0,
                      right: 20.0,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 30.0,
                          vertical: 10,
                        ),
                        // ignore: deprecated_member_use
                        color: Colors.black.withOpacity(0.5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              titles[index],
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 26,
                                fontFamily: 'JejuHallasan',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              description,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              },
            );
          }).toList(),
    );
  }
}
