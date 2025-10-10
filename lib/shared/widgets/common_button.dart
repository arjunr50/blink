import 'package:blink/shared/widgets/text_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';

class CommonButton extends StatelessWidget {
  const CommonButton({
    super.key,
    required this.text,
    required this.onTap,
    this.left = 0,
    this.right = 0,
    this.top = 0,
    this.bottom = 0,
    this.fontWeight = FontWeight.bold,
    this.fontSize = 18,
    this.margin = EdgeInsets.zero,
    this.height = 50,
    this.textColor,
    this.icon,
    this.borderColor,
    this.backgroundColor,
    this.loader,
    this.borderRadius = 30,
    this.padding = EdgeInsets.zero,
  });

  final String text;
  final double left;
  final double right;
  final double top;
  final double bottom;
  final FontWeight? fontWeight;
  final double? fontSize;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final double height;
  final Color? textColor;
  final String? icon;
  final String? loader;
  final Color? borderColor;
  final Color? backgroundColor;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Container(
        margin: margin,
        height: height,
        padding: padding,
        decoration: BoxDecoration(
          color:
              backgroundColor ??
              Theme.of(context).colorScheme.primary.withValues(alpha: 0.8),
          borderRadius: BorderRadius.circular(borderRadius),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.4),
              blurRadius: 3,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        clipBehavior: Clip.antiAlias,
        child: Material(
          type: MaterialType.transparency,
          child: InkWell(
            borderRadius: BorderRadius.circular(borderRadius),
            splashColor: Colors.white.withValues(alpha: 0.2),
            highlightColor: Colors.transparent,
            onTap: null,
            child: Padding(
              padding: EdgeInsets.fromLTRB(left, top, right, bottom),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (icon != null)
                    Padding(
                      padding: EdgeInsets.only(right: text.isNotEmpty ? 8 : 0),
                      child: SvgPicture.asset(
                        icon!,
                        height: 24,
                        width: 24,
                        colorFilter: textColor != null
                            ? ColorFilter.mode(textColor!, BlendMode.srcIn)
                            : null,
                      ),
                    ),
                  if (loader != null)
                    Padding(
                      padding: EdgeInsets.only(right: text.isNotEmpty ? 8 : 0),
                      child: Lottie.asset(loader!, repeat: true),
                    ),
                  TextView(
                    text: text,
                    fontSize: fontSize,
                    color: textColor ?? Colors.black,
                    fontWeight: fontWeight,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
