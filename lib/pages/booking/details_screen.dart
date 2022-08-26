import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:service_man/api/models/bookings/response/get_booking_response.dart';
import 'package:service_man/core/blocs/details/details_bloc.dart';
import 'package:service_man/core/global/provider/global_provider.dart';
import 'package:service_man/helpers/assets/colors.dart';
import 'package:service_man/helpers/assets/images.dart';
import 'package:service_man/helpers/assets/routes.dart';
import 'package:service_man/helpers/assets/strings.dart';
import 'package:service_man/helpers/reusable_screens/app_button.dart';
import 'package:service_man/helpers/reusable_screens/app_loader.dart';
import 'package:service_man/helpers/utils/app_utils.dart';
import 'package:service_man/pages/bill/equipment_screen.dart';
import 'package:service_man/pages/booking/summary_screen.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailScreen extends StatelessWidget {

  final GetBookingResponse getBookingResponse;

  const DetailScreen({Key key, this.getBookingResponse}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DetailsBloc(),
      child: _DetailScreen(getBookingResponse: getBookingResponse),
    );
  }
  
}


class _DetailScreen extends StatefulWidget {
  final GetBookingResponse getBookingResponse;

  const _DetailScreen({Key key, this.getBookingResponse}) : super(key: key);
  
  @override
  __DetailScreenState createState() => __DetailScreenState();
}

class __DetailScreenState extends State<_DetailScreen> {

