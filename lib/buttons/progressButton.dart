import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:progress_state_button/iconed_button.dart';
import 'package:progress_state_button/progress_button.dart';

class ProgressButtonWg extends StatefulWidget {
  @override
  _ProgressButtonWgState createState() => _ProgressButtonWgState();

  String? mainText;
  String? failedText;
  String? successText;
  Color? buttonMainColor;
  Color? buttonFailedColor;
  Color? buttonSuccesColor;
  Color? buttonLoadingColor;
  Color? iconColor;
  IconData? sendIcon;
  IconData? failedIcon;
  IconData? succesIcon;
  var onPressed;

  ProgressButtonWg({
    this.mainText,
    this.failedText,
    this.successText,
    this.buttonMainColor,
    this.buttonFailedColor,
    this.buttonSuccesColor,
    this.buttonLoadingColor,
    this.sendIcon,
    this.failedIcon,
    this.onPressed,
    this.succesIcon,
    this.iconColor
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
          icon:  Icon(widget.sendIcon ?? Icons.send, color:widget.iconColor ?? Colors.white),
          color: widget.buttonMainColor ?? Colors.deepPurple.shade500),
      ButtonState.loading: IconedButton(
          text: 'Loading',
          color: widget.buttonLoadingColor ?? Colors.deepPurple.shade700),
      ButtonState.fail: IconedButton(
          text: widget.failedText ?? 'Failed',
          icon:  Icon(widget.failedIcon ?? Icons.cancel, color:widget.iconColor ?? Colors.white),
          color: widget.buttonFailedColor ?? Colors.red.shade300),
      ButtonState.success: IconedButton(
          text: widget.successText ?? 'Success',
          icon:  Icon(
            widget.sendIcon ?? Icons.check_circle,
            color:widget.iconColor ?? Colors.white,
          ),
          color: widget.buttonSuccesColor ?? Colors.green.shade400)
    }, onPressed: onPressedIconWithText, state: stateTextWithIcon);
  }

  void onPressedIconWithText() {
    switch (stateTextWithIcon) {
      case ButtonState.idle:
        stateTextWithIcon = ButtonState.loading;
        Future.delayed(
          Duration(seconds: 1),
          () {
            setState(
              () {
                stateTextWithIcon = Random.secure().nextBool()
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
