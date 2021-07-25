import 'package:flutter/material.dart';
import 'package:service_man/helpers/assets/colors.dart';
import 'package:service_man/helpers/assets/images.dart';
import 'package:service_man/helpers/assets/strings.dart';
import 'package:service_man/helpers/reusable_screens/shadow_icon.dart';
import 'package:service_man/helpers/utils/app_utils.dart';

class HistoryScreen extends StatefulWidget {
  @override
  _HistoryScreenState createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
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
      body: Padding(
        padding: EdgeInsets.all(24.0),
        child: ListView.builder(
            itemCount: 5,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: ListTile(
                  tileColor: bWhite,
                  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 26.0),
                  leading: Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: AdaptableShadowIcon(
                      iconUrl: Images.gen,
                      imageHeight: 15.0,
                      imageWidth: 20.0,
                      radius: 20.0,
                      boxShadow: bMilk,
                    ),
                  ),
                  title: Text(
                    'Generator Service',
                    style: AppUtils.adaptableTextStyle(size: 16.0, fontWeight: FontWeight.bold, color: bBlack),
                  ),
                  subtitle: Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      'Order ID: 23451',
                      style: AppUtils.adaptableTextStyle(size: 14.0, fontWeight: FontWeight.w400, color: bBlack),
                    ),
                  ),
                  trailing: Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [BoxShadow(color: bCheckedColor, spreadRadius: 8.0)]
                    ),
                    child: Icon(Icons.check, size: 10.0, color: bWhite),
                  ),
                ),
              );
            }
        ),
      ),
    );
  }
}
