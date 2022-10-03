import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:service_man/api/models/bookings/response/get_booking_response.dart';
import 'package:service_man/core/blocs/history/history_bloc.dart';
import 'package:service_man/helpers/assets/colors.dart';
import 'package:service_man/helpers/assets/images.dart';
import 'package:service_man/helpers/assets/strings.dart';
import 'package:service_man/helpers/reusable_screens/app_list_loader.dart';
import 'package:service_man/helpers/reusable_screens/shadow_icon.dart';
import 'package:service_man/helpers/utils/app_utils.dart';

class HistoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => HistoryBloc()..add(FetchHistory()),
        child: _HistoryScreen(),
);
  }
}


class _HistoryScreen extends StatefulWidget {
  @override
  __HistoryScreenState createState() => __HistoryScreenState();
}

class __HistoryScreenState extends State<_HistoryScreen> {

  List<GetBookingResponse> getBookingResponse = [];
  bool _isLoading =  false;
  RefreshController _refreshController = RefreshController(initialRefresh: false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: bMilk,
        elevation: 0.0,
        title: Text(
          AppStrings.orderHistory,
          style: AppUtils.adaptableTextStyle(size: 14.0, fontWeight: FontWeight.bold, color: bBlack),
        ),
      ),
      backgroundColor: bMilk,
      body: BlocConsumer<HistoryBloc, HistoryState>(

        listenWhen: (prevState, nextState) {
          if (prevState is OnHistoryLoading) {
            _isLoading = false;
          }
          return null;
        },

        listener: (context, state) {
          if (state is OnHistoryFailure) {
             getBookingResponse = [];
            AppUtils.showErrorFlushBar(context, state.error);
          }

          if (state is OnHistoryLoading) {
            _isLoading = true;
          }

        },
        builder: (context, state) {
          if (state is OnHistorySuccess) {
            getBookingResponse = state.getBookingResponse;
          }
          return Padding(
            padding: EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: _isLoading ? AppListLoader() : SizedBox.expand(
                  child: SmartRefresher(
                  enablePullDown: true,
                  enablePullUp: false,
                  header: ClassicHeader(),
                  onRefresh: () async {
                          BlocProvider.of<HistoryBloc>(context).add(FetchHistory());
                      },
                      controller: _refreshController,
                      child: getBookingResponse.isEmpty ? Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('You have no completed Job')
                          ],
                        ),
                      ) : ListView.builder(
                          itemCount: getBookingResponse.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10.0),
                              child: Container(
                                color: bWhite,
                                padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 26.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    AdaptableShadowIcon(
                                      iconUrl: Images.gen,
                                      imageHeight: 15.0,
                                      imageWidth: 20.0,
                                      radius: 20.0,
                                      boxShadow: bMilk,
                                    ),

                                    AppUtils.horizontalSpacing(width: 1.0),

                                    Expanded(child: Column(
                                      children: [
                                        Text(
                                          '${getBookingResponse[index].name}',
                                          style: AppUtils.adaptableTextStyle(size: 16.0, fontWeight: FontWeight.bold, color: bBlack),
                                        ),
                                        AppUtils.verticalSpacing(height: 3.0),
                                        Container(
                                          height: 35,
                                          color: getBookingResponse[index].assistantTechnicianId.contains(getBookingResponse[index].id) ? bYellow : bPurple,
                                          child: Padding(
                                            padding: EdgeInsets.all(8.0),
                                            child: Text(
                                              getBookingResponse[index].assistantTechnicianId.contains(getBookingResponse[index].id) ? 'Assistant Serviceman' : 'Lead Serviceman',
                                              style: AppUtils.adaptableTextStyle(size: 12.0, fontWeight: FontWeight.w400, color: bWhite),
                                            ),
                                          ),
                                        ),
                                        AppUtils.verticalSpacing(height: 3.0),
                                        Text(
                                          'Order ID: ${getBookingResponse[index].bookingId}',
                                          style: AppUtils.adaptableTextStyle(size: 14.0, fontWeight: FontWeight.w400, color: bBlack),
                                        ),
                                        AppUtils.verticalSpacing(height: 3.0),


                                      ],

                                    )),

                                    Container(
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          boxShadow: [BoxShadow(color: bCheckedColor, spreadRadius: 8.0)]
                                      ),
                                      child: Icon(Icons.check, size: 10.0, color: bWhite),
                                    ),

                                  ],

                                ),
                              ),
                              // child: ListTile(
                              //   tileColor: bWhite,
                              //   contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 26.0),
                              //
                              //   leading: Padding(
                              //     padding: const EdgeInsets.only(top: 8.0),
                              //     child: AdaptableShadowIcon(
                              //       iconUrl: Images.gen,
                              //       imageHeight: 15.0,
                              //       imageWidth: 20.0,
                              //       radius: 20.0,
                              //       boxShadow: bMilk,
                              //     ),
                              //   ),
                              //   title: Text(
                              //     '${getBookingResponse[index].name}',
                              //     style: AppUtils.adaptableTextStyle(size: 16.0, fontWeight: FontWeight.bold, color: bBlack),
                              //   ),
                              //   subtitle: Padding(
                              //     padding: const EdgeInsets.only(top: 8.0),
                              //     child: Text(
                              //       'Order ID: ${getBookingResponse[index].bookingId}',
                              //       style: AppUtils.adaptableTextStyle(size: 14.0, fontWeight: FontWeight.w400, color: bBlack),
                              //     ),
                              //   ),
                              //   trailing: Container(
                              //     decoration: BoxDecoration(
                              //         shape: BoxShape.circle,
                              //         boxShadow: [BoxShadow(color: bCheckedColor, spreadRadius: 8.0)]
                              //     ),
                              //     child: Icon(Icons.check, size: 10.0, color: bWhite),
                              //   ),
                              // ),
                            );
                          }
                      )

                  ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
