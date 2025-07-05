import 'package:flutter/material.dart';
import 'package:homlistic/widgets/translated_text/translated_text.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:homlistic/controller/language_controller.dart';
import 'package:provider/provider.dart';

class AppFooter extends StatelessWidget {
  const AppFooter({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    context.watch<LanguageController>();

    double iconSize;
    if (screenWidth < 600) {
      iconSize = 18;
    } else if (screenWidth < 1200) {
      iconSize = 24;
    } else {
      iconSize = 33;
    }
    double imageHeight;
    if (screenWidth < 600) {
      imageHeight = 40;
    } else if (screenWidth < 1200) {
      imageHeight = 50;
    } else {
      imageHeight = 90;
    }
    double horizontalPadding = (screenWidth * 0.05).clamp(16, 50);

    return Container(
      color: const Color.fromARGB(255, 255, 255, 255),
      padding: EdgeInsets.symmetric(
        vertical: 40,
        horizontal: horizontalPadding,
      ),
      width: double.infinity,
      child: screenWidth < 600
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: imageHeight,
                  child: _footerImage(imageHeight, context),
                ),
                const SizedBox(height: 20),
                _contactInfo(context),
                const SizedBox(height: 20),
                _linkedin(iconSize, TextAlign.center),
              ],
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: imageHeight,
                  child: _footerImage(imageHeight, context),
                ),
                const Spacer(),
                Row(
                  children: [
                    _contactInfo(context),
                    const SizedBox(width: 40),
                    _linkedin(iconSize, TextAlign.left),
                  ],
                ),
              ],
            ),
    );
  }

  Widget _footerImage(double imageHeight, BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/');
      },
      child: SizedBox(
        height: imageHeight,
        child: Image.asset('assets/footer.png', fit: BoxFit.contain),
      ),
    );
  }

  Widget _contactInfo(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    double fontSize = screenWidth < 400 ? 12 : 23;
    double verticalSpacing = screenWidth < 400 ? 30 : 60;
    TextAlign align = screenWidth < 600 ? TextAlign.center : TextAlign.left;
    CrossAxisAlignment crossAxisAlign = align == TextAlign.left
        ? CrossAxisAlignment.start
        : CrossAxisAlignment.center;

    return Column(
      crossAxisAlignment: crossAxisAlign,
      children: [
        SizedBox(height: verticalSpacing),
        TranslatedText(
          'footer_copyright',
          style: TextStyle(
            color: const Color.fromARGB(179, 47, 46, 46),
            fontSize: fontSize,
          ),
          textAlign: align,
        ),
      ],
    );
  }

  Widget _linkedin(double iconSize, TextAlign align) {
    return Column(
      crossAxisAlignment: align == TextAlign.left
          ? CrossAxisAlignment.start
          : CrossAxisAlignment.center,
      children: [
        TranslatedText(
          'footer_social',
          style: TextStyle(
            color: Color.fromARGB(255, 97, 96, 96),
            fontSize: iconSize * 0.6 + 8,
            fontWeight: FontWeight.w500,
          ),
          textAlign: align,
        ),
        SizedBox(height: 8),
        IconButton(
          icon: Icon(
            FontAwesomeIcons.linkedin,
            color: Color.fromARGB(255, 47, 65, 100),
            size: iconSize,
          ),
          onPressed: () {
            launchUrl(
              Uri.parse(
                'https://www.linkedin.com/company/homlistic/about/?viewAsMember=true',
              ),
            );
          },
        ),
      ],
    );
  }
}
