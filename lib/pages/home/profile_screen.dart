import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:service_man/api/models/auth/response/login_response_model.dart';
import 'package:service_man/core/blocs/profile/profile_bloc.dart';
import 'package:service_man/db/app_storage.dart';
import 'package:service_man/helpers/assets/colors.dart';
import 'package:service_man/helpers/assets/images.dart';
import 'package:service_man/helpers/assets/routes.dart';
import 'package:service_man/helpers/assets/strings.dart';
import 'package:service_man/helpers/di/service_locator.dart';
import 'package:service_man/helpers/reusable_screens/app_button.dart';
import 'package:service_man/helpers/utils/app_utils.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  final AppStorage _appStorage = locator<AppStorage>();

  TextEditingController nameController = TextEditingController();
  TextEditingController idController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  String imageUrl = '';
  ImagePicker picker;
  String user, staffId, phone, image;

  @override
  void initState() {
    getUser();
    super.initState();
  }

  void getUser() async {
    LoginResponseModel loginResponseModel = await _appStorage.getUser();
    user = loginResponseModel.fullName;
    staffId = loginResponseModel.staffId;
    phone = loginResponseModel.phone;
    image = loginResponseModel.image;

    phoneController.text = phone;
    idController.text = staffId;
    nameController.text = user;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: bMilk,
        elevation: 0.0,
        title: Text(
          AppStrings.profile,
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
                  backgroundImage: image == null || image.isEmpty ? AssetImage(Images.place_holder) : NetworkImage(image),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 70.0),
                  child: InkWell(
                      onTap: () {
                        _showPicker(context);
                      },
                      child: Image.asset(Images.camera, height: 15.0, width: 15.0)
                  ),
                )
              ],
            ),
            AppUtils.verticalSpacing(height: 50.0),
            Row(
              children: [
                Expanded(
                    child: TextFormField(
                        style: AppUtils.adaptableTextStyle(size: 10.0, color: bBlack, fontWeight: FontWeight.w400),
                        controller: nameController,
                        enabled: false,
                        decoration: InputDecoration(
                          labelText: AppStrings.fullName,
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
                        style: AppUtils.adaptableTextStyle(size: 10.0, color: bBlack, fontWeight: FontWeight.w400),
                        controller: idController,
                        decoration: InputDecoration(
                          labelText: AppStrings.id,
                          enabled: false,
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
                        style: AppUtils.adaptableTextStyle(size: 10.0, color: bBlack, fontWeight: FontWeight.w400),
                        controller: phoneController,
                        decoration: InputDecoration(
                          labelText: AppStrings.phoneNumber,
                          enabled: false,
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
                      buttonText: AppStrings.logOut,
                      height: 55.0,
                      enabledColor: bWhite,
                      enabled: true,
                      textColor: bFadedGrey,
                      voidCallback: () async {
                       await _appStorage.clear();
                       Navigator.pushNamedAndRemoveUntil(context, AppRoutes.toLoginScreen, (route) => false);
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

  void _showPicker(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext btc) {
          return SafeArea(
              child: Wrap(
                children: [
                  ListTile(
                    leading: Icon(Icons.photo_library),
                    title: Text('Photo Library'),
                    onTap: () async  {
                      // PermissionStatus permissionStatus =
                      //     await Permission.camera.request();
                      _imgFromLibrary(context);
                      Navigator.of(context).pop();
                    },
                  ),

                  ListTile(
                    leading: Icon(Icons.photo_camera),
                    title: Text('Camera'),
                    onTap: () {
                      _imgFromCamera(context);
                    },
                  )
                ],
              )
          );
        }
    );
  }

  Future<void> _imgFromLibrary(BuildContext context) async {
    File _image = await ImagePicker.pickImage(source: ImageSource.gallery, imageQuality: 50);
    if (_image != null) {
      BlocProvider.of<ProfileBloc>(context).add(PickImageEvent(_image));
    }

    //_image = File(image.path);
  }

  Future<void> _imgFromCamera(BuildContext context) async {
    File _image = await ImagePicker.pickImage(source: ImageSource.camera, imageQuality: 50);
    if (_image != null) {
      BlocProvider.of<ProfileBloc>(context).add(PickImageEvent(_image));
    }
  }
}
