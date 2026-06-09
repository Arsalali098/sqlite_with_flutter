import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:sqlite_with_flutter/widget/reusable_card.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'widget/reusable_detailed_card.dart';

class CarousleSlider extends StatefulWidget {
  @override
  State<CarousleSlider> createState() => _CarousleSliderState();
}

class _CarousleSliderState extends State<CarousleSlider> {
  int currentIdx = 0;

  final List<Product> productData = [
    Product(
      name: "Black Dashers",
      price: "\$64",
      imagePath: "assets/images/running shoes.png",
      color: Color(0xFF94dffa),
      category: "Men's Shoes",
      details: "The Black Dasher reimagines the traditional running shoe with natural materials engineered for serious performance.",
    ),
    Product(
      name: "Red Runners",
      price: "\$75",
      imagePath: "assets/images/running shoes.png",
      color: Color(0xFFffd6d6),
      category: "Running Shoes",
      details: "Lightweight and breathable, these runners provide maximum comfort for long distance sprints.",
    ),
    Product(
      name: "White Walkers",
      price: "\$50",
      imagePath: "assets/images/running shoes.png",
      color: Color(0xFF7DD781),
      category: "Casual Shoes",
      details: "Perfect for everyday wear, featuring a minimalist design and sustainable materials.",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CarouselSlider(
              items: productData.map((product) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductDetailScreen(product: product),
                      ),
                    );
                  },
                  child: ReusableCard(
                    bgColor: product.color.withOpacity(0.2),
                    borderColor: product.color,
                    imagePath: "assets/images/Shoes_images-removebg-preview.png",
                    title: product.name.replaceAll(" ", "\n"),
                    price: product.price,
                  ),
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
                count: productData.length,
                axisDirection: Axis.horizontal,
                effect: const ExpandingDotsEffect(
                  activeDotColor: Colors.black,
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

class Product {
  final String imagePath;
  final String name;
  final String price;
  final Color color;
  final String category;
  final String details;

  Product({
    required this.imagePath,
    required this.name,
    required this.price,
    required this.color,
    required this.category,
    required this.details,
  });
}

class ProductDetailScreen extends StatelessWidget {
  final Product product;

  const ProductDetailScreen({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: ReusableDetailedCard(
        imagePath: product.imagePath,
        title: product.name,
        price: product.price,
        description: product.details,
        category: product.category,
        color1: product.color,
      ),
    );
  }
}
