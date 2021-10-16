import 'package:flutter/material.dart';
import 'package:service_man/api/models/bookings/response/get_booking_response.dart';
import 'package:service_man/helpers/assets/colors.dart';
import 'package:service_man/helpers/assets/images.dart';
import 'package:service_man/helpers/assets/routes.dart';
import 'package:service_man/helpers/assets/strings.dart';
import 'package:service_man/helpers/reusable_screens/app_button.dart';
import 'package:service_man/helpers/utils/app_utils.dart';
import 'package:service_man/pages/bill/equipment_screen.dart';
import 'package:service_man/pages/booking/summary_screen.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailScreen extends StatefulWidget {
  final GetBookingResponse getBookingResponse;

  const DetailScreen({Key key, this.getBookingResponse}) : super(key: key);
  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
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
          AppStrings.requestDetails,
          style: AppUtils.adaptableTextStyle(size: 14.0, fontWeight: FontWeight.bold, color: bBlack),
        ),
      ),
      backgroundColor: bMilk,
      body: Padding(
        padding: EdgeInsets.all(24.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: bWhite,
                  borderRadius: BorderRadius.all(Radius.circular(5.0))
                ),
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      children: [
                        Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      AppStrings.service,
                                      style: AppUtils.adaptableTextStyle(size: 10.0, color: bFadedGrey, fontWeight: FontWeight.normal),
                                    ),
                                    AppUtils.verticalSpacing(height: 3.0),
                                    Text(
                                      widget.getBookingResponse.name,
                                      style: AppUtils.adaptableTextStyle(size: 13.0, color: bDark, fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                                Spacer(),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      AppStrings.orderId,
                                      style: AppUtils.adaptableTextStyle(size: 10.0, color: bFadedGrey, fontWeight: FontWeight.normal),
                                    ),
                                    AppUtils.verticalSpacing(height: 3.0),
                                    Text(
                                      widget.getBookingResponse.bookingId,
                                      style: AppUtils.adaptableTextStyle(size: 13.0, color: bDark, fontWeight: FontWeight.bold),
                                    )
                                  ],
                                )
                              ],
                            )
                        )
                      ],
                    ),
                    AppUtils.verticalSpacing(height: 10.0),
                    Divider(
                      height: 10.0,
                      thickness: 1.0,
                      color: bFadedGrey,
                    ),
                    AppUtils.verticalSpacing(height: 10.0),

                    Row(
                      children: [
                        Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      AppStrings.dateOrdered,
                                      style: AppUtils.adaptableTextStyle(size: 10.0, color: bFadedGrey, fontWeight: FontWeight.normal),
                                    ),
                                    AppUtils.verticalSpacing(height: 3.0),
                                    Text(
                                      AppUtils.convertDate('${widget.getBookingResponse.createdAt}'),
                                      style: AppUtils.adaptableTextStyle(size: 13.0, color: bDark, fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                                Spacer(),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      AppStrings.time,
                                      style: AppUtils.adaptableTextStyle(size: 10.0, color: bFadedGrey, fontWeight: FontWeight.normal),
                                    ),
                                    AppUtils.verticalSpacing(height: 3.0),
                                    Text(
                                      widget.getBookingResponse.time,
                                      style: AppUtils.adaptableTextStyle(size: 13.0, color: bDark, fontWeight: FontWeight.bold),
                                    )
                                  ],
                                )
                              ],
                            )
                        )
                      ],
                    ),
                    AppUtils.verticalSpacing(height: 10.0),
                    Divider(
                      height: 10.0,
                      thickness: 1.0,
                      color: bFadedGrey,
                    ),
                    AppUtils.verticalSpacing(height: 10.0),

                    Row(
                      children: [
                        Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      AppStrings.frequency,
                                      style: AppUtils.adaptableTextStyle(size: 10.0, color: bFadedGrey, fontWeight: FontWeight.normal),
                                    ),
                                    AppUtils.verticalSpacing(height: 3.0),
                                    Text(
                                      widget.getBookingResponse.frequency,
                                      style: AppUtils.adaptableTextStyle(size: 13.0, color: bDark, fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                                Spacer(),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      AppStrings.numberOfEquipment,
                                      style: AppUtils.adaptableTextStyle(size: 10.0, color: bFadedGrey, fontWeight: FontWeight.normal),
                                    ),
                                    AppUtils.verticalSpacing(height: 3.0),
                                    Text(
                                      '',
                                      style: AppUtils.adaptableTextStyle(size: 13.0, color: bDark, fontWeight: FontWeight.bold),
                                      textAlign: TextAlign.center,
                                    )
                                  ],
                                )
                              ],
                            )
                        )
                      ],
                    ),

                  ],
                ),
              ),
              AppUtils.verticalSpacing(height: 20.0),
              Container(
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                    color: bWhite,
                    borderRadius: BorderRadius.all(Radius.circular(5.0))
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      AppStrings.serviceDescription,
                      style: AppUtils.adaptableTextStyle(size: 10.0, fontWeight: FontWeight.normal, color: bDark),
                    ),
                    AppUtils.verticalSpacing(height: 13.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                            child: Row(
                              children: [
                                Text(
                                  widget.getBookingResponse.description,
                                  style: AppUtils.adaptableTextStyle(size: 13.0, fontWeight: FontWeight.normal, color: bDark),
                                )
                              ],
                            )
                        )
                      ],
                    )
                  ],
                ),
              ),
              AppUtils.verticalSpacing(height: 20.0),
              Container(
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                    color: bWhite,
                    borderRadius: BorderRadius.all(Radius.circular(5.0))
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppStrings.customerInfo,
                      style: AppUtils.adaptableTextStyle(size: 10.0, color: bFadedGrey, fontWeight: FontWeight.w400),

                    ),
                    AppUtils.verticalSpacing(height: 10.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        widget.getBookingResponse.userImage.isEmpty || widget.getBookingResponse.userImage == null ?
                        CircleAvatar(
                          radius: 30.0,
                          backgroundImage: AssetImage('${Images.place_holder}'),
                        ):
                        CircleAvatar(
                          radius: 30.0,
                          backgroundImage: NetworkImage("${widget.getBookingResponse.userImage}"),
                        ),
                        AppUtils.horizontalSpacing(width: AppUtils.screenAwareSize(20.0, context)),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.getBookingResponse.user,
                              style: AppUtils.adaptableTextStyle(size: 13.0, fontWeight: FontWeight.bold, color: bBlack),
                            ),
                            AppUtils.verticalSpacing(height: 5.0),
                            Text(
                              '${widget.getBookingResponse.location}',
                              style: AppUtils.adaptableTextStyle(size: 12.0, fontWeight: FontWeight.normal, color: bHintColor),
                            )
                            // Row(
                            //   mainAxisAlignment: MainAxisAlignment.start,
                            //   children: [
                            //     Flexible(
                            //       child: Text(
                            //             'Generator Technician',
                            //             style: AppUtils.adaptableTextStyle(size: 12.0, fontWeight: FontWeight.bold, color: bMilk),
                            //           ),
                            //
                            //     ),
                            //   ],
                            // )
                          ],
                        )
                      ],
                    ),
                    AppUtils.verticalSpacing(height: 15.0),
                    Row(
                      children: [
                        Expanded(
                            child: AppButton(
                              enabled: true,
                              buttonText: AppStrings.callClient,
                              height: 50.0,
                              enabledColor: bPurple,
                              voidCallback: () {
                                // _callNumber(widget.getBookingResponse.userPhone);
                                _callNumber('${widget.getBookingResponse.userPhone}');
                              },
                            )
                        )
                      ],
                    )
                  ],
                ),
              ),
              AppUtils.verticalSpacing(height: 40.0),
              Row(
                children: [
                  Expanded(
                      child: AppButton(
                        enabled: true,
                        buttonText: AppStrings.createBill,
                        enabledColor: bYellow,
                        voidCallback: () {
                          print(widget.getBookingResponse.name);
                          Navigator.pushNamed(context, AppRoutes.toEquipmentScreen, arguments: EquipmentScreenArgument(widget.getBookingResponse.name, widget.getBookingResponse.id));
                        },
                      )
                  )
                ],
              ),
              AppUtils.verticalSpacing(height: 20.0),
              Row(
                children: [
                  Expanded(
                      child: AppButton(
                        enabled: true,
                        buttonText: AppStrings.completeJob,
                        enabledColor: bGreen,
                        voidCallback: () {
                          Navigator.pushNamed(context, AppRoutes.toSummaryScreen, arguments: SummaryArguments(widget.getBookingResponse.id));
                        },
                      )
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _callNumber(String phoneNumber) async {
    String url = 'tel:' + phoneNumber;
    print(url);
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      AppUtils.showErrorFlushBar(context, 'Enable permission');
      // throw 'Could not launch $url';
    }
  }
}

class DetailScreenArgument {
  final GetBookingResponse getBookingResponse;

  DetailScreenArgument(this.getBookingResponse);
}
