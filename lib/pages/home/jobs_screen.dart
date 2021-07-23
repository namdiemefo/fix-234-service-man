import 'package:flutter/material.dart';
import 'package:service_man/helpers/assets/colors.dart';
import 'package:service_man/helpers/assets/images.dart';
import 'package:service_man/helpers/reusable_screens/shadow_icon.dart';
import 'package:service_man/helpers/utils/app_utils.dart';

class JobScreen extends StatefulWidget {
  @override
  _JobScreenState createState() => _JobScreenState();
}

class _JobScreenState extends State<JobScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bPurple,
      body: Padding(
        padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 60.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [

            // CARD
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 30.0,
                ),
                AppUtils.horizontalSpacing(width: 10.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Tunde Gabriel',
                      style: AppUtils.adaptableTextStyle(size: 16.0, fontWeight: FontWeight.bold, color: bMilk),
                    ),
                    Text(
                      'Generator Technician',
                      style: AppUtils.adaptableTextStyle(size: 10.0, fontWeight: FontWeight.bold, color: bMilk),
                    )
                  ],
                )
              ],
            ),

            AppUtils.verticalSpacing(height: 30.0),

            Text(
              'Pending jobs',
              style: AppUtils.adaptableTextStyle(size: 15.0, fontWeight: FontWeight.bold, color: bMilk),
            ),

            AppUtils.verticalSpacing(height: 5.0),

            Expanded(
                child: ListView.builder(
                    itemCount: 4,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        color: bWhite,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5.0))
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Stack(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Text(
                                    'Generator Service',
                                    style: AppUtils.adaptableTextStyle(size: 16.0, fontWeight: FontWeight.normal, color: bBlack),
                                  ),

                                  AppUtils.verticalSpacing(height: 10.0),

                                  Text(
                                    'Kelechi Dozie',
                                    style: AppUtils.adaptableTextStyle(size: 14.0, fontWeight: FontWeight.normal, color: bBlack),
                                  ),

                                  AppUtils.verticalSpacing(height: 5.0),

                                 Row(
                                   mainAxisAlignment: MainAxisAlignment.start,
                                   children: [
                                     Expanded(
                                       child: Text(
                                         '25B Gerrard Road, Ikoyi, Lagos',
                                         style: AppUtils.adaptableTextStyle(size: 10.0, fontWeight: FontWeight.normal, color: bBlack),
                                       ),
                                     ),
                                   ],
                                 ),

                                  AppUtils.verticalSpacing(height: 3.0),

                                  Text(
                                    'Afternoon, 11 Nov. 2020',
                                    style: AppUtils.adaptableTextStyle(size: 10.0, fontWeight: FontWeight.normal, color: bBlack),
                                  ),

                                  AppUtils.verticalSpacing(height: 3.0),

                                  Row(
                                    children: [
                                      Expanded(
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Order ID: 12345',
                                                style: AppUtils.adaptableTextStyle(size: 18.0, fontWeight: FontWeight.normal, color: bBlack),
                                              ),

                                              Spacer(),

                                              OutlineButton(
                                                  onPressed: () {
                                                    Navigator.pushNamed(context, 'navigator/details');
                                                  },
                                                  child: Text(
                                                    'View Details',
                                                    style: AppUtils.adaptableTextStyle(size: 12.0, fontWeight: FontWeight.normal, color: bBlack),
                                                  )
                                              )

                                            ],
                                          )
                                      )
                                    ],
                                  )


                                ],
                              ),

                              Positioned(
                                  child: AdaptableShadowIcon(
                                    iconUrl: Images.gen,
                                    imageHeight: 15.0,
                                    imageWidth: 20.0,
                                    radius: 20.0,
                                    boxShadow: bMilk,
                                  ),
                                right: 10.0,
                                top: 15.0,
                              )
                            ],
                          ),
                        ),
                      );
                    }
                )
            )

          ],
        ),
      ),
    );
  }
}
