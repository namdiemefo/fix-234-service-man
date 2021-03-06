import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:service_man/helpers/assets/colors.dart';
import 'package:service_man/helpers/assets/strings.dart';

class AppUtils {

  static TextStyle adaptableTextStyle(
      {double size, FontWeight fontWeight, Color color}) {
    return TextStyle(
        fontFamily: AppStrings.fontFamily,
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
          SizedBox(width: 5.0),
          Expanded(
            child: Text(
              message,
              style: adaptableTextStyle(size: 10.0, color: bWhite, fontWeight: FontWeight.normal),
              // style: BloommAssets.adaptableTextStyle(
              //     size: 12, fontWeight: FontWeight.w400, color: bWhite),
            ),
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
          SizedBox(width: 5.0),
          Expanded(
            child: Text(
              error,
              style: adaptableTextStyle(size: 10.0, color: bWhite, fontWeight: FontWeight.normal),
            ),
          ),
        ],
      ),
      duration: Duration(seconds: 5),
      flushbarPosition: FlushbarPosition.TOP,
      backgroundColor: bRedCard,
    ).show(context);
  }

  static Color hexToColor(String code) {
    return new Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
  }

  static String convertDate(String date) {
    DateTime dateTime = DateTime.parse(date);
    var format = DateFormat('dd MMMM, yyyy');
    return '${format.format(dateTime)}';
  }


}