  int numberOfAssistants = 1;

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
          'Order ID: ${widget.getBookingResponse.bookingId}',
          style: AppUtils.adaptableTextStyle(size: 14.0, fontWeight: FontWeight.bold, color: bBlack),
        ),
      ),
      backgroundColor: bMilk,
      body: BlocListener<DetailsBloc, DetailsState>(

        listenWhen: (prevState, nextState) {
          if (prevState is OnDetailsLoading) {
            Load.dismiss(context);
          }
          return true;
        },

            listener: (context, state) {
              if (state is OnDetailsSuccess) {
                AppUtils.showSuccessFlushBar(context, state.message);
              }

              if (state is OnDetailsFailure) {
                AppUtils.showErrorFlushBar(context, state.error);
              }

              if (state is OnDetailsLoading) {
                Load.show(context);
              }

            },
            child: Padding(
                          padding: EdgeInsets.all(24.0),
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [

                                Container(
                                  height: 70.0,
                                  decoration: BoxDecoration(
                                    color: widget.getBookingResponse.assistantTechnicianId.contains(widget.getBookingResponse.id) ? bLightGrey : bLightPurple,
                                    border: Border.all(color: widget.getBookingResponse.assistantTechnicianId.contains(widget.getBookingResponse.id) ? bYellow : bPurple)
                                  ),
                                  child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Text(
                                          widget.getBookingResponse.assistantTechnicianId.contains(widget.getBookingResponse.id) ? 'Assistant Serviceman' : 'Lead Serviceman'
                                      ),
                                    ),
                                  ),
                                ),

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
                                              Row(
                                                children: [
                                                  Text(
                                                    '${widget.getBookingResponse.location}',
                                                    style: AppUtils.adaptableTextStyle(size: 12.0, fontWeight: FontWeight.normal, color: bHintColor),
                                                  ),
                                                ],
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

                                    ],
                                  ),
                                ),
                                AppUtils.verticalSpacing(height: 15.0),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                        child: Container(
                                          height: 50.0,
                                          child: ElevatedButton(
                                            style: ButtonStyle(
                                              backgroundColor: MaterialStateProperty.all<Color>(bPurple),
                                              // shape: MaterialStateProperty.all(),
                                              textStyle: MaterialStateProperty.all<TextStyle>(TextStyle(
                                                fontSize: 14.0,
                                                fontWeight: FontWeight.w600,
                                                color: bWhite,
                                                // letterSpacing: 0.88,
                                              ).apply(fontWeightDelta: 1))
                                            ),
                                            child: Text(AppStrings.callClient),
                                            onPressed: () {
                                              _callNumber('${widget.getBookingResponse.userPhone}');
                                            },
                                          ),
                                        )
                                    ),
                                    AppUtils.horizontalSpacing(width: 5.0),
                                    Expanded(
                                        child: Container(
                                          height: 50.0,
                                          child: ElevatedButton(
                                            style: ButtonStyle(
                                                backgroundColor: (widget.getBookingResponse.assistantRequestStatus == 1 ? MaterialStateProperty.all<Color>(bYellow) : widget.getBookingResponse.assistantRequestStatus == 2 ? MaterialStateProperty.all<Color>(bGreen) :  widget.getBookingResponse.assistantRequestStatus == 3 ? MaterialStateProperty.all<Color>(bRedCard) :  MaterialStateProperty.all<Color>(bPurple)) ,
                                                // shape: MaterialStateProperty.all(),
                                                textStyle: MaterialStateProperty.all<TextStyle>(TextStyle(
                                                  fontSize: 14.0,
                                                  fontWeight: FontWeight.w600,
                                                  color: bWhite,
                                                  // letterSpacing: 0.88,
                                                ).apply(fontWeightDelta: 1))
                                            ),
                                            child: Text((widget.getBookingResponse.assistantRequestStatus == 1 ? 'Request Pending' : widget.getBookingResponse.assistantRequestStatus == 2 ? 'Request Accepted' : widget.getBookingResponse.assistantRequestStatus == 3 ? 'Request Rejected' :  AppStrings.requestAssistant)),
                                            onPressed: () {
                                              // ignore: unnecessary_statements
                                              (widget.getBookingResponse.assistantRequestStatus == 1 ? null : widget.getBookingResponse.assistantRequestStatus == 2 ? null : widget.getBookingResponse.assistantRequestStatus == 3 ? null :  _showDialog(context));

                                            },
                                          ),
                                        )
                                    ),

                                  ],
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

  void _showDialog(BuildContext bigContext) {
    showDialog(
        context: context,
        builder: (_) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius:
                BorderRadius.circular(20.0)),
            child: StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
                return Container(
                  height: 300.0,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        AppUtils.verticalSpacing(height: 20.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('${AppStrings.requestAnAssistant}', style: AppUtils.adaptableTextStyle(size: 14.0, color: bBlack, fontWeight: FontWeight.w700)),
                          ],
                        ),
                        AppUtils.verticalSpacing(height: 10.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('${AppStrings.requestAnAssistantMessage}', style: AppUtils.adaptableTextStyle(size: 12.0, color: bGrey, fontWeight: FontWeight.w400)),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('${AppStrings.jobDoneQuickly}', style: AppUtils.adaptableTextStyle(size: 12.0, color: bGrey, fontWeight: FontWeight.w400)),
                          ],
                        ),
                        AppUtils.verticalSpacing(height: 10.0),AppUtils.verticalSpacing(height: 10.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('${AppStrings.selectNumberOfAssistant}', style: AppUtils.adaptableTextStyle(size: 10.0, color: bBlack, fontWeight: FontWeight.w400)),
                          ],
                        ),
                        AppUtils.verticalSpacing(height: 10.0),AppUtils.verticalSpacing(height: 10.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Row(
                                children: [
                                  Expanded(
                                    child: InkWell(
                                      onTap: () {
                                        setState(() => numberOfAssistants == 1 ? numberOfAssistants = numberOfAssistants : numberOfAssistants--);
                                      },
                                      child: Container(
                                        height: 30.0,
                                        width: 50.0,
                                        decoration: BoxDecoration(
                                            color: bPurple, shape: BoxShape.circle),
                                        child: Center(
                                          child: Icon(Icons.remove, color: bWhite),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      padding: EdgeInsets.all(14.0),
                                      decoration: BoxDecoration(
                                          color: AppUtils.hexToColor('#EEEBEA'),
                                          shape: BoxShape.rectangle,
                                          borderRadius:
                                          BorderRadius.all(Radius.circular(8.0)),
                                          border: Border.all(
                                              color: AppUtils.hexToColor('#D5D5D5'),
                                              width: 1.0)),
                                      child: Center(
                                        child: Text(
                                            "$numberOfAssistants"),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: InkWell(
                                      onTap: () {
                                        setState(() => numberOfAssistants++);
                                      },
                                      child: Container(
                                        height: 30.0,
                                        width: 50.0,
                                        decoration: BoxDecoration(
                                            color: bPurple, shape: BoxShape.circle),
                                        child: Center(
                                          child: Icon(Icons.add, color: bWhite),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        AppUtils.verticalSpacing(height: 20.0),
                        AppButton(
                          textColor: bWhite,
                          buttonText: AppStrings.sendRequest,
                          enabled: true,
                          enabledColor: bPurple,
                          voidCallback: () {
                            BlocProvider.of<DetailsBloc>(bigContext).add(SendRequestEvent(widget.getBookingResponse.id, numberOfAssistants));
                          },
                        )



                      ],
                    ),
                  ),
                );
              },
            ),
          );
        }
    );
  }
}

class DetailScreenArgument {
  final GetBookingResponse getBookingResponse;

  DetailScreenArgument(this.getBookingResponse);
}
