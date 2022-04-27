import 'package:flutter/material.dart';
import 'package:service_man/helpers/assets/colors.dart';

typedef VoidCallback = void Function();

class AppButton extends StatelessWidget {

  final String buttonText;
  final VoidCallback voidCallback;
  final bool enabled;
  final Color enabledColor;
  final Color textColor;
  final num width;
  final num height;

  const AppButton(
      {Key key,
        this.width,
        this.height,
        this.buttonText,
        this.voidCallback,
        this.enabled,
        this.enabledColor,
        this.textColor
        })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
        minWidth: width != null ? width : 200.0,
        height: height != null ? height : 50.0,
        child: RaisedButton(
            padding: EdgeInsets.symmetric(vertical: 16, horizontal: 28),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14.0),
              // side: BorderSide(
              //   color: enabled ? enabledColor : disabledColor,
              // ),
            ),
            color: enabledColor,
            child: Text(
              buttonText,
              style: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.w600,
                color: textColor == null ? bWhite : textColor,
                // letterSpacing: 0.88,
              ).apply(fontWeightDelta: 1),
            ),
            onPressed: enabled ? voidCallback : null
        )
    );
  }
}
