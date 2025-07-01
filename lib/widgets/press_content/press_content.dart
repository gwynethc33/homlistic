import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class PressContent extends StatefulWidget {
  const PressContent({super.key});

  @override
  State<PressContent> createState() => _PressContentState();
}

class _PressContentState extends State<PressContent> {
  bool _isHovering = false;

  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  }

  double responsiveFontSize(
    double screenWidth, {
    double min = 16,
    double max = 28,
  }) {
    const double minWidth = 320;
    const double maxWidth = 1440;
    double clamped = screenWidth.clamp(minWidth, maxWidth);
    return min + (max - min) * ((clamped - minWidth) / (maxWidth - minWidth));
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    double headerFontSize;
    if (screenWidth < 1440) {
      headerFontSize = 40.0;
    } else {
      headerFontSize = 70.0;
    }

    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // PRESS header
          Container(
            height: 250,
            width: double.infinity,
            color: Colors.grey[200],
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 40.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'PRESS',
                  style: TextStyle(
                    fontSize: headerFontSize,
                    fontWeight: FontWeight.w500,
                    color: Color.fromARGB(255, 47, 65, 100),
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
            ),
          ),

          const SizedBox(height: 40),

          // First Image + Text
          LayoutBuilder(
            builder: (context, constraints) {
              final double maxWidth = constraints.maxWidth;
              final double padding = maxWidth < 500 ? 20 : 30;
              final double imageWidth = maxWidth < 900 ? maxWidth * 0.9 : 800;

              return Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: padding,
                  vertical: 30,
                ),
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      MouseRegion(
                        onEnter: (_) => setState(() => _isHovering = true),
                        onExit: (_) => setState(() => _isHovering = false),
                        cursor: SystemMouseCursors.click,
                        child: GestureDetector(
                          onTap: () {
                            _launchURL(
                              'https://www.architecturaldigest.com/story/inside-ads-april-2025-issue-sustainable-living-from-brooklyn-to-kyoto',
                            );
                          },
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Image.asset(
                                'assets/ad.webp',
                                width: imageWidth,
                                fit: BoxFit.cover,
                              ),
                              if (_isHovering)
                                Container(
                                  width: imageWidth,
                                  padding: const EdgeInsets.all(12),
                                  color: const Color.fromARGB(115, 0, 0, 0),
                                  alignment: Alignment.center,
                                  child: Text(
                                    'https://www.architecturaldigest.com/story/inside-ads-april-2025-issue-sustainable-living-from-brooklyn-to-kyoto',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: responsiveFontSize(screenWidth),
                                      decoration: TextDecoration.underline,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        width: imageWidth,
                        child: Text(
                          'BROOKLYN TOWNHOMES\n\nAS FEATURED IN ARCHITECTURAL DIGEST’S APRIL 2025 ISSUE',
                          style: TextStyle(
                            fontSize: responsiveFontSize(screenWidth),
                            color: const Color.fromARGB(230, 79, 82, 88),
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),

          const SizedBox(height: 40),

          // Second Image + Text
          LayoutBuilder(
            builder: (context, constraints) {
              final double maxWidth = constraints.maxWidth;
              final double padding = maxWidth < 500 ? 20 : 30;
              final double imageWidth = maxWidth < 900 ? maxWidth * 0.9 : 800;

              return Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: padding,
                  vertical: 30,
                ),
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      MouseRegion(
                        onEnter: (_) => setState(() => _isHovering = true),
                        onExit: (_) => setState(() => _isHovering = false),
                        cursor: SystemMouseCursors.click,
                        child: GestureDetector(
                          onTap: () {
                            _launchURL(
                              'https://www.architecturaldigest.com/story/inside-ads-april-2025-issue-sustainable-living-from-brooklyn-to-kyoto',
                            );
                          },
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Image.asset(
                                'assets/harlem.png',
                                width: imageWidth,
                                fit: BoxFit.cover,
                              ),
                              if (_isHovering)
                                Container(
                                  width: imageWidth,
                                  padding: const EdgeInsets.all(12),
                                  color: const Color.fromARGB(115, 0, 0, 0),
                                  alignment: Alignment.center,
                                  child: Text(
                                    'https://www.architecturaldigest.com/story/inside-ads-april-2025-issue-sustainable-living-from-brooklyn-to-kyoto',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: responsiveFontSize(screenWidth),
                                      decoration: TextDecoration.underline,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        width: imageWidth,
                        child: Text(
                          'AS FEATURED IN T’s DESIGN & LUXURY ISSUE \n\nTHREE NEW YORK HOMES, EACH UNIQUELY DARING',
                          style: TextStyle(
                            fontSize: responsiveFontSize(screenWidth),
                            color: const Color.fromARGB(230, 79, 82, 88),
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
