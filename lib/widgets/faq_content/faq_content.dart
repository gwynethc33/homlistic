import 'package:flutter/material.dart';
import 'package:homlistic/widgets/carousel/carousel.dart';
import 'package:homlistic/widgets/translated_text/translated_text.dart';
import 'package:homlistic/controller/language_controller.dart';
import 'package:provider/provider.dart';

class FaqContent extends StatelessWidget {
  const FaqContent({super.key});

  double calculateFontSize(double screenWidth, double minFont, double maxFont) {
    const minScreenWidth = 300.0;
    const maxScreenWidth = 1600.0;
    final clampedWidth = screenWidth.clamp(minScreenWidth, maxScreenWidth);
    return minFont +
        (maxFont - minFont) *
            ((clampedWidth - minScreenWidth) /
                (maxScreenWidth - minScreenWidth));
  }

  double calculateHorizontalPadding(double screenWidth) {
    if (screenWidth < 600) return 20;
    if (screenWidth < 900) return 40;
    return 80;
  }

  double calculateHorizontalMargin(
    double screenWidth, {
    double min = 16,
    double max = 100,
  }) {
    const minWidth = 320;
    const maxWidth = 1200;
    return min +
        (max - min) *
            ((screenWidth.clamp(minWidth, maxWidth) - minWidth) /
                (maxWidth - minWidth));
  }

  double calculateVerticalSpacing(
    double screenHeight, {
    double min = 16,
    double max = 50,
  }) {
    const minHeight = 600;
    const maxHeight = 1200;
    return min +
        (max - min) *
            ((screenHeight.clamp(minHeight, maxHeight) - minHeight) /
                (maxHeight - minHeight));
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    context.watch<LanguageController>();

    double headerFontSize;
    if (screenWidth < 1440) {
      headerFontSize = 40.0;
    } else {
      headerFontSize = 70.0;
    }
    final descriptionFontSize = calculateFontSize(screenWidth, 18, 36);
    final faqTitleFontSize = calculateFontSize(screenWidth, 28, 50);
    final questionFontSize = calculateFontSize(screenWidth, 22, 40);
    final answerFontSize = calculateFontSize(screenWidth, 18, 33);

    final hMargin = calculateHorizontalMargin(screenWidth);
    final hPadding = calculateHorizontalMargin(screenWidth, min: 20, max: 60);
    final vSpacing = calculateVerticalSpacing(screenHeight);

    return Container(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Container(
              height: 250,
              width: double.infinity,
              color: Colors.grey[200],
              padding: EdgeInsets.symmetric(horizontal: hPadding),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return Align(
                    alignment: Alignment.centerLeft,
                    child: TranslatedText(
                      'faq_header',
                      style: TextStyle(
                        fontSize: headerFontSize,
                        fontWeight: FontWeight.w500,
                        color: const Color.fromARGB(255, 47, 65, 100),
                      ),
                      textAlign: TextAlign.left,
                    ),
                  );
                },
              ),
            ),

