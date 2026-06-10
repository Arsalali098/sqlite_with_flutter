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
    final screenHeigth = MediaQuery.of(context).size.height;

    return Expanded(
      child: Center(
        child: Container(
            width: screenWidth * 0.7,
            // height: screenHeigth * 0.5,
            decoration: BoxDecoration(
                color: bgColor,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: borderColor, width: 4)
            ),
            child: Stack(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  spacing: 20,
                  children: [
                    Image.asset(
                      imagePath,
                      width: double.infinity,
                      height: screenHeigth * 0.3,
                      fit: BoxFit.contain,
                      alignment: Alignment.center,
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.all(screenWidth * 0.06),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: 25,
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
                              fontSize: 25,
                            ),
                          ),
                          CircleAvatar(
                            radius: 22,
                            backgroundColor: Colors.white,
                            child: const Icon(Icons.add, color: Colors.black, size: 28,),
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
      ),
    );
  }
}
