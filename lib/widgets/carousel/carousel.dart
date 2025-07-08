import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:homlistic/widgets/translated_text/translated_text.dart';
import 'package:provider/provider.dart';
import 'package:homlistic/controller/language_controller.dart';
import 'dart:async';

class CarouselEnlarge extends StatefulWidget {
  const CarouselEnlarge({super.key});

  @override
  State<CarouselEnlarge> createState() => _CarouselEnlargeState();
}

class _CarouselEnlargeState extends State<CarouselEnlarge> {
  final List<String> images = [
    'assets_webp/Bayside_01.webp',
    'assets_webp/AD0425_GRT_CHARLAP_2.webp',
    'assets_webp/Bayside_02.webp',
    'assets_webp/AD0425_GRT_CHARLAP_3.webp',
    'assets_webp/Bayside_03.webp',
    'assets_webp/AD0425_GRT_CHARLAP_4.webp',
    'assets_webp/Bayside_04.webp',
    'assets_webp/AD0425_GRT_CHARLAP_5.webp',
    'assets_webp/Bayside_05.webp',
    'assets_webp/AD0425_GRT_CHARLAP_6.webp',
    'assets_webp/Betty_01.webp',
    'assets_webp/AD0425_GRT_CHARLAP_7.webp',
    'assets_webp/Betty_02.webp',
    'assets_webp/AD0425_GRT_CHARLAP_8.webp',
    'assets_webp/Betty_03.webp',
    'assets_webp/AD0425_GRT_CHARLAP_9.webp',
    'assets_webp/Betty_04.webp',
    'assets_webp/AD0425_GRT_CHARLAP_11.webp',
    'assets_webp/Doris_01.webp',
    'assets_webp/harlem-rectory_grt-architects_dezeen_2364_col_0-scaled.webp',
    'assets_webp/Doris_02.webp',
    'assets_webp/harlem-rectory_grt-architects_dezeen_2364_col_1-scaled.webp',
    'assets_webp/Doris_03.webp',
    'assets_webp/harlem-rectory_grt-architects_dezeen_2364_col_2-scaled.webp',
    'assets_webp/Doris_04.webp',
    'assets_webp/harlem-rectory_grt-architects_dezeen_2364_col_3-scaled.webp',
    'assets_webp/E 84th St_Social-24.webp',
    'assets_webp/harlem-rectory_grt-architects_dezeen_2364_col_4-scaled.webp',
    'assets_webp/E 84th St_Social-30.webp',
    'assets_webp/harlem-rectory_grt-architects_dezeen_2364_col_5-scaled.webp',
    'assets_webp/E 84th St_Social-33.webp',
    'assets_webp/harlem-rectory_grt-architects_dezeen_2364_col_6-scaled.webp',
    'assets_webp/E 84th St_Social-37.webp',
    'assets_webp/harlem-rectory_grt-architects_dezeen_2364_col_8-scaled.webp',
    'assets_webp/ellen_01.webp',
    'assets_webp/harlem-rectory_grt-architects_dezeen_2364_col_9-scaled.webp',
    'assets_webp/ellen_02.webp',
    'assets_webp/harlem-rectory_grt-architects_dezeen_2364_col_10.webp',
    'assets_webp/ellen_03.webp',
    'assets_webp/harlem-rectory_grt-architects_dezeen_2364_col_11-scaled.webp',
    'assets_webp/ellen_04.webp',
    'assets_webp/harlem-rectory_grt-architects_dezeen_2364_col_13-scaled.webp',
    'assets_webp/ellen_05.webp',
    'assets_webp/harlem-rectory_grt-architects_dezeen_2364_col_14.webp',
    'assets_webp/GregRick_01.webp',
    'assets_webp/harlem-rectory_grt-architects_dezeen_2364_col_15-scaled.webp',
    'assets_webp/GregRick_02.webp',
    'assets_webp/harlem-rectory_grt-architects_dezeen_2364_col_16-scaled.webp',
    'assets_webp/GregRick_03.webp',
    'assets_webp/harlem-rectory_grt-architects_dezeen_2364_col_17-scaled.webp',
    'assets_webp/Kim_01.webp',
    'assets_webp/harlem-rectory_grt-architects_dezeen_2364_col_18-scaled.webp',
    'assets_webp/Kim_02.webp',
    'assets_webp/harlem-rectory_grt-architects_dezeen_2364_col_19.webp',
    'assets_webp/Kim_03.webp',
    'assets_webp/harlem-rectory_grt-architects_dezeen_2364_col_20-scaled.webp',
    'assets_webp/Visionaire_00.webp',
    'assets_webp/harlem-rectory_grt-architects_dezeen_2364_col_21.webp',
    'assets_webp/Visionaire_01.webp',
    'assets_webp/harlem-rectory_grt-architects_dezeen_herp2.webp',
    'assets_webp/Visionaire_02.webp',
    'assets_webp/Visionaire_03.webp',
    'assets_webp/Visionaire_04.webp',
    'assets_webp/Visionaire_05.webp',
    'assets_webp/Visionaire_06.webp',
    'assets_webp/Visionaire_07.webp',
    'assets_webp/Wooster_01.webp',
    'assets_webp/Wooster_02.webp',
    'assets_webp/Wooster_03.webp',
    'assets_webp/Wooster_04.webp',
    'assets_webp/Wooster_05.webp',
    'assets_webp/Wooster_06.webp',
    'assets_webp/Wooster_08.webp',
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

  @override
  void initState() {
    super.initState();
    // Precache images
    WidgetsBinding.instance.addPostFrameCallback((_) {
      for (final imagePath in images) {
        precacheImage(AssetImage(imagePath), context);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    context.watch<LanguageController>();
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    final carouselHeight = _calculateCarouselHeight(screenHeight);
    final captionFontSize = _calculateCaptionFontSize(screenWidth);

    return Column(
      children: [
        CarouselSlider.builder(
          itemCount: images.length,
          itemBuilder: (context, index, realIndex) {
            return GestureDetector(
              onTap: () async {
                final maxDialogWidth = screenWidth * 0.95;
                final maxDialogHeight = screenHeight * 0.95;

                final imageProvider = AssetImage(images[index]);
                final completer = Completer<Size>();

                imageProvider
                    .resolve(const ImageConfiguration())
                    .addListener(
                      ImageStreamListener((ImageInfo info, bool _) {
                        final myImageSize = Size(
                          info.image.width.toDouble(),
                          info.image.height.toDouble(),
                        );
                        completer.complete(myImageSize);
                      }),
                    );

                final imageSize = await completer.future;
                if (!mounted) return;

                final imageAspectRatio = imageSize.width / imageSize.height;
                double displayWidth;
                double displayHeight;

                if (maxDialogWidth / maxDialogHeight > imageAspectRatio) {
                  // Limited by height
                  displayHeight = maxDialogHeight;
                  displayWidth = displayHeight * imageAspectRatio;
                } else {
                  // Limited by width
                  displayWidth = maxDialogWidth;
                  displayHeight = displayWidth / imageAspectRatio;
                }

                showDialog(
                  context: this.context,
                  barrierDismissible: true,
                  barrierColor: Colors.black54,
                  builder: (context) {
                    final iconSize = _getCloseIconSize(screenWidth);
                    return Material(
                      color: Colors.transparent,
                      child: GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: () => Navigator.of(context).pop(),
                        child: Center(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Stack(
                              children: [
                                SizedBox(
                                  width: displayWidth,
                                  height: displayHeight,
                                  child: Image.asset(
                                    images[index],
                                    width: displayWidth,
                                    height: displayHeight,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                Positioned(
                                  top: 8,
                                  right: 8,
                                  child: GestureDetector(
                                    onTap: () => Navigator.of(context).pop(),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.black54,
                                        shape: BoxShape.circle,
                                      ),
                                      padding: const EdgeInsets.all(6),
                                      child: Icon(
                                        Icons.close,
                                        color: Colors.white,
                                        size: iconSize,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
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

double _getCloseIconSize(double screenWidth) {
  if (screenWidth > 800) {
    return 40;
  } else if (screenWidth > 400) {
    return 24 + (screenWidth - 400) * 0.04;
  } else {
    return 16;
  }
}