            // Description text
            ColoredBox(
              color: Colors.white,
              child: Center(
                child: Container(
                  constraints: const BoxConstraints(maxWidth: 900),
                  padding: EdgeInsets.symmetric(
                    horizontal: hPadding,
                    vertical: vSpacing * 1.5,
                  ),
                  child: TranslatedText(
                    'faq_description',
                    style: TextStyle(
                      fontSize: descriptionFontSize,
                      color: const Color.fromARGB(255, 120, 115, 115),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),

            // FAQ section
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/faq.png'),
                  fit: BoxFit.cover,
                ),
              ),
              padding: EdgeInsets.symmetric(
                horizontal: hPadding,
                vertical: vSpacing * 1.5,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TranslatedText(
                    'faq_box',
                    style: TextStyle(
                      color: const Color.fromARGB(255, 44, 73, 120),
                      fontSize: faqTitleFontSize,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(height: vSpacing),

                  SizedBox(
                    width: double.infinity,
                    child: Container(
                      constraints: const BoxConstraints(maxWidth: 900),
                      padding: EdgeInsets.all(vSpacing * 0.75),
                      margin: EdgeInsets.symmetric(horizontal: hMargin),
                      color: const Color.fromARGB(
                        111,
                        196,
                        196,
                        196,
                      ), // semi-transparent background
                      child: TranslatedText(
                        'faq_question_cost',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: questionFontSize,
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  SizedBox(height: vSpacing),
                  SizedBox(
                    width: double.infinity,
                    child: Container(
                      padding: EdgeInsets.all(vSpacing * 0.75),
                      constraints: const BoxConstraints(maxWidth: 1000),
                      margin: EdgeInsets.symmetric(horizontal: hMargin),
                      color: const Color.fromARGB(255, 254, 253, 253),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: hPadding,
                              vertical: vSpacing,
                            ),
                            child: Center(
                              child: Container(
                                constraints: BoxConstraints(maxWidth: 2500),
                                child: TranslatedText(
                                  'faq_answer_cost',
                                  style: TextStyle(
                                    color: const Color.fromARGB(
                                      255,
                                      44,
                                      44,
                                      44,
                                    ),
                                    fontSize: answerFontSize,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: vSpacing),
                          const CarouselEnlarge(),
                          SizedBox(height: vSpacing),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: vSpacing),
                  SizedBox(
                    width: double.infinity,
                    child: Container(
                      constraints: const BoxConstraints(maxWidth: 1000),
                      padding: EdgeInsets.all(vSpacing * 0.75),
                      margin: EdgeInsets.symmetric(horizontal: hMargin),
                      color: const Color.fromARGB(
                        111,
                        196,
                        196,
                        196,
                      ), // semi-transparent background
                      child: TranslatedText(
                        'faq_question_services',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: questionFontSize,
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  SizedBox(height: vSpacing),
                  SizedBox(
                    width: double.infinity,
                    child: Container(
                      padding: EdgeInsets.all(vSpacing * 0.75),
                      constraints: const BoxConstraints(maxWidth: 1000),
                      margin: EdgeInsets.symmetric(horizontal: hMargin),
                      color: const Color.fromARGB(255, 254, 253, 253),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: hPadding,
                              vertical: vSpacing,
                            ),
                            child: Center(
                              child: Container(
                                constraints: BoxConstraints(maxWidth: 2400),
                                child: TranslatedText(
                                  'faq_answer_services',
                                  style: TextStyle(
                                    color: const Color.fromARGB(
                                      255,
                                      44,
                                      44,
                                      44,
                                    ),
                                    fontSize: answerFontSize,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: vSpacing),
                  SizedBox(
                    width: double.infinity,
                    child: Container(
                      constraints: const BoxConstraints(maxWidth: 1000),
                      padding: EdgeInsets.all(vSpacing * 0.75),
                      margin: EdgeInsets.symmetric(horizontal: hMargin),
                      color: const Color.fromARGB(
                        111,
                        196,
                        196,
                        196,
                      ), // semi-transparent background
                      child: TranslatedText(
                        'faq_question_fit',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: questionFontSize,
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  SizedBox(height: vSpacing),
                  SizedBox(
                    width: double.infinity,
                    child: Container(
                      padding: EdgeInsets.all(vSpacing * 0.75),
                      constraints: const BoxConstraints(maxWidth: 1000),
                      margin: EdgeInsets.symmetric(horizontal: hMargin),
                      color: const Color.fromARGB(255, 254, 253, 253),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: hPadding,
                              vertical: vSpacing,
                            ),
                            child: Center(
                              child: Container(
                                constraints: BoxConstraints(maxWidth: 2400),
                                child: TranslatedText(
                                  'faq_answer_fit',
                                  style: TextStyle(
                                    color: const Color.fromARGB(
                                      255,
                                      44,
                                      44,
                                      44,
                                    ),
                                    fontSize: answerFontSize,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
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
