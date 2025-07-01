import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CarouselEnlarge extends StatefulWidget {
  const CarouselEnlarge({super.key});

  @override
  State<CarouselEnlarge> createState() => _CarouselEnlargeState();
}

class _CarouselEnlargeState extends State<CarouselEnlarge> {
  final List<String> images = [
    'assets/rectory.jpg',
    'assets/sink.webp',
    'assets/wooster.jpg',
    'assets/wooster2.jpg',
    'assets/kitchen.png',
  ];

  final List<String> captions = [
    '\$1,000 + /sq ft builds\nCLICK TO ENLARGE',
    '\$1,000 + /sq ft builds\nCLICK TO ENLARGE',
    '\$350 – \$950/sq ft builds\nCLICK TO ENLARGE ',
    '\$350 – \$950/sq ft builds \nCLICK TO ENLARGE',
    '\$1,000 + /sq ft builds\nCLICK TO ENLARGE',
  ];
  int _currentIndex = 0;

  double _calculateCarouselHeight(double screenHeight) {
    return screenHeight * 0.5 < 400
        ? 400
        : (screenHeight * 0.5 > 750 ? 750 : screenHeight * 0.5);
  }

  double _calculateCaptionFontSize(double screenWidth) {
    return screenWidth < 400
        ? 18
        : (screenWidth > 800 ? 30 : 20 + (screenWidth - 400) * 0.03);
  }

  double _calculateCarouselWidth(double screenWidth) {
    return screenWidth * 0.7 < 300
        ? 300
        : (screenWidth * 0.7 > 800 ? 800 : screenWidth * 0.7);
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    final carouselHeight = _calculateCarouselHeight(screenHeight);
    final carouselWidth = _calculateCarouselWidth(screenWidth);
    final captionFontSize = _calculateCaptionFontSize(screenWidth);

    return Column(
      children: [
        CarouselSlider.builder(
          itemCount: images.length,
          itemBuilder: (context, index, realIndex) {
            return GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  barrierDismissible: true,
                  barrierColor: Colors.black54,
                  builder: (context) {
                    return Material(
                      color: Colors.transparent,
                      child: GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: () => Navigator.of(context).pop(),
                        child: Container(
                          width: double.infinity,
                          height: double.infinity,
                          alignment: Alignment.center,
                          child: GestureDetector(
                            onTap: () {},
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.asset(
                                images[index],
                                width: carouselWidth * 0.8,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                ),
                width: screenWidth * 0.6,
                height: 500,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(images[index], fit: BoxFit.cover),
                ),
              ),
            );
          },
          options: CarouselOptions(
            height: carouselHeight,
            enlargeCenterPage: false,
            viewportFraction: 0.8,
            enableInfiniteScroll: true,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 2),
            pauseAutoPlayOnTouch: true,
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
        ),

        // Caption
        const SizedBox(height: 16),
        Text(
          captions[_currentIndex],
          style: TextStyle(
            fontSize: captionFontSize,
            fontWeight: FontWeight.w500,
            color: Color.fromARGB(255, 60, 60, 60),
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
