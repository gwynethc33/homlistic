import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AppFooter extends StatelessWidget {
  const AppFooter({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    double fontSize;
    if (screenWidth < 600) {
      fontSize = 14;
    } else if (screenWidth < 1200) {
      fontSize = 18;
    } else {
      fontSize = 26;
    }
    double iconSize;
    if (screenWidth < 600) {
      iconSize = 14;
    } else if (screenWidth < 1200) {
      iconSize = 20;
    } else {
      iconSize = 30;
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
      child: Row(
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
              _contactInfo(fontSize, iconSize, TextAlign.left),
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

  Widget _contactInfo(double fontSize, double iconSize, TextAlign align) {
    return Column(
      crossAxisAlignment: align == TextAlign.left
          ? CrossAxisAlignment.start
          : CrossAxisAlignment.center,
      children: [
        Text(
          'CONTACT',
          style: TextStyle(
            color: Color.fromARGB(255, 97, 96, 96),
            fontSize: iconSize * 0.6 + 8,
            fontWeight: FontWeight.w500,
          ),
          textAlign: align,
        ),
        SizedBox(height: 8),
        Text(
          'inquiry@homlistic.com',
          style: TextStyle(
            color: const Color.fromARGB(179, 47, 46, 46),
            fontSize: fontSize - 2,
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
        Text(
          'SOCIAL',
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
