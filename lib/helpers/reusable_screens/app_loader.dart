import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:service_man/helpers/assets/colors.dart';

class Load {
  static void show(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        useRootNavigator: false,
        builder: (BuildContext context) => Center(
          child: Container(
            width: 60.0,
            height: 60.0,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(4.0)),
            child: Center(
              child: SpinKitFadingCircle(color: bPurple),
            ),
          ),
        ));
  }

  static void dismiss(BuildContext context) {
    // Navigator.of(context, rootNavigator: true).pop();
    Navigator.pop(context, true);
  }

  // static hideLoader(BuildContext context) {
  //   // Navigator.of(context).pop();
  //   Navigator.pop(context, true);

  static Widget LoadingWidget({double width, double height, Color color}) {
    return Container(
      width: width,
      height: height,
      decoration:
      BoxDecoration(color: color, borderRadius: BorderRadius.circular(4.0)),
      child: Center(
        child: SpinKitFadingCircle(color: bPurple),
      ),
    );
  }

  static Widget onlySpinKitFadingCircle({double width, double height}) {
    return Center(
      child: SpinKitFadingCircle(color: bPurple),
    );
  }

}


