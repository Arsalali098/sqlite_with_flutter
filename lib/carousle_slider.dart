import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:sqlite_with_flutter/widget/reusable_card.dart';
import 'package:carousel_slider/carousel_slider.dart';

class CarousleSlider extends StatefulWidget {
  @override
  State<CarousleSlider> createState() => _CarousleSliderState();
}

class _CarousleSliderState extends State<CarousleSlider> {
  int currentIdx = 0;

  final List<Map<String, dynamic>> cardData = [
    {
      "title": "Black\nDashers",
      "price": "\$64",
      "imagePath": "assets/images/Shoes_images-removebg-preview.png",
      "borderColor": Color(0xFF2196F3),
      "bgColor": Color(0xFFE3F2FD),
    },
    {
      "title": "Red\nRunners",
      "price": "\$75",
      "imagePath": "assets/images/Shoes_images-removebg-preview.png",
      "borderColor": Color(0xFFF44336),
      "bgColor": Color(0xFFFFEBEE),
    },
    {
      "title": "White\nWalkers",
      "price": "\$50",
      "imagePath": "assets/images/Shoes_images-removebg-preview.png",
      "borderColor": Color(0xFF4CAF50),
      "bgColor": Color(0xFFE8F5E9),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CarouselSlider(
              items: cardData.map((data) {
                return ReusableCard(
                  bgColor: data["bgColor"],
                  borderColor: data["borderColor"],
                  imagePath: data["imagePath"],
                  title: data["title"],
                  price: data["price"],
                );
              }).toList(),
              options: CarouselOptions(
                enlargeCenterPage: true,
                height: 500,
                aspectRatio: 1.0,
                viewportFraction: 0.8,
                initialPage: 0,
                enableInfiniteScroll: true,
                onPageChanged: (index, _) {
                  setState(() {
                    currentIdx = index;
                  });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: AnimatedSmoothIndicator(
                activeIndex: currentIdx,
                count: 3,
                axisDirection: Axis.horizontal,
                effect: const ExpandingDotsEffect(
                  activeDotColor: Colors.deepPurple,
                  dotColor: Colors.grey,
                ),
              ),

            ),
          ],
        ),
      ),
    );
  }
}
