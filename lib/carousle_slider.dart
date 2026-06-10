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
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          padding: EdgeInsets.only(left: 10, right: 10),
          icon: const Icon(Icons.notes),
          style: IconButton.styleFrom(iconSize: 30),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            padding: EdgeInsets.only(left: 10, right: 10),
            icon: const Icon(Icons.favorite_border),
            style: IconButton.styleFrom(backgroundColor: Colors.white),
          ),
        ],
      ),


      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: TextField(
                decoration: InputDecoration(
                  labelText: "Search",
                  hintText: "Search",
                  prefixIcon: Icon(Icons.search),
                  filled: true,
                  fillColor: Colors.grey[300],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(28.0),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                ),
              ),
            ),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Trending Shoes",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "See All",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                      )
                    ]
                  )
                ],
              ),
            ),
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
                    imagePath: product.imagePath,
                    title: product.name.replaceAll(" ", "\n"),
                    price: product.price,
                  ),
                );
              }).toList(),
              options: CarouselOptions(
                enlargeCenterPage: true,
                height: 400,
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
                  dotWidth: 8,
                  dotHeight: 8,
                  activeDotColor: Colors.black,
                  dotColor: Colors.grey,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Offers",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "See All",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                          ),
                        ),
                      ]
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
