import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TextView extends StatelessWidget {
  const TextView({
    super.key,
    required this.text,
    this.left = 0,
    this.right = 0,
    this.top = 0,
    this.bottom = 0,
    this.fontWeight = FontWeight.w400,
    this.fontSize = 12,
    this.color = Colors.black,
    this.maxLines,
    this.showCurrency = false,
    this.currencyCode = 'INR',
    this.prefix,
    this.suffix,
    this.lineHeight = 1.5,
    this.textAlign = TextAlign.start,
  });

  final String text;
  final double left;
  final double right;
  final double top;
  final double bottom;
  final FontWeight? fontWeight;
  final double? fontSize;
  final Color? color;
  final int? maxLines;
  final bool? showCurrency;
  final String? currencyCode;
  final String? prefix;
  final String? suffix;
  final double? lineHeight;
  final TextAlign? textAlign;

  String _formatText() {
    if (showCurrency ?? false) {
      try {
        final number = double.tryParse(text) ?? 0.0;
        final formattedNumber = NumberFormat.currency(
          locale: 'en_In',
          symbol: '',
        ).format(number);
        final symbol = currencyCode != null
            ? NumberFormat.simpleCurrency(name: currencyCode!).currencySymbol
            : '';
        return "$symbol $formattedNumber";
      } catch (e) {
        return text;
      }
    }
    return text;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: top,
        left: left,
        bottom: bottom,
        right: right,
      ),
      child: Text(
        prefix != null || suffix != null
            ? '${prefix ?? ''}${_formatText()}${suffix ?? ''}'
            : _formatText(),        overflow: TextOverflow.ellipsis,
        maxLines: maxLines,
        textAlign: textAlign,
        style: TextStyle(
          color: color,
          fontSize: fontSize,
          fontWeight: fontWeight,
          height: lineHeight,
        ),
      ),
    );
  }
}
