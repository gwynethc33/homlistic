import 'package:flutter/material.dart';
import 'package:homlistic/widgets/fade_in/fade_in.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:homlistic/controller/language_controller.dart';
import 'package:provider/provider.dart';

class HomlisticDetails extends StatelessWidget {
  const HomlisticDetails({super.key});

  @override
  Widget build(BuildContext context) {
    context.watch<LanguageController>();
    final screenWidth = MediaQuery.of(context).size.width;
    final double frontImageHeight = screenWidth * 0.4;
    final double homeImageHeight = screenWidth * 0.35;

    double calculateFontSize(double min, double max) {
      final double minScreenWidth = 300;
      final double maxScreenWidth = 1600;
      final double clampedWidth = screenWidth.clamp(
        minScreenWidth,
        maxScreenWidth,
      );

      return min +
          (max - min) *
              ((clampedWidth - minScreenWidth) /
                  (maxScreenWidth - minScreenWidth));
    }

    final double textFontSize = calculateFontSize(17, 30);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          'assets/front.png',
          height: frontImageHeight < 250 ? 250 : frontImageHeight,
          fit: BoxFit.cover,
          width: screenWidth,
        ),

        ColoredBox(
          color: const Color.fromARGB(255, 44, 73, 120),
          child: Center(
            child: Container(
              constraints: const BoxConstraints(maxWidth: 1100),
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 60),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 44, 73, 120),
              ),
              child: FadeInText(
                text: 'homlistic_description'.tr(),
                fontSize: textFontSize,
                color: const Color.fromARGB(255, 255, 255, 255),
              ),
            ),
          ),
        ),
        Image.asset(
          'assets/home.png',
          height: homeImageHeight < 250 ? 250 : homeImageHeight,
          fit: BoxFit.cover,
          width: screenWidth, // full width
        ),
      ],
    );
  }
}
