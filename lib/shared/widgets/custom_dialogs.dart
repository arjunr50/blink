import 'package:blink/core/utils/images_helper.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lottie/lottie.dart';

class CustomDialogs {
  static bool _dialogOpen = false;
  static bool _isShowing = false;

  static void showLoadingDialog(BuildContext context) {
    if (_dialogOpen) return;

    _dialogOpen = true;

    showDialog(
      context: context,
      barrierDismissible: false,
      barrierColor: Colors.black.withValues(alpha: 0.5),
      builder: (context) {
        return PopScope(
          canPop: false,
          child: Dialog(
            backgroundColor: Colors.transparent,
            elevation: 0,
            child: Center(
              child: Lottie.asset(
                kProgress,
                width: 135,
                height: 135,
                repeat: true,
                renderCache: RenderCache.drawingCommands,
              ),
            ),
          ),
        );
      },
    ).then((_) {
      _dialogOpen = false;
    });
  }

  static void popDialog(BuildContext context, {Function? onPopped}) {
    if (_dialogOpen) {
      _dialogOpen = false;

      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (Navigator.of(context, rootNavigator: true).canPop()) {
          Navigator.of(context, rootNavigator: true).pop();
        }

        if (onPopped != null) {
          onPopped();
        }
      });
    } else {
      if (onPopped != null) {
        onPopped();
      }
    }
  }

  static void showSuccessDialog({
    required BuildContext context,
    required String text,
    String? message,
  }) {
    if (_isShowing) Fluttertoast.cancel();
    _isShowing = true;
    Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.SNACKBAR,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.green,
      textColor: Colors.white,
      fontSize: 16.0,
    ).then((_) => _isShowing = false);
  }

  static void showErrorDialog({required String text, String? message}) {
    if (_isShowing) return;
    _isShowing = true;
    Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0,
    ).then((_) => _isShowing = false);
  }
}
