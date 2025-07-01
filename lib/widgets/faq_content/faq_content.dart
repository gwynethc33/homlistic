import 'package:flutter/material.dart';
import 'package:homlistic/widgets/carousel/carousel.dart';

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
                    child: Text(
                      'HOW WE DO IT',
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
                  child: Text(
                    'We value honesty, integrity, & accountability. We have pride in our craft, are professional & value our people.\n\nOur work reflects our quiet devotion to trust, humility, and the invisible strength of values.',
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
                  Text(
                    'FREQUENTLY ASKED QUESTIONS',
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
                      child: Text(
                        'What does it cost to work with your company for a renovation?',
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
                                child: Text(
                                  'Most of our projects fall between \$350–\$950 per square foot, with a smaller number—around 20%—exceeding \$1,000 per square foot.\n\n'
                                  'This range reflects more than just materials and labor; it speaks to the level of detail, customization, and coordination each build requires. We use per-square-foot pricing as a general framework to help clients understand the investment behind their space.\n\n'
                                  'A 1,000-square-foot build at \$100 per square foot, for instance, would total around \$100,000. But that figure shifts based on finish level, complexity, and intent. High-end finishes, architectural detailing, or unique constraints naturally raise the rate. Simpler scopes come in lower.\n\n'
                                  'Either way, we approach every project with the same commitment to clarity, precision, and craft.',
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
                      child: Text(
                        'What services do you provide?',
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
                                child: Text(
                                  'As builders, our role goes far beyond managing timelines and budgets. '
                                  'We interpret architectural intent, coordinate trades, oversee site logistics, '
                                  'and ensure every detail aligns with the highest standards of safety, quality, and craftsmanship.\n\n'
                                  'We work closely with clients, architects, engineers, and inspectors to ensure each structure '
                                  'is not only built to code—but built with integrity.\n\n'
                                  'From solving on-site challenges to maintaining seamless workflows, '
                                  'we stay grounded in the belief that how something is built matters just as much as what gets built.',
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
