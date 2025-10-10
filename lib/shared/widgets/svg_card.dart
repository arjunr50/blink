import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SvgCard extends StatelessWidget {
  const SvgCard({
    super.key,
    required this.asset,
    this.height = 35,
    this.width = 35,
    this.borderRadius = 10,
    this.backgroundColor,
    this.margin,
    this.onTap,
  });

  final String asset;
  final double height;
  final double width;
  final double borderRadius;
  final Color? backgroundColor;
  final EdgeInsetsGeometry? margin;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: margin ?? EdgeInsets.only(left: 15),
        height: height,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
          color: backgroundColor ?? Colors.grey.shade200,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.4),
              blurRadius: 3,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: SvgPicture.asset(
          asset,
          fit: BoxFit.scaleDown,
          colorFilter: ColorFilter.mode(Colors.blue, BlendMode.srcIn),
        ),
      ),
    );
  }
}
