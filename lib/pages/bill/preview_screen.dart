import 'package:flutter/material.dart';
import 'package:service_man/helpers/assets/colors.dart';
import 'package:service_man/helpers/assets/images.dart';
import 'package:service_man/helpers/assets/routes.dart';
import 'package:service_man/helpers/assets/strings.dart';
import 'package:service_man/helpers/reusable_screens/app_button.dart';
import 'package:service_man/helpers/reusable_screens/shadow_icon.dart';
import 'package:service_man/helpers/utils/app_utils.dart';

class PreviewScreen extends StatefulWidget {
  @override
  _PreviewScreenState createState() => _PreviewScreenState();
}

class _PreviewScreenState extends State<PreviewScreen> {
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
          AppStrings.previewBill,
          style: AppUtils.adaptableTextStyle(size: 14.0, fontWeight: FontWeight.bold, color: bBlack),
        ),
      ),
      backgroundColor: bMilk,
      body: Padding(
        padding: EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                color: bWhite,
                borderRadius: BorderRadius.all(Radius.circular(4.0)),
              ),
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [

                    // SERVICE
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 15.0, top: 25.0, bottom: 20.0),
                          child: AdaptableShadowIcon(
                            iconUrl: Images.gen,
                            boxShadow: AppUtils.hexToColor('#FEFBF3'),
                            radius: 15.0,
                            imageWidth: 15.0,
                            imageHeight: 15.0,
                          ),
                        ),
                        AppUtils.horizontalSpacing(width: 20.0),
                        Text(
                          'Generator Service',
                          style: AppUtils.adaptableTextStyle(size: 16.0, fontWeight: FontWeight.normal, color: AppUtils.hexToColor('#070A28')),
                        ),
                        AppUtils.verticalSpacing(height: 15.0),
                      ],
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                            child: Divider(
                              height: 4.0,
                              thickness: 0.5,
                              color: Colors.grey,
                            )
                        )
                      ],
                    ),

                    AppUtils.verticalSpacing(height: 15.0),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          AppStrings.serviceBill,
                          style: AppUtils.adaptableTextStyle(size: 16.0, fontWeight: FontWeight.normal, color: AppUtils.hexToColor('#070A28')),
                        ),
                        AppUtils.verticalSpacing(height: 15.0),
                      ],
                    ),

                    AppUtils.verticalSpacing(height: 10.0),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                            child: Divider(
                              height: 4.0,
                              thickness: 0.5,
                              color: Colors.grey,
                            )
                        )
                      ],
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            '40-60 KVA • Mikano Gen',
                            style: AppUtils.adaptableTextStyle(size: 16.0, fontWeight: FontWeight.normal, color: AppUtils.hexToColor('#070A28')),
                          ),
                          AppUtils.verticalSpacing(height: 15.0),
                          Divider(
                            height: 4.0,
                            thickness: 1.0,
                            color: bGrey,
                          )
                        ],
                      ),
                    ),

                    AppUtils.verticalSpacing(height: 5.0),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          AppStrings.parts,
                          style: AppUtils.adaptableTextStyle(size: 10.0, fontWeight: FontWeight.normal, color: AppUtils.hexToColor('#625A95')),
                        ),
                        AppUtils.verticalSpacing(height: 15.0),
                      ],
                    ),

                    ListView.builder(
                        itemCount: 4,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'General Servicing',
                                  style: AppUtils.adaptableTextStyle(size: 10.0, fontWeight: FontWeight.normal, color: AppUtils.hexToColor('#333333')),
                                ),
                                Text(
                                  'NGN 5,800',
                                  style: AppUtils.adaptableTextStyle(size: 10.0, fontWeight: FontWeight.normal, color: AppUtils.hexToColor('#333333')),
                                )
                              ],
                            ),
                          );
                        }
                    ),

                    AppUtils.verticalSpacing(height: 15.0),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          AppStrings.serviceCharge,
                          style: AppUtils.adaptableTextStyle(size: 10.0, fontWeight: FontWeight.normal, color: AppUtils.hexToColor('#FFB24D')),
                        ),
                        AppUtils.verticalSpacing(height: 15.0),
                      ],
                    ),

                    ListView.builder(
                        itemCount: 4,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'General Servicing',
                                  style: AppUtils.adaptableTextStyle(size: 10.0, fontWeight: FontWeight.normal, color: AppUtils.hexToColor('#333333')),
                                ),
                                Text(
                                  'NGN 5,800',
                                  style: AppUtils.adaptableTextStyle(size: 10.0, fontWeight: FontWeight.normal, color: AppUtils.hexToColor('#333333')),
                                )
                              ],
                            ),
                          );
                        }
                    ),

                    AppUtils.verticalSpacing(height: 15.0),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                            child: Divider(
                              height: 4.0,
                              thickness: 0.5,
                              color: Colors.grey,
                            )
                        )
                      ],
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            AppStrings.total,
                            style: AppUtils.adaptableTextStyle(size: 14.0, fontWeight: FontWeight.normal, color: AppUtils.hexToColor('#333333')),
                          ),
                          Text(
                            'NGN 23,200',
                            style: AppUtils.adaptableTextStyle(size: 18.0, fontWeight: FontWeight.normal, color: AppUtils.hexToColor('#2DBB54')),
                          )
                        ],
                      ),
                    )



                  ],
                ),
              ),
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                    child: AppButton(
                      enabled: true,
                      enabledColor: bPurple,
                      buttonText: AppStrings.sendBill,
                      voidCallback: () {
                        Navigator.pushNamed(context, AppRoutes.toBillSuccessScreen);
                      },
                      textColor: bWhite,
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
