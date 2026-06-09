import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {

  final String imagePath;
  final String title;
  final String price;
  final Color bgColor;
  final Color borderColor;

  const ReusableCard ({super.key, required this.imagePath, required this.title, required this.price, required this.bgColor, required this.borderColor});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Center(
      child: Container(
          width: screenWidth * 0.8,
          height: 500,
          decoration: BoxDecoration(
              color: bgColor,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: borderColor, width: 4)
          ),
          child: Stack(
            children: [
              Image.asset(
                imagePath,
                width: 300,
                height: 390,
                fit: BoxFit.cover,
                alignment: AlignmentGeometry.topCenter,
              ),
              Padding(
                padding: const EdgeInsets.all(26.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          price,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 30,
                          ),
                        ),
                        CircleAvatar(
                          radius: 20,
                          backgroundColor: Colors.white,
                          child: const Icon(Icons.add, color: Colors.black, size: 30,),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
    );
  }
}
