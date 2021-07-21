import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:service_man/helpers/assets/colors.dart';

class AppUtils {

  static TextStyle adaptableTextStyle(
      {double size, FontWeight fontWeight, Color color}) {
    return TextStyle(
        // fontFamily: BloommAssets.sf_ui,
        fontWeight: fontWeight,
        fontStyle: FontStyle.normal,
        fontSize: size,
        color: color);
  }

  static SizedBox horizontalSpacing({double width}) {
    return SizedBox(
      width: width,
    );
  }

  static SizedBox verticalSpacing({double height}) {
    return SizedBox(
      height: height,
    );
  }

  static void hideKeyboard(BuildContext context) {
    SystemChannels.textInput.invokeMethod('TextInput.hide');
    FocusScope.of(context).requestFocus(FocusNode());
  }

  static double screenAwareSize(double size, BuildContext context) {
    double baseHeight = 812.0;
    return size * MediaQuery.of(context).size.height / baseHeight;
  }

  static dynamic showSuccessFlushBar(BuildContext context, String message) {
    return Flushbar(
      shouldIconPulse: false,
      messageText: Row(
        children: [
          // SvgPicture.asset(smile_svg, color: bWhite),
          SizedBox(width: 20.0),
          Text(
            message,
            // style: BloommAssets.adaptableTextStyle(
            //     size: 12, fontWeight: FontWeight.w400, color: bWhite),
          ),
        ],
      ),
      duration: Duration(seconds: 5),
      flushbarPosition: FlushbarPosition.TOP,
      backgroundColor: bCheckedColor,
    ).show(context);
  }

  static dynamic showErrorFlushBar(BuildContext context, String error) {
    return Flushbar(
      shouldIconPulse: false,
      messageText: Row(
        children: [
          // SvgPicture.asset(sad_svg),
          SizedBox(width: 20.0),
          Text(
            error,
            // style: BloommAssets.adaptableTextStyle(
            //     size: 12, fontWeight: FontWeight.w400, color: bBadge),
          ),
        ],
      ),
      duration: Duration(seconds: 5),
      flushbarPosition: FlushbarPosition.TOP,
      backgroundColor: bRedCard,
    ).show(context);
  }

}