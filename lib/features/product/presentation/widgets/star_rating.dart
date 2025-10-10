import 'package:blink/shared/widgets/text_view.dart';
import 'package:flutter/material.dart';

class StarRating extends StatelessWidget {
  final double rating;

  const StarRating({
    super.key,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 6, vertical: 1),
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        spacing: 3,
        children: [
          TextView(
            text: rating.toStringAsFixed(1),
            fontSize: 13,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          Icon(Icons.star, size: 13, color: Colors.white),
        ],
      ),
    );
  }
}
