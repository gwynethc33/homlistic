import 'package:flutter/material.dart';
import 'package:homlistic/widgets/translated_text/translated_text.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:homlistic/controller/language_controller.dart';
import 'package:provider/provider.dart';
import 'package:easy_localization/easy_localization.dart';

class ContactContent extends StatefulWidget {
  const ContactContent({super.key});

  @override
  State<ContactContent> createState() => _ContactContentState();
}

class _ContactContentState extends State<ContactContent> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController projectTypeController = TextEditingController();
  final TextEditingController messageController = TextEditingController();

  bool isLoading = false;

  Future<void> sendEmail() async {
    String encodeBody(String body) {
      return Uri.encodeComponent(body).replaceAll('+', '%20');
    }

    final String toEmail = 'homlisticrenovation@gmail.com';
    final String subject = 'Project: ${projectTypeController.text}';
    final String body =
        '''
Name: ${firstNameController.text} ${lastNameController.text}
Email: ${emailController.text}
Phone: ${phoneController.text}

Message:
${messageController.text}
''';

    final String encodedSubject = Uri.encodeComponent(subject);
    final String encodedBody = encodeBody(body);

    final Uri emailUri = Uri.parse(
      'mailto:$toEmail?subject=$encodedSubject&body=$encodedBody',
    );

    if (await canLaunchUrl(emailUri)) {
      await launchUrl(emailUri);
      firstNameController.clear();
      lastNameController.clear();
      emailController.clear();
      phoneController.clear();
      projectTypeController.clear();
      messageController.clear();
    } else {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Could not open the email client.')),
      );
    }
  }

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    projectTypeController.dispose();
    messageController.dispose();
    super.dispose();
  }

  double calculateFontSize(double screenWidth, double minFont, double maxFont) {
    const minWidth = 320.0;
    const maxWidth = 2560.0;
    final clampedWidth = screenWidth.clamp(minWidth, maxWidth);
    final scale = (clampedWidth - minWidth) / (maxWidth - minWidth);
    double baseSize = minFont + (maxFont - minFont) * scale;
    if (screenWidth > 1920) {
      final extraScale = ((screenWidth - 1920) / (maxWidth - 1920)).clamp(0, 1);
      final extraBoost = (maxFont * 0.3) * extraScale;
      return baseSize + extraBoost;
    }
    return baseSize;
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
    double min = 8,
    double max = 30,
  }) {
    const minHeight = 600;
    const maxHeight = 1200;
    return min +
        (max - min) *
            ((screenHeight.clamp(minHeight, maxHeight) - minHeight) /
                (maxHeight - minHeight));
  }

  Widget contactRow(
    IconData icon,
    String text, {
    double fontSize = 16,
    double iconSize = 24,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: Colors.white, size: iconSize),
          const SizedBox(width: 12),
          Flexible(
            child: Text(
              text,
              style: TextStyle(color: Colors.white, fontSize: fontSize),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildTextField(
    String labelKey, {
    String? hintKey,

    required double screenWidth,
    int maxLines = 1,
    required TextEditingController controller,
  }) {
    final labelFontSize = calculateFontSize(screenWidth, 22, 27);
    final inputFontSize = calculateFontSize(screenWidth, 22, 27);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TranslatedText(
          labelKey,
          style: TextStyle(fontSize: labelFontSize, color: Colors.black),
        ),
        const SizedBox(height: 6),
        TextField(
          controller: controller,
          maxLines: maxLines,
          decoration: InputDecoration(
            hintText: hintKey?.tr(),
            hintStyle: const TextStyle(
              color: Color.fromARGB(255, 195, 194, 194),
            ),
            border: const UnderlineInputBorder(),
            isDense: true,
          ),
          style: TextStyle(fontSize: inputFontSize),
          keyboardType: maxLines > 1
              ? TextInputType.multiline
              : TextInputType.text,
          textInputAction: maxLines > 1
              ? TextInputAction.newline
              : TextInputAction.done,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    context.watch<LanguageController>();
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    final headerFontSize = screenWidth < 1440 ? 40.0 : 70.0;
    final descriptionFontSize = calculateFontSize(screenWidth, 18, 30);
    final titleFontSize = calculateFontSize(screenWidth, 50, 52);
    final buttonFontSize = calculateFontSize(screenWidth, 22, 27);
    final answerFontSize = calculateFontSize(screenWidth, 16, 22);
    final iconSize = answerFontSize * 1.2;

    final hPadding = calculateHorizontalMargin(screenWidth, min: 20, max: 70);
    final vSpacing = calculateVerticalSpacing(screenHeight, min: 10, max: 24);

    final double minImageSize = 200;
    final double maxImageSize = 500;
    final double imageSize = (screenWidth * 0.3).clamp(
      minImageSize,
      maxImageSize,
    );

    final bool isSmallScreen = screenWidth < 800;

    return Container(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 250,
              width: double.infinity,
              color: Colors.grey[200],
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: TranslatedText(
                    'COMPANY INFORMATION',
                    style: TextStyle(
                      fontSize: headerFontSize,
                      fontWeight: FontWeight.w500,
                      color: const Color.fromARGB(255, 47, 65, 100),
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
            ),
            SizedBox(height: vSpacing * 2.5),
            ColoredBox(color: Colors.white),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: hPadding,
                vertical: vSpacing * 1.5,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TranslatedText(
                    'Let\'s Start a Conversation',
                    style: TextStyle(
                      fontSize: titleFontSize,
                      fontWeight: FontWeight.w500,
                      color: const Color.fromARGB(255, 47, 65, 100),
                    ),
                  ),
                  SizedBox(height: vSpacing * 3),
                  TranslatedText(
                    'Every build is a partnership. That’s why we work best with clients who value clarity, collaboration, and mutual respect. When the alignment is right, the results speak for themselves.\nBy choosing to work with Homlistic, you acknowledge our commitment to quality and the belief that how we work together matters just as much as what we build.',
                    style: TextStyle(
                      height: 1.5,
                      fontSize: descriptionFontSize,
                      color: const Color.fromARGB(255, 120, 115, 115),
                    ),
                  ),
                  SizedBox(height: vSpacing * 2.5),
                  if (isSmallScreen) ...[
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: hPadding,
                        vertical: vSpacing * 0.5,
                      ),
                      color: const Color(0xFF2F4164),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: imageSize,
                            child: Image.asset(
                              'assets/whiteLogo.png',
                              fit: BoxFit.contain,
                            ),
                          ),
                          SizedBox(height: vSpacing),
                          contactRow(
                            Icons.phone,
                            '646 - 458 - 0010',
                            iconSize: iconSize,
                            fontSize: answerFontSize,
                          ),
                          SizedBox(height: vSpacing),
                          contactRow(
                            Icons.location_on,
                            '240 Meserole Street, 2nd Floor\nBrooklyn, New York 11206',
                            fontSize: answerFontSize,
                            iconSize: iconSize,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: vSpacing * 2),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: hPadding,
                        vertical: vSpacing,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          buildTextField(
                            'First Name',
                            hintKey: 'John',
                            screenWidth: screenWidth,
                            controller: firstNameController,
                          ),
                          SizedBox(height: vSpacing),
                          buildTextField(
                            'Last Name',
                            hintKey: 'Doe',
                            screenWidth: screenWidth,
                            controller: lastNameController,
                          ),
                          SizedBox(height: vSpacing * 2),
                          buildTextField(
                            'Email',
                            hintKey: 'you@example.com',
                            screenWidth: screenWidth,
                            controller: emailController,
                          ),
                          SizedBox(height: vSpacing * 2),
                          buildTextField(
                            'Phone Number',
                            hintKey: '+1 012 3456 789',
                            screenWidth: screenWidth,
                            controller: phoneController,
                          ),
                          SizedBox(height: vSpacing * 2),
                          buildTextField(
                            'Project Type',
                            hintKey: 'Residential',
                            screenWidth: screenWidth,
                            controller: projectTypeController,
                          ),
                          SizedBox(height: vSpacing * 2),
                          buildTextField(
                            'Describe Your Job',
                            hintKey: 'Write your message...',
                            screenWidth: screenWidth,
                            maxLines: 3,
                            controller: messageController,
                          ),
                          SizedBox(height: vSpacing * 2.5),
                          Align(
                            alignment: Alignment.centerRight,
                            child: ElevatedButton(
                              onPressed: isLoading ? null : sendEmail,
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                backgroundColor: const Color(0xFF2F4164),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 24,
                                  vertical: 16,
                                ),
                              ),
                              child: isLoading
                                  ? const SizedBox(
                                      width: 24,
                                      height: 24,
                                      child: CircularProgressIndicator(
                                        color: Colors.white,
                                        strokeWidth: 2,
                                      ),
                                    )
                                  : TranslatedText(
                                      'Send',
                                      style: TextStyle(
                                        fontSize: buttonFontSize,
                                        color: Colors.white,
                                      ),
                                    ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ] else ...[
                    IntrinsicHeight(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Container(
                              color: const Color(0xFF2F4164),
                              padding: EdgeInsets.symmetric(
                                horizontal: hPadding,
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: imageSize,
                                    child: Image.asset(
                                      'assets/whiteLogo.png',
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                  SizedBox(height: vSpacing),
                                  contactRow(
                                    Icons.phone,
                                    '646 - 458 - 0010',
                                    iconSize: iconSize,
                                    fontSize: answerFontSize,
                                  ),
                                  SizedBox(height: vSpacing),
                                  contactRow(
                                    Icons.location_on,
                                    '240 Meserole Street, 2nd Floor\nBrooklyn, New York 11206',
                                    iconSize: iconSize,
                                    fontSize: answerFontSize,
                                  ),
                                ],
                              ),
                            ),
                          ),

                          Expanded(
                            flex: 2,
                            child: SingleChildScrollView(
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: hPadding,
                                  vertical: 0,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Expanded(
                                          child: buildTextField(
                                            'First Name',
                                            hintKey: 'John',
                                            controller: firstNameController,
                                            screenWidth: screenWidth,
                                          ),
                                        ),
                                        SizedBox(width: 20),
                                        Expanded(
                                          child: buildTextField(
                                            'Last Name',
                                            hintKey: 'Doe',
                                            controller: lastNameController,
                                            screenWidth: screenWidth,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: vSpacing * 2),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: buildTextField(
                                            'Email',
                                            hintKey: 'you@example.com',
                                            controller: emailController,
                                            screenWidth: screenWidth,
                                          ),
                                        ),
                                        SizedBox(width: 20),
                                        Expanded(
                                          child: buildTextField(
                                            'Phone Number',
                                            hintKey: '+1 012 3456 789',
                                            controller: phoneController,
                                            screenWidth: screenWidth,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: vSpacing * 2),
                                    buildTextField(
                                      'Project Type',
                                      hintKey: 'Residential',
                                      controller: projectTypeController,
                                      screenWidth: screenWidth,
                                    ),
                                    SizedBox(height: vSpacing * 2),
                                    buildTextField(
                                      'Describe Your Job',
                                      hintKey: 'Write your message...',
                                      controller: messageController,
                                      screenWidth: screenWidth,
                                      maxLines: 3,
                                    ),
                                    SizedBox(height: vSpacing * 2.5),
                                    Align(
                                      alignment: Alignment.centerRight,
                                      child: ElevatedButton(
                                        onPressed: isLoading ? null : sendEmail,
                                        style: ElevatedButton.styleFrom(
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                              20,
                                            ),
                                          ),
                                          backgroundColor: const Color(
                                            0xFF2F4164,
                                          ),
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 24,
                                            vertical: 16,
                                          ),
                                        ),
                                        child: isLoading
                                            ? const SizedBox(
                                                width: 24,
                                                height: 24,
                                                child:
                                                    CircularProgressIndicator(
                                                      color: Colors.white,
                                                      strokeWidth: 2,
                                                    ),
                                              )
                                            : TranslatedText(
                                                'Send',
                                                style: TextStyle(
                                                  fontSize: buttonFontSize,
                                                  color: Colors.white,
                                                ),
                                              ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ],
              ),
            ),
            SizedBox(height: vSpacing * 2),
            LayoutBuilder(
              builder: (context, constraints) {
                final imageHeight = (screenHeight * 0.25).clamp(100, 300);
                return SizedBox(
                  width: double.infinity,
                  height: imageHeight.toDouble(),
                  child: Image.asset('assets/bottom.png', fit: BoxFit.cover),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
