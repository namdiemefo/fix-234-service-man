import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:service_man/api/models/bill/create_bill_model.dart';
import 'package:service_man/helpers/assets/colors.dart';
import 'package:service_man/helpers/assets/routes.dart';
import 'package:service_man/helpers/assets/strings.dart';
import 'package:service_man/helpers/reusable_screens/app_button.dart';
import 'package:service_man/helpers/utils/app_utils.dart';
import 'package:service_man/pages/bill/category_screen.dart';
import 'package:service_man/pages/bill/preview_screen.dart';

class EquipmentScreen extends StatefulWidget {
  final String service;
  final String bookingId;

  const EquipmentScreen({Key key, this.service, this.bookingId}) : super(key: key);
  @override
  _EquipmentScreenState createState() => _EquipmentScreenState(service, bookingId);
}

class _EquipmentScreenState extends State<EquipmentScreen> {

  final String service;
  final String bookingId;

  bool list = false;
  List<Equipment> equipmentList = [];
  TextEditingController equipmentNameController = TextEditingController();
  TextEditingController capacityController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  _EquipmentScreenState(this.service, this.bookingId);

  void _displayBottomSheet(BuildContext context) {
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        builder: (ctx) {
          return SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height  * 0.4,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0) ),
                color: bPurple,
              ),
              child: Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
                  child: Column(
                      children: [
                        SizedBox(height: 10),
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
                        AppUtils.verticalSpacing(height: 10.0),
                        Expanded(
                          child: Container(
                                height: 30.0,
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
                                            hintText: AppStrings.equipmentName,
                                            hintStyle: AppUtils.adaptableTextStyle(size: 13.0, color: bWhite, fontWeight: FontWeight.normal)
                                          ),
                                          validator: (String value) {
                                            if (value.isEmpty) {
                                              return "Enter an equipment name";
                                            }
                                            return null;
                                          },
                                          controller: equipmentNameController,
                                        )
                                    ),
                                  ],
                                )
                              ),
                        ),
                        AppUtils.verticalSpacing(height: 2.0),
                        Expanded(
                            child: Container(
                            height: 30.0,
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
                                          hintText: AppStrings.selectCapacity,
                                          hintStyle: AppUtils.adaptableTextStyle(size: 13.0, color: bDark, fontWeight: FontWeight.normal)
                                      ),
                                      validator: (String value) {
                                        if (value.isEmpty) {
                                          return "Enter the capacity";
                                        }
                                        return null;
                                      },
                                      controller: capacityController,
                                    )
                                ),
                              ],
                            )
                        )
                        ),
                        AppUtils.verticalSpacing(height: 10.0),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                                child: AppButton(
                                  height: 55.0,
                                  enabled: true,
                                  buttonText: AppStrings.addEquipment,
                                  enabledColor: bYellow,
                                  voidCallback: () {
                                    if (_formKey.currentState.validate()) {
                                      _formKey.currentState.save();
                                      Equipment equipment = Equipment(name: equipmentNameController.text, capacity: capacityController.text, servicing: [], parts: [], service: widget.service);
                                      equipmentList.add(equipment);
                                      setState(() {

                                      });
                                    }

                                  },
                                )
                            )
                          ],
                        )

                      ],
                    ),
                ),
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        iconTheme: IconThemeData(
            color: bDark
        ),
        centerTitle: true,
        backgroundColor: bMilk,
        elevation: 0.0,
        title: Text(
          AppStrings.equipmentServiced,
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
            equipmentList == null || equipmentList.isEmpty ? Padding(
              padding: const EdgeInsets.only(top: 200.0),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                        child: Text(
                          AppStrings.noEquipmentText,
                          style: AppUtils.adaptableTextStyle(size: 14.0, color: bHintColor, fontWeight: FontWeight.normal),
                          textAlign: TextAlign.center,
                        )
                    )
                  ],
                ),
              ),
            ) :
            ListView.builder(
                shrinkWrap: true,
                itemCount: equipmentList.length,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () async {
                      final result = await Navigator.pushNamed(context, AppRoutes.toBillCategoryScreen, arguments: CategoryScreenArguments(equipmentList[index]));
                      if (result is Equipment) {
                        //Equipment anEquipment =  equipmentList.firstWhere((element) => element.name == result.name);
                        equipmentList.removeWhere((element) => element.name == result.name);
                        equipmentList.add(result);
                        setState(() {

                        });
                      }
                      print("result is ${result.toString()}");
                    },
                    child: Container(
                      height: AppUtils.screenAwareSize(60.0, context),
                      child: Slidable(
                        secondaryActions: [
                          IconSlideAction(
                            caption: '',
                            color: Colors.transparent,
                            iconWidget: Icon(Icons.delete, color: bPink),
                            onTap: () {
                              equipmentList.remove(equipmentList[index]);
                              setState(() {

                              });
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
                                    '${equipmentList[index].name} ${equipmentList[index].capacity}',
                                    style: AppUtils.adaptableTextStyle(size: 13.0, fontWeight: FontWeight.normal, color: bWhite),
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      boxShadow: [BoxShadow(color: bWhite, spreadRadius: AppUtils.screenAwareSize(10.0, context))]
                                  ),
                                  child: Text(
                                    '${getPartsAndServicingCount(equipmentList[index])}',
                                    style: AppUtils.adaptableTextStyle(size: 14.0, fontWeight: FontWeight.normal, color: bPurple),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                }
            ),
            Spacer(),
            Row(
              children: [
                Expanded(
                    child: AppButton(
                      voidCallback: () {
                        print(widget.service);
                        Navigator.pushNamed(context, AppRoutes.toBillPreviewScreen, arguments: PreviewScreenArguments(equipmentList, widget.service, widget.bookingId));
                      },
                      enabledColor: bPurple,
                      enabled: true,
                      buttonText: AppStrings.previewBill,
                    )
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  int getPartsAndServicingCount(Equipment equipment) {
    int count = equipment.servicing.length + equipment.parts.length;
    return count;
  }
}

class EquipmentScreenArgument {
  final String service;
  final String bookingId;

  EquipmentScreenArgument(this.service, this.bookingId);
}
