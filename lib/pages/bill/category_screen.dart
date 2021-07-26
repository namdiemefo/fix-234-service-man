import 'package:flutter/material.dart';
import 'package:service_man/helpers/assets/colors.dart';
import 'package:service_man/helpers/assets/routes.dart';
import 'package:service_man/helpers/assets/strings.dart';
import 'package:service_man/helpers/utils/app_utils.dart';

class CategoryScreen extends StatefulWidget {
  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
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
          AppStrings.billCategory,
          style: AppUtils.adaptableTextStyle(size: 14.0, fontWeight: FontWeight.bold, color: bBlack),
        ),
      ),
      backgroundColor: bMilk,
      body: Padding(
        padding: EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, AppRoutes.toBillPartsScreen);
              },
              child: Row(
                children: [
                  Expanded(
                      child: Container(
                        height: AppUtils.screenAwareSize(75.0, context),
                        decoration: BoxDecoration(
                          color: bPurple,
                          borderRadius: BorderRadius.all(Radius.circular(5.0))
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                AppStrings.parts,
                                style: AppUtils.adaptableTextStyle(size: 20.0, fontWeight: FontWeight.normal, color: bWhite),
                              ),
                              Icon(Icons.arrow_forward, color: bWhite)
                            ],
                          ),
                        )
                      )
                  )
                ],
              ),
            ),

            AppUtils.verticalSpacing(height: AppUtils.screenAwareSize(20.0, context)),

            InkWell(
              onTap: () {
                Navigator.pushNamed(context, AppRoutes.toBillServiceScreen);
              },
              child: Row(
                children: [
                  Expanded(
                      child: Container(
                          height: AppUtils.screenAwareSize(75.0, context),
                          decoration: BoxDecoration(
                              color: bYellow,
                              borderRadius: BorderRadius.all(Radius.circular(5.0))
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  AppStrings.serviceCharge,
                                  style: AppUtils.adaptableTextStyle(size: 20.0, fontWeight: FontWeight.normal, color: bWhite),
                                ),
                                Icon(Icons.arrow_forward, color: bWhite)
                              ],
                            ),
                          )
                      )
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
