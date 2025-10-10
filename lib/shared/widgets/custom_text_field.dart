import 'package:blink/core/utils/images_helper.dart';
import 'package:blink/shared/widgets/text_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    this.title,
    this.hintText = "",
    required this.controller,
    this.left = 0,
    this.top = 0,
    this.right = 0,
    this.bottom = 0,
    this.inputFormatters,
    this.prefixIcon,
    this.suffixIcon,
    this.validator,
    this.labelText,
    this.enabled = true,
  });

  final String? title;
  final String hintText;
  final TextEditingController controller;
  final double left;
  final double top;
  final double right;
  final double bottom;
  final List<TextInputFormatter>? inputFormatters;
  final String? prefixIcon;
  final String? suffixIcon;
  final FormFieldValidator<String>? validator;
  final String? labelText;
  final bool enabled;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: widget.left,
        top: widget.top,
        right: widget.right,
        bottom: widget.bottom,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          widget.title != null
              ? TextView(
                  text: widget.title != null ? widget.title! : "",
                  fontSize: 16,
                  top: 10,
                  bottom: 5,
                  fontWeight: FontWeight.bold,
                )
              : SizedBox.shrink(),
          TextFormField(
            enabled: widget.enabled,
            errorBuilder: (context, errorText) => Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SvgPicture.asset(
                  kWarning,
                  width: 16,
                  height: 16,
                  colorFilter: ColorFilter.mode(Colors.red, BlendMode.srcIn),
                ),
                Expanded(
                  child: TextView(
                    text: errorText,
                    color: Colors.red,
                    fontSize: 13,
                    left: 5,
                    maxLines: 2,
                  ),
                ),
              ],
            ),
            validator: widget.validator,
            controller: widget.controller,
            decoration: InputDecoration(
              prefixIcon: widget.prefixIcon != null
                  ? Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: SvgPicture.asset(
                        widget.prefixIcon ?? "",
                        width: 24,
                        height: 24,

                      ),
                    )
                  : null,
              suffixIcon: widget.suffixIcon != null
                  ? Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: SvgPicture.asset(widget.suffixIcon ?? ""),
                    )
                  : null,
              labelText: widget.labelText,
              hintText: widget.hintText,
              hintStyle: TextStyle(color: Colors.grey[400]),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(color: Colors.grey[400]!),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(color: Colors.grey[400]!),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(color: Colors.blue, width: 1),
              ),
            ),
            inputFormatters:
                widget.inputFormatters ??
                [LengthLimitingTextInputFormatter(15)],
          ),
        ],
      ),
    );
  }
}
