import 'package:flutter/material.dart';

class ReusableDetailedCard extends StatefulWidget {

  final String imagePath;
  final String title;
  final String price;
  final Color color1;
  final String category;
  final String description;

  const ReusableDetailedCard({super.key, required this.imagePath, required this.title, required this.price, required this.color1, required this.category, required this.description});

  @override
  State<ReusableDetailedCard> createState() => _ReusableDetailedCardState();
}

class _ReusableDetailedCardState extends State<ReusableDetailedCard> {
  final List<String> sizes = ["5", "6", "7", "8", "9"];
  final List<Color> colors = [Colors.blue, Colors.black];
  Color? selectedColor;
  String? selectedSize;

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
              color1: widget.color1,
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
                      widget.imagePath,
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
                              widget.title,
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          Text(
                            widget.price,
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
                              widget.category,
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
                                widget.description,
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
                                ...sizes.map((size) {
                                  final bool isSelected = size == selectedSize;
                                  return ChoiceChip(
                                      label: Text(size),
                                      selected: isSelected,
                                      labelStyle: TextStyle(
                                        color: isSelected ? Colors.black : Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      showCheckmark: false,
                                      selectedColor: widget.color1,
                                      onSelected: (_) {
                                        setState(() {
                                          selectedSize = size;
                                        });
                                      },
                                      shape: CircleBorder(
                                        side: BorderSide(
                                          color: Colors.black, // Border color
                                          width: 1,           // Border width
                                        ),
                                      ),
                                  );
                                }).toList(),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                ...colors.map((color) {
                                  final bool isSelected = color == selectedColor;
                                  return GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        selectedColor = color;
                                      });
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(2.0),
                                      child: Container(
                                        width: 35,
                                        height: 35,
                                        decoration: BoxDecoration(
                                          color: color,
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                            color: isSelected ? widget.color1 : Colors.grey,
                                            width: isSelected ? 4 : 1,
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                }).toList(),
                              ],
                            ),
                          ],
                          ),
                        ),
                        // const SizedBox(height: 3),
                        Container(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text("${widget.title} added to cart!")),
                              );
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
