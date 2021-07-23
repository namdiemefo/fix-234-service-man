import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:service_man/helpers/assets/colors.dart';
import 'package:service_man/helpers/reusable_screens/app_button.dart';
import 'package:service_man/helpers/utils/app_utils.dart';

class EquipmentScreen extends StatefulWidget {
  @override
  _EquipmentScreenState createState() => _EquipmentScreenState();
}

class _EquipmentScreenState extends State<EquipmentScreen> {

  bool list = false;

  void _displayBottomSheet(BuildContext context) {
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        builder: (ctx) {
          return Container(
            height: MediaQuery.of(context).size.height  * 0.4,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0) ),
              color: bPurple,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                  children: [
                    SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 50.0,
                          child: Divider(
                            height: 5.0,
                            thickness: 2.0,
                            color: bWhite,

                          ),
                        )
                      ],
                    ),
                    AppUtils.verticalSpacing(height: 20.0),
                    Container(
                          height: 51.0,
                          child: Row(
                            children: [
                              Expanded(
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                        fillColor: Colors.grey.shade500,
                                        filled: true,
                                        enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(color: lightGrey)
                                        ),
                                        border: OutlineInputBorder(
                                            borderSide: BorderSide(color: lightGrey)
                                        ),
                                      hintText: 'Equipment Name',
                                      hintStyle: AppUtils.adaptableTextStyle(size: 13.0, color: bWhite, fontWeight: FontWeight.normal)
                                    ),
                                  )
                              ),
                            ],
                          )
                        ),
                    AppUtils.verticalSpacing(height: 20.0),
                    Container(
                        height: 51.0,
                        child: Row(
                          children: [
                            Expanded(
                                child: TextFormField(
                                  decoration: InputDecoration(
                                      fillColor: bWhite,
                                      filled: true,
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(color: lightGrey)
                                      ),
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide(color: lightGrey)
                                      ),
                                      hintText: 'Select Capacity',
                                      hintStyle: AppUtils.adaptableTextStyle(size: 13.0, color: bDark, fontWeight: FontWeight.normal)
                                  ),
                                )
                            ),
                          ],
                        )
                    ),
                    AppUtils.verticalSpacing(height: 20.0),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                            child: AppButton(
                              height: 55.0,
                              enabled: true,
                              buttonText: 'Add Equipment',
                              enabledColor: bYellow,
                              voidCallback: () {
                                // Navigator.pushNamed(context, 'navigation/equipment');
                              },
                            )
                        )
                      ],
                    )

                  ],
                ),
            ),
          );
        });
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
          'Equipment Serviced',
          style: AppUtils.adaptableTextStyle(size: 14.0, fontWeight: FontWeight.bold, color: bBlack),
        ),
        actions: [
          Container(
            padding: EdgeInsets.only(right: 10.0),
            width: AppUtils.screenAwareSize(60.0, context),
            height: AppUtils.screenAwareSize(60.0, context),
            child: RawMaterialButton(
              shape: CircleBorder(),
              elevation: 1.0,
              fillColor: bPurple,
              child: Icon(Icons.add, color: bWhite),
              onPressed: () {
                _displayBottomSheet(context);
              },
            ),
          )
        ],
      ),
      backgroundColor: bMilk,
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            list ? ListView.builder(
                shrinkWrap: true,
                itemCount: 3,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    height: AppUtils.screenAwareSize(60.0, context),
                    child: Slidable(
                      secondaryActions: [
                        IconSlideAction(
                          caption: '',
                          color: Colors.transparent,
                          iconWidget: Icon(Icons.delete, color: bPink),
                          onTap: () {

                          },
                        )
                      ],
                      actionPane: SlidableDrawerActionPane(),
                      actionExtentRatio: 0.25,
                      child: Card(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
                        color: bPurple,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 14.0, right: 20.0, top: 8.0, bottom: 8.0),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                    child: Text(
                                      '40-60 KVA • Mikano Gen 1',
                                      style: AppUtils.adaptableTextStyle(size: 13.0, fontWeight: FontWeight.normal, color: bWhite),
                                    ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      boxShadow: [BoxShadow(color: bWhite, spreadRadius: AppUtils.screenAwareSize(10.0, context))]
                                  ),
                                  child: Text(
                                    '2',
                                    style: AppUtils.adaptableTextStyle(size: 14.0, fontWeight: FontWeight.normal, color: bPurple),
                                  ),
                                )
                              ],
                            ),
                        ),
                        ),
                      ),
                  );
                }
            )
            : Padding(
              padding: const EdgeInsets.only(top: 200.0),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                        child: Text(
                          'Add equipment serviced or worked on to create bill',
                          style: AppUtils.adaptableTextStyle(size: 18.0, color: bHintColor, fontWeight: FontWeight.normal),
                          textAlign: TextAlign.center,
                        )
                    )
                  ],
                ),
              ),
            ),
            Spacer(),
            Row(
              children: [
                Expanded(
                    child: AppButton(
                      voidCallback: () {

                      },
                      enabledColor: bPurple,
                      enabled: true,
                      buttonText: 'Preview Bill',
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
