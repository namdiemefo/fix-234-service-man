import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:service_man/helpers/assets/colors.dart';
import 'package:service_man/helpers/assets/images.dart';
import 'package:service_man/helpers/assets/routes.dart';
import 'package:service_man/helpers/assets/strings.dart';
import 'package:service_man/helpers/reusable_screens/app_button.dart';
import 'package:service_man/helpers/utils/app_utils.dart';

class SuccessScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppUtils.hexToColor('#FEFBF3'),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            Padding(
                padding: const EdgeInsets.only(top: 150.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(Images.bill)
                  ],
                ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 50.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      AppStrings.success_bill_text,
                      textAlign: TextAlign.center,
                      style: AppUtils.adaptableTextStyle(size: 16.0, fontWeight: FontWeight.normal, color: AppUtils.hexToColor('#6D7278')),
                    ),
                  )
                ],
              ),
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                    child: AppButton(
                      enabled: true,
                      buttonText: AppStrings.home,
                      textColor: bWhite,
                      enabledColor: bPurple,
                      voidCallback: () {
                        Navigator.pushNamed(context, AppRoutes.toHomeScreen);
                      },
                    )
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
