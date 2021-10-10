import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:service_man/api/models/bill/create_bill_model.dart';
import 'package:service_man/core/blocs/preview/preview_bloc.dart';
import 'package:service_man/helpers/assets/colors.dart';
import 'package:service_man/helpers/assets/images.dart';
import 'package:service_man/helpers/assets/routes.dart';
import 'package:service_man/helpers/assets/strings.dart';
import 'package:service_man/helpers/reusable_screens/app_button.dart';
import 'package:service_man/helpers/reusable_screens/app_loader.dart';
import 'package:service_man/helpers/reusable_screens/shadow_icon.dart';
import 'package:service_man/helpers/utils/app_utils.dart';

class PreviewScreen extends StatelessWidget {

  final List<Equipment> equipment;
  final String serviceName;

  const PreviewScreen({Key key, this.equipment, this.serviceName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
          create: (context) => PreviewBloc(),
          child: _PreviewScreen(equipment: equipment, serviceName: serviceName),
);
  }
}


class _PreviewScreen extends StatefulWidget {

  final List<Equipment> equipment;
  final String serviceName;

  const _PreviewScreen({Key key, this.equipment, this.serviceName}) : super(key: key);

  @override
  __PreviewScreenState createState() => __PreviewScreenState();
}

class __PreviewScreenState extends State<_PreviewScreen> {

  @override
  void initState() {
    print(widget.serviceName);
    super.initState();
  }

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
      body: BlocConsumer<PreviewBloc, PreviewState>(
        listenWhen: (prevState, nextState) {
          if (prevState is OnCreateBillLoading) {
            Load.dismiss(context);
          }
          return null;
        },
        listener: (context, state) {
          if (state is OnCreateBillFailure) {
            AppUtils.showErrorFlushBar(context, state.error);
          }

          if (state is OnCreateBillLoading) {
            Load.show(context);
          }

          if (state is OnCreateBillSuccess) {
            Navigator.pushNamedAndRemoveUntil(context, AppRoutes.toBillSuccessScreen, (route) => false);
          }

        },
        builder: (context, state) {
          return Padding(
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
                                '${widget.serviceName} Service',
                                style: AppUtils.adaptableTextStyle(size: 16.0, fontWeight: FontWeight.bold, color: AppUtils.hexToColor('#070A28')),
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

                          GroupedListView(
                              elements: widget.equipment,
                              groupBy: (Equipment equipment) => equipment.name,
                              order: GroupedListOrder.DESC,
                              sort: true,
                              shrinkWrap: true,
                              useStickyGroupSeparators: false,
                              groupSeparatorBuilder: (equipment) {
                                return Container();
                              },
                              itemBuilder: (context, Equipment equipment) {
                                return Column(
                                  children: [
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
                                            '${equipment.name}',
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
                                        itemCount: equipment.parts.length,
                                        shrinkWrap: true,
                                        itemBuilder: (context, index) {
                                          return Padding(
                                            padding: const EdgeInsets.symmetric(vertical: 5.0),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text(
                                                  '${equipment.parts[index].name}',
                                                  style: AppUtils.adaptableTextStyle(size: 10.0, fontWeight: FontWeight.normal, color: AppUtils.hexToColor('#333333')),
                                                ),
                                                Text(
                                                  '${equipment.parts[index].price}',
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
                                        itemCount: equipment.servicing.length,
                                        shrinkWrap: true,
                                        itemBuilder: (context, index) {
                                          return Padding(
                                            padding: const EdgeInsets.symmetric(vertical: 5.0),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text(
                                                  '${equipment.servicing[index].name}',
                                                  style: AppUtils.adaptableTextStyle(size: 10.0, fontWeight: FontWeight.normal, color: AppUtils.hexToColor('#333333')),
                                                ),
                                                Text(
                                                  '${equipment.servicing[index].price}',
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
                                  ],
                                );
                              },
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
                                  'NGN ${_calculateTotal(widget.equipment)}',
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
                              CreateBillModel createBillModel = CreateBillModel();
                              BlocProvider.of<PreviewBloc>(context).add(CreateBill(createBillModel));
                            },
                            textColor: bWhite,
                          )
                      )
                    ],
                  )
                ],
              ),
            );
  },
),
    );
  }

  int _calculateTotal(List<Equipment> equipments) {
    int total = 0;

    if (equipments.isNotEmpty) {
      equipments.forEach((equipment) {
        if (equipment.parts.isNotEmpty) {
          equipment.parts.forEach((part) {
            total += part.price;
          });
        }

        if (equipment.servicing.isNotEmpty) {
          equipment.servicing.forEach((service) {
            total += service.price;
          });
        }

      });
    }

    return total;

  }
}

class PreviewScreenArguments {
  final List<Equipment> equipments;
  final String serviceName;

  PreviewScreenArguments(this.equipments, this.serviceName);
}
