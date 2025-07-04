import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:homlistic/widgets/translated_text/translated_text.dart';
import 'package:provider/provider.dart';
import 'package:homlistic/controller/language_controller.dart';

class CarouselEnlarge extends StatefulWidget {
  const CarouselEnlarge({super.key});

  @override
  State<CarouselEnlarge> createState() => _CarouselEnlargeState();
}

class _CarouselEnlargeState extends State<CarouselEnlarge> {
  final List<String> images = [
    'assets/Bayside_01.jpg',
    'assets/AD0425_GRT_CHARLAP_2.webp',
    'assets/Bayside_02.jpg',
    'assets/AD0425_GRT_CHARLAP_3.webp',
    'assets/Bayside_03.jpg',
    'assets/AD0425_GRT_CHARLAP_4.webp',
    'assets/Bayside_04.jpg',
    'assets/AD0425_GRT_CHARLAP_5.webp',
    'assets/Bayside_05.jpg',
    'assets/AD0425_GRT_CHARLAP_6.webp',
    'assets/Betty_01.jpg',
    'assets/AD0425_GRT_CHARLAP_7.webp',
    'assets/Betty_02.jpg',
    'assets/AD0425_GRT_CHARLAP_8.webp',
    'assets/Betty_03.jpg',
    'assets/AD0425_GRT_CHARLAP_9.webp',
    'assets/Betty_04.jpg',
    'assets/AD0425_GRT_CHARLAP_11.webp',
    'assets/Doris_01.jpg',
    'assets/harlem-rectory_grt-architects_dezeen_2364_col_0-scaled.jpg',
    'assets/Doris_02.jpg',
    'assets/harlem-rectory_grt-architects_dezeen_2364_col_1-scaled.jpg',
    'assets/Doris_03.jpg',
    'assets/harlem-rectory_grt-architects_dezeen_2364_col_2-scaled.jpg',
    'assets/Doris_04.jpg',
    'assets/harlem-rectory_grt-architects_dezeen_2364_col_3-scaled.jpg',
    'assets/E 84th St_Social-24.jpg',
    'assets/harlem-rectory_grt-architects_dezeen_2364_col_4-scaled.jpg',
    'assets/E 84th St_Social-30.jpg',
    'assets/harlem-rectory_grt-architects_dezeen_2364_col_5-scaled.jpg',
    'assets/E 84th St_Social-33.jpg',
    'assets/harlem-rectory_grt-architects_dezeen_2364_col_6-scaled.jpg',
    'assets/E 84th St_Social-37.jpg',
    'assets/harlem-rectory_grt-architects_dezeen_2364_col_8-scaled.jpg',
    'assets/ellen_01.jpg',
    'assets/harlem-rectory_grt-architects_dezeen_2364_col_9-scaled.jpg',
    'assets/ellen_02.jpg',
    'assets/harlem-rectory_grt-architects_dezeen_2364_col_10.jpg',
    'assets/ellen_03.jpg',
    'assets/harlem-rectory_grt-architects_dezeen_2364_col_11-scaled.jpg',
    'assets/ellen_04.jpg',
    'assets/harlem-rectory_grt-architects_dezeen_2364_col_13-scaled.jpg',
    'assets/ellen_05.jpg',
    'assets/harlem-rectory_grt-architects_dezeen_2364_col_14.jpg',
    'assets/GregRick_01.jpg',
    'assets/harlem-rectory_grt-architects_dezeen_2364_col_15-scaled.jpg',
    'assets/GregRick_02.jpg',
    'assets/harlem-rectory_grt-architects_dezeen_2364_col_16-scaled.jpg',
    'assets/GregRick_03.jpg',
    'assets/harlem-rectory_grt-architects_dezeen_2364_col_17-scaled.jpg',
    'assets/Kim_01.jpg',
    'assets/harlem-rectory_grt-architects_dezeen_2364_col_18-scaled.jpg',
    'assets/Kim_02.jpg',
    'assets/harlem-rectory_grt-architects_dezeen_2364_col_19.jpg',
    'assets/Kim_03.jpg',
    'assets/harlem-rectory_grt-architects_dezeen_2364_col_20-scaled.jpg',
    'assets/Visionaire_00.jpg',
    'assets/harlem-rectory_grt-architects_dezeen_2364_col_21.jpg',
    'assets/Visionaire_01.jpg',
    'assets/harlem-rectory_grt-architects_dezeen_herp2.webp',
    'assets/Visionaire_02.jpg',
    'assets/Visionaire_03.jpg',
    'assets/Visionaire_04.jpg',
    'assets/Visionaire_05.jpg',
    'assets/Visionaire_06.jpg',
    'assets/Visionaire_07.jpg',
    'assets/Wooster_01.jpg',
    'assets/Wooster_02.jpg',
    'assets/Wooster_03.jpg',
    'assets/Wooster_04.jpg',
    'assets/Wooster_05.jpg',
    'assets/Wooster_06.jpg',
    'assets/Wooster_08.jpg',
  ];

  final List<String> captions = [
    'carousel.caption1',
    'carousel.caption2',
    'carousel.caption1',
    'carousel.caption2',
    'carousel.caption1',
    'carousel.caption2',
    'carousel.caption1',
    'carousel.caption2',
    'carousel.caption1',
    'carousel.caption2',
    'carousel.caption1',
    'carousel.caption2',
    'carousel.caption1',
    'carousel.caption2',
    'carousel.caption1',
    'carousel.caption2',
    'carousel.caption1',
    'carousel.caption2',
    'carousel.caption1',
    'carousel.caption2',
    'carousel.caption1',
    'carousel.caption2',
    'carousel.caption1',
    'carousel.caption2',
    'carousel.caption1',
    'carousel.caption2',
    'carousel.caption1',
    'carousel.caption2',
    'carousel.caption1',
    'carousel.caption2',
    'carousel.caption1',
    'carousel.caption2',
    'carousel.caption1',
    'carousel.caption2',
    'carousel.caption1',
    'carousel.caption2',
    'carousel.caption1',
    'carousel.caption2',
    'carousel.caption1',
    'carousel.caption2',
    'carousel.caption1',
    'carousel.caption2',
    'carousel.caption1',
    'carousel.caption2',
    'carousel.caption1',
    'carousel.caption2',
    'carousel.caption1',
    'carousel.caption2',
    'carousel.caption1',
    'carousel.caption2',
    'carousel.caption1',
    'carousel.caption2',
    'carousel.caption1',
    'carousel.caption2',
    'carousel.caption1',
    'carousel.caption2',
    'carousel.caption1',
    'carousel.caption2',
    'carousel.caption1',
    'carousel.caption2',
    'carousel.caption1',
    'carousel.caption1',
    'carousel.caption1',
    'carousel.caption1',
    'carousel.caption1',
    'carousel.caption1',
    'carousel.caption1',
    'carousel.caption1',
    'carousel.caption1',
    'carousel.caption1',
    'carousel.caption1',
    'carousel.caption1',
    'carousel.caption1',
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
    context.watch<LanguageController>();
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
        TranslatedText(
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
