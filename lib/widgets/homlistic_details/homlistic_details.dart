import 'package:flutter/material.dart';
import 'package:homlistic/widgets/fade_in/fade_in.dart';

class HomlisticDetails extends StatelessWidget {
  const HomlisticDetails({super.key});

  @override
  Widget build(BuildContext context) {
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
                text:
                    'Homlistic was founded on a powerful principle: In an industry often clouded by opacity, we lead by honesty and transparency.\n\n As a construction management and general contracting firm operating at the highest level of craftsmanship, Homlistic builds with intention, integrity, and an unwavering respect for both people and process. This belief guides everything Homlistic does.\n\n The name Homlistic—a fusion of home and holistic—captures this philosophy. It speaks to a building experience that’s complete and considered, one that goes far beyond luxury finishes to focus on how every element comes together, seamlessly and beautifully.\n\n The result is not just a home—it’s a work of harmony, where craftsmanship reveals the true beauty within design and brings the vision to life.',
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
