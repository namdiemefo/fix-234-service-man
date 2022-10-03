import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:service_man/api/models/auth/response/login_response_model.dart';
import 'package:service_man/api/models/bookings/response/get_booking_response.dart';
import 'package:service_man/core/blocs/jobs/jobs_bloc.dart';
import 'package:service_man/db/app_storage.dart';
import 'package:service_man/helpers/assets/colors.dart';
import 'package:service_man/helpers/assets/images.dart';
import 'package:service_man/helpers/assets/routes.dart';
import 'package:service_man/helpers/assets/strings.dart';
import 'package:service_man/helpers/di/service_locator.dart';
import 'package:service_man/helpers/reusable_screens/app_list_loader.dart';
import 'package:service_man/helpers/reusable_screens/shadow_icon.dart';
import 'package:service_man/helpers/utils/app_utils.dart';
import 'package:service_man/pages/booking/details_screen.dart';

class JobScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => JobsBloc()..add(FetchPendingJobs()),
        child: _JobScreen(),
      );
  }
}


class _JobScreen extends StatefulWidget {
  @override
  __JobScreenState createState() => __JobScreenState();
}

class __JobScreenState extends State<_JobScreen> {

  List<GetBookingResponse> getBookingResponse;
  bool _isLoading =  false;
  RefreshController _refreshController = RefreshController(initialRefresh: false);
  final AppStorage _appStorage = locator<AppStorage>();
  String user, role, image;

  @override
  void initState() {
    getUser();
    super.initState();
  }

  @override
  void dispose() {
    _refreshController.dispose();
    super.dispose();
  }

  void getUser() async {
    LoginResponseModel loginResponseModel = await _appStorage.getUser();
    user = loginResponseModel.fullName;
    role = loginResponseModel.type;
    image = loginResponseModel.image;
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<JobsBloc, JobsState>(
      listenWhen: (prevState, nextState) {
        if (prevState is OnLoading) {
          _isLoading = false;
        }
        return null;
      },
  listener: (context, state) {
    if (state is OnFailure) {
      AppUtils.showErrorFlushBar(context, state.error);
    }

    if (state is OnLoading) {
      _isLoading = true;
    }
  },
  child: BlocBuilder<JobsBloc, JobsState>(
  builder: (context, state) {
    if (state is OnSuccess) {
      getBookingResponse = state.getBookingResponse;
    }
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
                  backgroundImage: image == null || image.isEmpty ? AssetImage(Images.place_holder) : NetworkImage(image),
                ),
                AppUtils.horizontalSpacing(width: 10.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '$user',
                      style: AppUtils.adaptableTextStyle(size: 16.0, fontWeight: FontWeight.bold, color: bMilk),
                    ),
                    Text(
                      '$role Technician',
                      style: AppUtils.adaptableTextStyle(size: 10.0, fontWeight: FontWeight.bold, color: bMilk),
                    )
                  ],
                )
              ],
            ),

            AppUtils.verticalSpacing(height: 30.0),

            Text(
              AppStrings.pendingJobs,
              style: AppUtils.adaptableTextStyle(size: 15.0, fontWeight: FontWeight.bold, color: bMilk),
            ),

            AppUtils.verticalSpacing(height: 5.0),

            Expanded(
                child: _isLoading ? AppListLoader() : SizedBox.expand(
                  child: SmartRefresher(
                    enablePullDown: true,
                    enablePullUp: false,
                    header: ClassicHeader(),
                    onRefresh: () async {
                      BlocProvider.of<JobsBloc>(context).add(FetchPendingJobs());
                    },
                    controller: _refreshController,
                    child: getBookingResponse == null || getBookingResponse.isEmpty ? Center(
                      child: Text(
                        'No pending jobs'
                      ),
                    ) : ListView.builder(
                        itemCount: getBookingResponse.length,
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
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [

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

                                      AppUtils.verticalSpacing(height: 10.0),

                                      Text(
                                        '${getBookingResponse[index].name} Service',
                                        style: AppUtils.adaptableTextStyle(size: 16.0, fontWeight: FontWeight.normal, color: bBlack),
                                      ),

                                      AppUtils.verticalSpacing(height: 10.0),

                                      Text(
                                        getBookingResponse[index].user,
                                        style: AppUtils.adaptableTextStyle(size: 14.0, fontWeight: FontWeight.normal, color: bBlack),
                                      ),

                                      AppUtils.verticalSpacing(height: 5.0),

                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Expanded(
                                            child: Text(
                                              getBookingResponse[index].location,
                                              style: AppUtils.adaptableTextStyle(size: 10.0, fontWeight: FontWeight.normal, color: bBlack),
                                            ),
                                          ),
                                        ],
                                      ),

                                      AppUtils.verticalSpacing(height: 3.0),

                                      Text(
                                        '${getBookingResponse[index].time} ${AppUtils.convertDate('${getBookingResponse[index].createdAt}')}',
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
                                                    '${AppStrings.orderId}: ${getBookingResponse[index].bookingId}',
                                                    style: AppUtils.adaptableTextStyle(size: 14.0, fontWeight: FontWeight.normal, color: bBlack),
                                                  ),

                                                  Spacer(),

                                                  OutlineButton(
                                                      onPressed: () {
                                                        Navigator.pushNamed(context, AppRoutes.toDetailScreen, arguments: DetailScreenArgument(getBookingResponse[index]));
                                                      },
                                                      child: Text(
                                                        AppStrings.viewDetails,
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
                    ),
                  ),
                )
            )

          ],
        ),
      ),
    );
  },
),
);
  }

}
