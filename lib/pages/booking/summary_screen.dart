import 'package:flutter/material.dart';
import 'package:service_man/helpers/assets/colors.dart';
import 'package:service_man/helpers/assets/routes.dart';
import 'package:service_man/helpers/assets/strings.dart';
import 'package:service_man/helpers/reusable_screens/app_button.dart';
import 'package:service_man/helpers/utils/app_utils.dart';

class SummaryScreen extends StatefulWidget {
  @override
  _SummaryScreenState createState() => _SummaryScreenState();
}

class _SummaryScreenState extends State<SummaryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
            color: bDark
        ),
        centerTitle: true,
        backgroundColor: bMilk,
        elevation: 0.0,
        title: Text(
          AppStrings.summaryReport,
          style: AppUtils.adaptableTextStyle(size: 14.0, fontWeight: FontWeight.bold, color: bBlack),
        ),
      ),
      backgroundColor: bMilk,
      body: Padding(
        padding: EdgeInsets.all(24.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppUtils.hexToColor('#EEEBEA'),
                        borderRadius: BorderRadius.all(Radius.circular(10.0))
                      ),
                      height: AppUtils.screenAwareSize(200.0, context),
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: AppStrings.summaryTest,
                          border: InputBorder.none,
                          hintStyle: AppUtils.adaptableTextStyle(size: 13.0, fontWeight: FontWeight.normal, color: bGrey),
                          contentPadding: EdgeInsets.all(16.0)
                        ),
                        maxLines: null,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Spacer(),
            Row(
              children: [
                Expanded(
                    child: AppButton(
                      enabledColor: bPurple,
                      enabled: true,
                      textColor: bWhite,
                      buttonText: AppStrings.submit,
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
