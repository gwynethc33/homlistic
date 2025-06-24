import 'package:flutter/material.dart';

class FadeInText extends StatefulWidget {
  final String text;
  final double fontSize;
  final TextAlign textAlign;
  final Color color;

  const FadeInText({
    super.key,
    required this.text,
    required this.fontSize,
    this.textAlign = TextAlign.center,
    this.color = Colors.black,
  });

  @override
  State<FadeInText> createState() => _FadeInState();
}

class _FadeInState extends State<FadeInText>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );

    _animation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _animation,
      child: Text(
        widget.text,
        textAlign: widget.textAlign,
        style: TextStyle(fontSize: widget.fontSize, color: widget.color),
      ),
    );
  }
}
