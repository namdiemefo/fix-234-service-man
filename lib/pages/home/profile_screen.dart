import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:service_man/helpers/assets/colors.dart';
import 'package:service_man/helpers/assets/images.dart';
import 'package:service_man/helpers/reusable_screens/app_button.dart';
import 'package:service_man/helpers/utils/app_utils.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  TextEditingController nameController = TextEditingController();
  TextEditingController idController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: bMilk,
        elevation: 0.0,
        title: Text(
          'Profile',
          style: AppUtils.adaptableTextStyle(size: 14.0, fontWeight: FontWeight.bold, color: bBlack),
        ),
      ),
      backgroundColor: bMilk,
      body: Padding(
        padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 25.0, bottom: 20.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 50.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 70.0),
                  child: SvgPicture.asset(Images.camera, height: 15.0, width: 15.0,),
                )
              ],
            ),
            AppUtils.verticalSpacing(height: 50.0),
            Row(
              children: [
                Expanded(
                    child: TextFormField(
                        controller: nameController,
                        decoration: InputDecoration(
                          labelText: 'Full Name',
                          labelStyle: AppUtils.adaptableTextStyle(size: 10.0, color: bFadedGrey, fontWeight: FontWeight.w400),
                        )
                    )
                )
              ],
            ),
            AppUtils.verticalSpacing(height: 10.0),
            Row(
              children: [
                Expanded(
                    child: TextFormField(
                        controller: idController,
                        decoration: InputDecoration(
                          labelText: 'ID',
                          labelStyle: AppUtils.adaptableTextStyle(size: 10.0, color: bFadedGrey, fontWeight: FontWeight.w400),
                        )
                    )
                )
              ],
            ),
            AppUtils.verticalSpacing(height: 10.0),
            Row(
              children: [
                Expanded(
                    child: TextFormField(
                        controller: phoneController,
                        decoration: InputDecoration(
                          labelText: 'Phone Number',
                          labelStyle: AppUtils.adaptableTextStyle(size: 10.0, color: bFadedGrey, fontWeight: FontWeight.w400),
                        )
                    )
                )
              ],
            ),
            Spacer(),
            Row(
              children: [
                Expanded(
                    child: AppButton(
                      buttonText: 'Log out',
                      height: 55.0,
                      enabledColor: bWhite,
                      enabled: true,
                      textColor: bFadedGrey,
                      voidCallback: () {

                      },
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
