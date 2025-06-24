import 'package:flutter/material.dart';

class PressContent extends StatelessWidget {
  const PressContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 250,
            width: double.infinity,
            color: Colors.grey[200],
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  double maxWidth = constraints.maxWidth;
                  double fontSize = maxWidth < 600 ? 30 : 45;

                  return Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'WHO WE ARE',
                      style: TextStyle(
                        fontSize: fontSize,
                        fontWeight: FontWeight.w500,
                        color: const Color.fromARGB(255, 47, 65, 100),
                      ),
                      textAlign: TextAlign.left,
                    ),
                  );
                },
              ),
            ),
          ),

          // Second box
          LayoutBuilder(
            builder: (context, constraints) {
              double screenWidth = constraints.maxWidth;
              double fontSize = screenWidth < 600 ? 17 : 25;

              return ColoredBox(
                color: const Color.fromARGB(255, 255, 254, 254),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 60,
                    horizontal: 70,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 4,
                        child: Text(
                          'Homlistic is a New York-based team of builders committed to delivering high-quality residential and commercial spaces with clarity, care, and consistency.\n\n'
                          'Founded by Bob Chan, whose tech background shaped a meticulous, systems-driven approach, Homlistic blends precision, foresight, and hands-on execution. '
                          'From planning to construction, we lead with transparency and purpose — never cutting corners and always staying aligned with our clients\' goals.',
                          style: TextStyle(
                            fontSize: fontSize,
                            color: const Color.fromARGB(255, 120, 115, 115),
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),

                      const SizedBox(width: 60),

                      Expanded(
                        flex: 3,
                        child: Container(
                          height: 400,
                          color: Colors.transparent,
                          child: Image.asset(
                            'assets/bob.jpg',
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
          LayoutBuilder(
            builder: (context, constraints) {
              double screenWidth = constraints.maxWidth;
              double fontSize = screenWidth < 600 ? 16 : 22;

              return Container(
                width: double.infinity,
                color: Colors.red,
                padding: const EdgeInsets.symmetric(
                  vertical: 40,
                  horizontal: 20,
                ),
                child: Text(
                  'FAQ placeholder.',
                  style: TextStyle(color: Colors.white, fontSize: fontSize),
                  textAlign: TextAlign.center,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
