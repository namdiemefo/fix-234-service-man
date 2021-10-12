import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'package:service_man/api/models/bill/create_bill_model.dart';
import 'package:service_man/api/models/parts_service/part_service.dart';
import 'package:service_man/core/blocs/servicing/servicing_bloc.dart';
import 'package:service_man/db/equipment_service.dart';
import 'package:service_man/helpers/assets/colors.dart';
import 'package:service_man/helpers/assets/strings.dart';
import 'package:service_man/helpers/utils/app_utils.dart';

class ServicingScreen extends StatelessWidget {

  final Equipment equipment;

  const ServicingScreen({Key key, this.equipment}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ServicingBloc()..add(FetchServicing('')),
      child: _ServicingScreen(equipment: equipment),
);
  }
}


class _ServicingScreen extends StatefulWidget {
  final Equipment equipment;

  const _ServicingScreen({Key key, this.equipment}) : super(key: key);
  @override
  _ServicingScreenState createState() => _ServicingScreenState();
}

class _ServicingScreenState extends State<_ServicingScreen> {

  FloatingSearchBarController controller = FloatingSearchBarController();
  List<PartService> partService = [];
  List<PartService> trackService = [];

  @override
  Widget build(BuildContext context) {
    final isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
    return WillPopScope(
      onWillPop: () async {
        Navigator.pop(context, widget.equipment);
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
              color: bDark
          ),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context, widget.equipment);
            },
            icon: Icon(Icons.arrow_back, color: Colors.black),
          ),
          centerTitle: true,
          backgroundColor: bMilk,
          elevation: 0.0,
          title: Text(
            AppStrings.serviceChargeList,
            style: AppUtils.adaptableTextStyle(size: 14.0, fontWeight: FontWeight.bold, color: bBlack),
          ),
        ),
        backgroundColor: bMilk,
        body: BlocConsumer<ServicingBloc, ServicingState>(
              listener: (context, state) {
                if (state is OnServicingFailure) {
                  partService = [];
                  AppUtils.showErrorFlushBar(context, state.error);
                }
              },
              builder: (context, state) {

                if (state is OnServicingSuccess) {
                  partService = state.partService;
                }

                if (state is OnServicingLoading) {

                }
                return Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      FloatingSearchBar(
                          leadingActions: null,
                          automaticallyImplyBackButton: false,
                          body: FloatingSearchBarScrollNotifier(
                            child: Container(
                              padding: EdgeInsets.fromLTRB(0.0, 60.0, 0.0, 0.0),
                              decoration: BoxDecoration(
                                  color: Colors.transparent
                              ),
                              child: ListView.builder(
                                  itemCount: partService.length,
                                  itemBuilder: (context, index) {
                                    return Card(
                                      color: bWhite,
                                      child: Padding(
                                        padding: EdgeInsets.all(16.0),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Checkbox(
                                                checkColor: bPurple,
                                                activeColor: bWhite,
                                                value: trackService.contains(partService[index]),
                                                onChanged: (bool val) {
                                                  Servicing part = Servicing(name: partService[index].name, service: partService[index].service, price: partService[index].price);
                                                  print("val : $val");
                                                  if (val) {
                                                    trackService.add(partService[index]);
                                                    widget.equipment.servicing.add(part);
                                                  } else {
                                                    trackService.remove(partService[index]);
                                                    widget.equipment.servicing.remove(part);
                                                  }
                                                  setState(() {

                                                  });
                                                }
                                            ),
                                            AppUtils.horizontalSpacing(width: 5.0),
                                            Expanded(
                                                flex: 3,
                                                child: Text(
                                                  '${partService[index].name}',
                                                  style: AppUtils.adaptableTextStyle(size: 13.0, fontWeight: FontWeight.normal, color: bFadedGrey),
                                                )
                                            ),
                                            AppUtils.horizontalSpacing(width: 15.0),
                                            Expanded(
                                                child: Text(
                                                  'N${partService[index].price}',
                                                  style: AppUtils.adaptableTextStyle(size: 13.0, fontWeight: FontWeight.normal, color: bDarkGrey),
                                                )
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  }),

                            ),
                          ),
                          controller: controller,
                          clearQueryOnClose: false,
                          hint: AppStrings.chargeHint,
                          hintStyle: AppUtils.adaptableTextStyle(size: 13.0, color: AppUtils.hexToColor('#D5D5D5'), fontWeight: FontWeight.w200),
                          scrollPadding: const EdgeInsets.only(top: 16, bottom: 56),
                          transition: CircularFloatingSearchBarTransition(),
                          transitionDuration: const Duration(milliseconds: 800),
                          transitionCurve: Curves.easeInOut,
                          physics: const BouncingScrollPhysics(),
                          axisAlignment: isPortrait ? 0.0 : -1.0,
                          openAxisAlignment: 0.0,
                          maxWidth: isPortrait ? 600 : 500,
                          debounceDelay: const Duration(milliseconds: 500),
                          actions: [FloatingSearchBarAction.searchToClear( showIfClosed: false )],
                          onQueryChanged: (query) {
                            BlocProvider.of<ServicingBloc>(context).add(FetchServicing(query));
                          },
                          onSubmitted: (query) {

                          },
                          builder: (context, transition) {
                            return ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Material(
                                color: Colors.white,
                                elevation: 4.0,
                                child: Container(),
                              ),
                            );
                          }
                      ),

                    ],
                  ),
                );
  },
),
      ),
    );
  }
}

class ServiceScreenArguments {
  final Equipment equipment;

  ServiceScreenArguments(this.equipment);
}
