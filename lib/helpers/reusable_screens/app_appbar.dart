import 'package:flutter/material.dart';
import 'package:service_man/helpers/assets/colors.dart';
import 'package:service_man/helpers/utils/app_utils.dart';

typedef VoidCallback = void Function();

class AppAppBar extends StatelessWidget {

  final VoidCallback voidCallback;
  final String titleText;

  const AppAppBar({Key key, this.voidCallback, this.titleText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: InkWell(
          onTap: voidCallback,
          child: Icon(Icons.arrow_back, color: bBlack)
      ),
      centerTitle: true,
      backgroundColor: bMilk,
      elevation: 0.0,
      title: Text(
        '$titleText',
        style: AppUtils.adaptableTextStyle(size: 14.0, fontWeight: FontWeight.bold, color: bBlack),
      ),
    );
  }
}
