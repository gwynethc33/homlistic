import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactContent extends StatefulWidget {
  const ContactContent({super.key});

  @override
  State<ContactContent> createState() => _ContactContentState();
}

class _ContactContentState extends State<ContactContent> {
  //controllers
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
      //clear
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

    // Boost font size
    if (screenWidth > 1920) {
      final extraScale = ((screenWidth - 1920) / (maxWidth - 1920)).clamp(0, 1);
      final extraBoost = (maxFont * 0.3) * extraScale;
      return baseSize + extraBoost;
    }

    return baseSize;
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
    //CONTACTROW LEFT PANEL
    Widget contactRow(
      IconData icon,
      String text, {
      double fontSize = 16,
      double iconSize = 24,
    }) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: Colors.white, size: iconSize),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: TextStyle(color: Colors.white, fontSize: fontSize),
            ),
          ),
        ],
      );
    }

    //TEXT FIELD RIGHT PANEL
    Widget buildTextField(
      String label, {
      String? hintText,
      required double screenWidth,
      int maxLines = 1,
      required TextEditingController controller,
    }) {
      final labelFontSize = calculateFontSize(screenWidth, 16, 20);
      final inputFontSize = calculateFontSize(screenWidth, 22, 27);

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(fontSize: labelFontSize, color: Colors.black),
          ),
          const SizedBox(height: 6),
          TextField(
            controller: controller,
            maxLines: maxLines,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: const TextStyle(
                color: Color.fromARGB(255, 195, 194, 194),
              ),
              border: const UnderlineInputBorder(),
              isDense: true,
            ),
            style: TextStyle(fontSize: inputFontSize),
          ),
        ],
      );
    }

    //ADJUSTABLE THROUGHOUT SCREENS
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    double headerFontSize;
    if (screenWidth < 1440) {
      headerFontSize = 40.0;
    } else {
      headerFontSize = 70.0;
    }

    final descriptionFontSize = calculateFontSize(screenWidth, 18, 30);
    final titleFontSize = calculateFontSize(screenWidth, 50, 52);
    final buttonFontSize = calculateFontSize(screenWidth, 22, 27);
    final answerFontSize = calculateFontSize(screenWidth, 16, 22);
    final iconSize = answerFontSize * 1.2;

    final hPadding = calculateHorizontalMargin(screenWidth, min: 20, max: 70);
    final vSpacing = calculateVerticalSpacing(screenHeight);

    final bool isSmallScreen = screenWidth < 800;

    return Container(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // header
            Container(
              height: 250,
              width: double.infinity,
              color: Colors.grey[200],
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 40.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'COMPANY INFORMATION',
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
            const SizedBox(height: 60),
            ColoredBox(color: Colors.white),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: hPadding,
                vertical: vSpacing * 1.5,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Let\'s Start a Conversation',
                    style: TextStyle(
                      fontSize: titleFontSize,
                      fontWeight: FontWeight.w500,
                      color: Color.fromARGB(255, 47, 65, 100),
                    ),
                  ),
                  const SizedBox(height: 65),
                  Text(
                    'Every build is a partnership. That’s why we work best with clients who value clarity, collaboration, and mutual respect. When the alignment is right, the results speak for themselves.\nBy choosing to work with Homlistic, you acknowledge our commitment to quality and the belief that how we work together matters just as much as what we build.',
                    style: TextStyle(
                      height: 1.5,
                      fontSize: descriptionFontSize,
                      color: const Color.fromARGB(255, 120, 115, 115),
                    ),
                  ),
                  const SizedBox(height: 60),

                  isSmallScreen
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: hPadding,
                                vertical: vSpacing,
                              ),
                              color: const Color(0xFF2F4164),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  FittedBox(
                                    fit: BoxFit.scaleDown,
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      'Company Information',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: titleFontSize,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 50),
                                  contactRow(
                                    Icons.phone,
                                    '646 - 458 - 0010',
                                    iconSize: iconSize,
                                    fontSize: answerFontSize,
                                  ),
                                  const SizedBox(height: 30),
                                  contactRow(
                                    Icons.email,
                                    'inquiry@homlistic.com',
                                    fontSize: answerFontSize,
                                    iconSize: iconSize,
                                  ),
                                  const SizedBox(height: 30),
                                  contactRow(
                                    Icons.location_on,
                                    '240 Meserole Street, 2nd Floor\nBrooklyn, New York 11206',
                                    fontSize: answerFontSize,
                                    iconSize: iconSize,
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 40),
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: hPadding,
                                vertical: vSpacing,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  buildTextField(
                                    'First Name',
                                    hintText: 'John',
                                    screenWidth: screenWidth,
                                    controller: firstNameController,
                                    maxLines: 1,
                                  ),
                                  const SizedBox(height: 20),
                                  buildTextField(
                                    'Last Name',
                                    hintText: 'Doe',
                                    controller: lastNameController,
                                    screenWidth: screenWidth,
                                    maxLines: 1,
                                  ),
                                  const SizedBox(height: 40),
                                  buildTextField(
                                    'Email',
                                    hintText: 'you@example.com',
                                    controller: emailController,
                                    screenWidth: screenWidth,
                                    maxLines: 1,
                                  ),
                                  const SizedBox(height: 40),
                                  buildTextField(
                                    'Phone Number',
                                    hintText: '+1 012 3456 789',
                                    controller: phoneController,
                                    screenWidth: screenWidth,
                                  ),
                                  const SizedBox(height: 40),
                                  buildTextField(
                                    'Project Type',
                                    hintText: 'Residential',
                                    controller: projectTypeController,
                                    screenWidth: screenWidth,
                                  ),
                                  const SizedBox(height: 40),
                                  buildTextField(
                                    'Describe Your Job',
                                    hintText: 'Write your message...',
                                    controller: messageController,
                                    screenWidth: screenWidth,
                                    maxLines: 3,
                                  ),
                                  const SizedBox(height: 50),
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
                                              child: CircularProgressIndicator(
                                                color: Colors.white,
                                                strokeWidth: 2,
                                              ),
                                            )
                                          : Text(
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
                          ],
                        )
                      : IntrinsicHeight(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 1,
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: hPadding,
                                    vertical: vSpacing,
                                  ),
                                  color: const Color(0xFF2F4164),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      FittedBox(
                                        fit: BoxFit.scaleDown,
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          'Company Information',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: titleFontSize,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 50),
                                      contactRow(
                                        Icons.phone,
                                        '646 - 458 - 0010',
                                        iconSize: iconSize,
                                        fontSize: answerFontSize,
                                      ),
                                      const SizedBox(height: 30),
                                      contactRow(
                                        Icons.email,
                                        'inquiry@homlistic.com',
                                        fontSize: answerFontSize,
                                        iconSize: iconSize,
                                      ),
                                      const SizedBox(height: 30),
                                      contactRow(
                                        Icons.location_on,
                                        '240 Meserole Street, 2nd Floor\nBrooklyn, New York 11206',
                                        fontSize: answerFontSize,
                                        iconSize: iconSize,
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
                                      vertical: vSpacing,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Expanded(
                                              child: buildTextField(
                                                'First Name',
                                                hintText: 'John',
                                                controller: firstNameController,
                                                screenWidth: screenWidth,
                                              ),
                                            ),
                                            const SizedBox(width: 20),
                                            Expanded(
                                              child: buildTextField(
                                                'Last Name',
                                                hintText: 'Doe',
                                                controller: lastNameController,
                                                screenWidth: screenWidth,
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 40),
                                        Row(
                                          children: [
                                            Expanded(
                                              child: buildTextField(
                                                'Email',
                                                hintText: 'you@example.com',
                                                controller: emailController,
                                                screenWidth: screenWidth,
                                              ),
                                            ),
                                            const SizedBox(width: 20),
                                            Expanded(
                                              child: buildTextField(
                                                'Phone Number',
                                                hintText: '+1 012 3456 789',
                                                controller: phoneController,
                                                screenWidth: screenWidth,
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 40),
                                        buildTextField(
                                          'Project Type',
                                          hintText: 'Residential',
                                          controller: projectTypeController,
                                          screenWidth: screenWidth,
                                        ),
                                        const SizedBox(height: 40),
                                        buildTextField(
                                          'Describe Your Job',
                                          hintText: 'Write your message...',
                                          controller: messageController,
                                          screenWidth: screenWidth,
                                          maxLines: 3,
                                        ),
                                        const SizedBox(height: 50),
                                        Align(
                                          alignment: Alignment.centerRight,
                                          child: ElevatedButton(
                                            onPressed: isLoading
                                                ? null
                                                : sendEmail,
                                            style: ElevatedButton.styleFrom(
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                              ),
                                              backgroundColor: const Color(
                                                0xFF2F4164,
                                              ),
                                              padding:
                                                  const EdgeInsets.symmetric(
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
                                                : Text(
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
              ),
            ),
            const SizedBox(height: 40),
            const SizedBox(height: 40),
            LayoutBuilder(
              builder: (context, constraints) {
                final screenHeight = MediaQuery.of(context).size.height;

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
