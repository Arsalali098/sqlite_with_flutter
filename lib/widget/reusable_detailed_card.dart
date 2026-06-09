import 'package:flutter/material.dart';

class ReusableDetailedCard extends StatelessWidget {

  final String imagePath;
  final String title;
  final String price;
  final Color color1;
  final String category;
  final String description;

  const ReusableDetailedCard({super.key, required this.imagePath, required this.title, required this.price, required this.color1, required this.category, required this.description});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            padding: EdgeInsets.only(left: 10, right: 10),
            icon: const Icon(Icons.arrow_back),
            style: IconButton.styleFrom(backgroundColor: Colors.white),
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
      body: Center(
        child: Stack(
          children: [
            DiagonalColorBox(
              width: screenWidth,
              height: screenHeight,
              color1: color1,
              color2: Colors.white,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Spacer(),
                    Image.asset(
                      imagePath,
                      width: screenWidth * 0.9,
                      fit: BoxFit.cover,
                    ),
                    // Spacer(),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              title,
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          Text(
                            price,
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              category,
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: Colors.grey,
                              ),
                            ),
                            const Row(
                              children: [
                                Icon(Icons.star, color: Colors.black, size: 16),
                                Icon(Icons.star, color: Colors.black, size: 16),
                                Icon(Icons.star, color: Colors.black, size: 16),
                                Icon(Icons.star, color: Colors.black, size: 16),
                                Icon(Icons.star, color: Colors.grey, size: 16),
                                Text("(56 reviews)", style: TextStyle(fontSize: 14, color: Colors.grey),)
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                description,
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 18),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(9),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: Colors.grey,
                                      width: 1,
                                    ),
                                  ),
                                  child: Center(
                                    child: Text("5", style: TextStyle(fontSize: 20),),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Container(
                                  padding: EdgeInsets.all(9),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: Colors.grey,
                                      width: 1,
                                    ),
                                  ),
                                  child: Center(
                                    child: Text("6", style: TextStyle(fontSize: 20),),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Container(
                                  padding: EdgeInsets.all(9),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: Colors.grey,
                                      width: 1,
                                    ),
                                  ),
                                  child: Center(
                                    child: Text("7", style: TextStyle(fontSize: 20),),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Container(
                                  padding: EdgeInsets.all(9),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: Colors.grey,
                                      width: 1,
                                    ),
                                  ),
                                  child: Center(
                                    child: Text("8", style: TextStyle(fontSize: 20),),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Container(
                                  padding: EdgeInsets.all(9),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: Colors.grey,
                                      width: 1,
                                    ),
                                  ),
                                  child: Center(
                                    child: Text("9", style: TextStyle(fontSize: 20),),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                  padding: EdgeInsets.all(9),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: Colors.grey,
                                      width: 1,
                                    ),
                                  ),
                                  child: Center(
                                    child: Container(
                                      width: 20,
                                      height: 20,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.blue,
                                      ),
                                    )
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Container(
                                    width: 20,
                                    height: 20,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.black,
                                    ),
                                ),
                              ],
                            ),
                          ],
                          ),
                        ),
                        // const SizedBox(height: 3),
                        Container(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: (){
                              onTap: () {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text("${title} added to cart!")),
                                );
                              };
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                              )
                            ),
                            child: Text("Add to Cart", style: TextStyle( color: Colors.white, fontSize: 22),),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DiagonalColorBox extends StatelessWidget {
  final double width;
  final double height;
  final Color color1;
  final Color color2;

  const DiagonalColorBox({
    super.key,
    required this.width,
    required this.height,
    required this.color1,
    required this.color2,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(width, height),
      painter: _DiagonalPainter(color1, color2),
    );
  }
}

class _DiagonalPainter extends CustomPainter {
  final Color color1;
  final Color color2;

  _DiagonalPainter(this.color1, this.color2);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();

    // Draw first triangle (top-right to bottom-left diagonal)
    paint.color = color1;
    final path1 = Path()
      ..moveTo(size.width, 0)        // Start at top-right corner
      ..lineTo(size.width - 750, 0)  // Move left along the top edge
      ..lineTo(size.width, 500)      // Move down the right edge
      ..close();
    canvas.drawPath(path1, paint);

    // Draw second triangle (bottom-left)
    paint.color = color2;
    final path2 = Path()
      ..moveTo(size.width, 0)
      ..lineTo(size.width, 0)
      ..lineTo(0, size.height)
      ..close();
    canvas.drawPath(path2, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
