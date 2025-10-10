import 'package:blink/core/utils/images_helper.dart';
import 'package:blink/shared/widgets/text_view.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class NoDataWidget extends StatelessWidget {
  const NoDataWidget({super.key, this.text = 'No Data Available'});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        spacing: 16,
        children: [
          Lottie.asset(kNoData, fit: BoxFit.contain,
            width: 280, height: 280,
            repeat: true,
            renderCache: RenderCache.drawingCommands,
          ),
          TextView(text: text, fontSize: 18,
          fontWeight: FontWeight.bold,),
        ],
      ),
    );
  }
}
