import 'package:blink/shared/widgets/common_button.dart';
import 'package:blink/shared/widgets/text_view.dart';
import 'package:flutter/material.dart';

class CustomAlertDialog extends StatelessWidget {
  final String title;
  final String content;
  final String cancelText;
  final String confirmText;
  final VoidCallback? onConfirm;
  final EdgeInsetsGeometry padding;

  const CustomAlertDialog({
    super.key,
    required this.title,
    required this.content,
    this.cancelText = 'Cancel',
    this.confirmText = 'Confirm',
    this.onConfirm,
    this.padding = const EdgeInsets.all(15),
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.6,
        padding: padding,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextView(
              text: title,
              fontSize: 20,
              fontWeight: FontWeight.bold,
              bottom: 10,
            ),

            TextView(
              text: content,
              fontSize: 16,
              color: Colors.black87,
              bottom: 20,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(
                  child: CommonButton(
                    backgroundColor: Colors.grey.shade300,
                    height: 45,
                    text: cancelText,
                    borderRadius: 15,
                    onTap: () => Navigator.of(context).pop(),
                    textColor: Theme.of(
                      context,
                    ).colorScheme.primary.withValues(alpha: 0.8),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: CommonButton(
                    height: 50,
                    borderRadius: 15,

                    text: confirmText,
                    onTap: () {
                      if (onConfirm != null) {
                        onConfirm!();
                      }
                    },
                    textColor: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
