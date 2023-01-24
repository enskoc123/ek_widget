import 'dart:math';

import 'package:flutter/material.dart';
import 'package:progress_state_button/iconed_button.dart';
import 'package:progress_state_button/progress_button.dart';
///
class ProgressButtonWg extends StatefulWidget {
  @override
  _ProgressButtonWgState createState() => _ProgressButtonWgState();
/// butona tıklanmadan önceki sabit text
  String? mainText;
  /// butona tıklandıktan sonra false sonucunda yazılan text
  String? failedText;
  /// butona tıklandıktan sonra true sonucunda yazılan text
  String? successText;
  /// butonun tıklanmadan önceki rengi
  Color? buttonMainColor;
  /// butonun FALSE sonucunda ki rengi
  Color? buttonFailedColor;
   /// butonun TRUE sonucundaki rengi
  Color? buttonSuccesColor;
  /// butonun yüklenme esnasındaki rengi
  Color? buttonLoadingColor;
  ///icon rengi
  Color? iconColor;
   /// bekleme halinde ki icon
  IconData? presentIcon;
  /// false sonucunda görüntüleneck buton
  IconData? falseIcon;
  ///true sonucunda görüntülenecek olan buton
  IconData? trueIcon;
  ///
  bool durum;
  var onPressed;

  ProgressButtonWg({
    this.mainText,
    this.failedText,
    this.successText,
    this.buttonMainColor,
    this.buttonFailedColor,
    this.buttonSuccesColor,
    this.buttonLoadingColor,
    this.presentIcon,
    this.falseIcon,
    this.onPressed,
    this.trueIcon,
    this.iconColor,
    required this.durum
  });
}

class _ProgressButtonWgState extends State<ProgressButtonWg> {
  ButtonState stateOnlyText = ButtonState.idle;
  ButtonState stateTextWithIcon = ButtonState.idle;

  @override
  Widget build(BuildContext context) {
    return ProgressButton.icon(iconedButtons: {
      ButtonState.idle: IconedButton(
          text: widget.mainText ?? 'Send',
          icon:  Icon(widget.presentIcon ?? Icons.send, color:widget.iconColor ?? Colors.white),
          color: widget.buttonMainColor ?? Colors.deepPurple.shade500),
      ButtonState.loading: IconedButton(
          text: 'Loading',
          color: widget.buttonLoadingColor ?? Colors.deepPurple.shade700),
      ButtonState.fail: IconedButton(
          text: widget.failedText ?? 'Failed',
          icon:  Icon(widget.falseIcon ?? Icons.cancel, color:widget.iconColor ?? Colors.white),
          color: widget.buttonFailedColor ?? Colors.red.shade300),
      ButtonState.success: IconedButton(
          text: widget.successText ?? 'Success',
          icon:  Icon(
            widget.presentIcon ?? Icons.check_circle,
            color:widget.iconColor ?? Colors.white,
          ),
          color: widget.buttonSuccesColor ?? Colors.green.shade400)
    }, onPressed:widget.onPressed ?? onPressedIconWithText, state: stateTextWithIcon);
  }

  void onPressedIconWithText() {
    switch (stateTextWithIcon) {
      case ButtonState.idle:
        stateTextWithIcon = ButtonState.loading;
        Future.delayed(
          const Duration(seconds: 1),
          () {
            setState(
              () {
                widget.durum
                    ? ButtonState.success
                    : ButtonState.fail;
              },
            );
          },
        );

        break;
      case ButtonState.loading:
        break;
      case ButtonState.success:
        stateTextWithIcon = ButtonState.idle;
        break;
      case ButtonState.fail:
        stateTextWithIcon = ButtonState.idle;
        break;
    }
    setState(
      () {
        stateTextWithIcon = stateTextWithIcon;
      },
    );
  }
}
