import 'package:flutter/material.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'package:service_man/helpers/assets/colors.dart';
import 'package:service_man/helpers/assets/strings.dart';
import 'package:service_man/helpers/utils/app_utils.dart';

class ServiceChargeScreen extends StatefulWidget {
  @override
  _ServiceChargeScreenState createState() => _ServiceChargeScreenState();
}

class _ServiceChargeScreenState extends State<ServiceChargeScreen> {

  FloatingSearchBarController controller = FloatingSearchBarController();

  @override
  Widget build(BuildContext context) {
    final isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
    return Scaffold(
      appBar: AppBar(
        // iconTheme: IconThemeData(
        //     color: bDark
        // ),
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: bMilk,
        elevation: 0.0,
        title: Text(
          AppStrings.serviceChargeList,
          style: AppUtils.adaptableTextStyle(size: 14.0, fontWeight: FontWeight.bold, color: bBlack),
        ),
      ),
      backgroundColor: bMilk,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Stack(
          fit: StackFit.expand,
          children: [
            FloatingSearchBar(
                body: FloatingSearchBarScrollNotifier(
                  child: Container(
                    padding: EdgeInsets.fromLTRB(0.0, 60.0, 0.0, 0.0),
                    decoration: BoxDecoration(
                        color: Colors.transparent
                    ),
                    child: ListView.builder(
                        itemCount: 10,
                        itemBuilder: (context, index) {
                          return Card(
                            color: bWhite,
                            child: Padding(
                              padding: EdgeInsets.all(16.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Checkbox(
                                      checkColor: bPurple,
                                      activeColor: bWhite,
                                      value: false,
                                      onChanged: (bool val) {

                                      }
                                  ),
                                  AppUtils.horizontalSpacing(width: 5.0),
                                  Expanded(
                                      child: Text(
                                        'Access Module',
                                        style: AppUtils.adaptableTextStyle(size: 13.0, fontWeight: FontWeight.normal, color: bFadedGrey),
                                      )
                                  ),
                                  AppUtils.horizontalSpacing(width: 5.0),
                                  Expanded(
                                      child: Text(
                                        'NGN 180,000',
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
      ),
    );
  }
}
