import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class TranslatedText extends StatelessWidget {
  final String keyName;
  final TextStyle? style;
  final bool? softWrap;
  final TextOverflow? overflow;
  final TextAlign? textAlign;

  const TranslatedText(
    this.keyName, {
    this.style,
    this.softWrap,
    this.overflow,
    this.textAlign,
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Text(
      keyName.tr(),
      style: style,
      softWrap: softWrap,
      overflow: overflow,
    );
  }
}
