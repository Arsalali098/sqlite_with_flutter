import 'package:flutter/material.dart';
import 'package:path/path.dart';

class CarousleSlider extends StatefulWidget {
  const CarousleSlider({super.key});

  @override
  State<CarousleSlider> createState() => _CarousleSliderState();
}

class _CarousleSliderState extends State<CarousleSlider> {

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Center(
        // card 1
        child: Container(
          width: screenWidth * 0.8,
          height: 500,
          decoration: BoxDecoration(
            color: Color(0xff93dffa),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Color(0xff349bdb), width: 4)
          ),
          child: Stack(
            children: [
                Image.asset(
                  "assets/images/Shoes_images-removebg-preview.png",
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
                      "Black\nDashers",
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
                          "\$64",
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

        // card 2

      ),
    );
  }
}
