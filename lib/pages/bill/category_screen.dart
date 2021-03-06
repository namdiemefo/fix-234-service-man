import 'package:flutter/material.dart';
import 'package:service_man/api/models/bill/create_bill_model.dart';
import 'package:service_man/helpers/assets/colors.dart';
import 'package:service_man/helpers/assets/routes.dart';
import 'package:service_man/helpers/assets/strings.dart';
import 'package:service_man/helpers/utils/app_utils.dart';
import 'package:service_man/pages/bill/parts_screen.dart';
import 'package:service_man/pages/bill/servicing_screen.dart';

class CategoryScreen extends StatefulWidget {
  final Equipment equipment;

  const CategoryScreen({Key key, this.equipment}) : super(key: key);
  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {

  var result;

  @override
  void initState() {
    result = widget.equipment;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
            color: bDark
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context, result);
          },
          icon: Icon(Icons.arrow_back, color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: bMilk,
        elevation: 0.0,
        title: Text(
          AppStrings.billCategory,
          style: AppUtils.adaptableTextStyle(size: 14.0, fontWeight: FontWeight.bold, color: bBlack),
        ),
      ),
      backgroundColor: bMilk,
      body: Padding(
        padding: EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: () async {
               result = await Navigator.pushNamed(context, AppRoutes.toBillPartsScreen, arguments: PartsScreenArguments(widget.equipment));
              },
              child: Row(
                children: [
                  Expanded(
                      child: Container(
                        height: AppUtils.screenAwareSize(75.0, context),
                        decoration: BoxDecoration(
                          color: bPurple,
                          borderRadius: BorderRadius.all(Radius.circular(5.0))
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                AppStrings.parts,
                                style: AppUtils.adaptableTextStyle(size: 20.0, fontWeight: FontWeight.normal, color: bWhite),
                              ),
                              Icon(Icons.arrow_forward, color: bWhite)
                            ],
                          ),
                        )
                      )
                  )
                ],
              ),
            ),

            AppUtils.verticalSpacing(height: AppUtils.screenAwareSize(20.0, context)),

            InkWell(
              onTap: () {
                Navigator.pushNamed(context, AppRoutes.toBillServiceScreen, arguments: ServiceScreenArguments(widget.equipment));
              },
              child: Row(
                children: [
                  Expanded(
                      child: Container(
                          height: AppUtils.screenAwareSize(75.0, context),
                          decoration: BoxDecoration(
                              color: bYellow,
                              borderRadius: BorderRadius.all(Radius.circular(5.0))
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  AppStrings.serviceCharge,
                                  style: AppUtils.adaptableTextStyle(size: 20.0, fontWeight: FontWeight.normal, color: bWhite),
                                ),
                                Icon(Icons.arrow_forward, color: bWhite)
                              ],
                            ),
                          )
                      )
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CategoryScreenArguments {
  final Equipment equipment;

  CategoryScreenArguments(this.equipment);
}
