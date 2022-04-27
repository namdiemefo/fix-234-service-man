import 'dart:async';

import 'package:bloc/bloc.dart';
import 'dart:io';
import 'package:equatable/equatable.dart';
import 'package:service_man/api/repository/profile/profile_repository.dart';
import 'package:service_man/db/app_storage.dart';
import 'package:service_man/helpers/di/service_locator.dart';
import 'package:tuple/tuple.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileInitial());

  final AppStorage _appStorage = locator<AppStorage>();
  final ProfileRepository _repository = locator<ProfileRepository>();

  @override
  Stream<ProfileState> mapEventToState(ProfileEvent event) async* {
    if (event is PickImageEvent) {
      yield* _pickImage(event);
    } else if (event is UploadImageEvent) {
      yield* _uploadImage(event);
    }
    // else if (event is RetrieveImageEvent) {
    //   yield* _retrieveImage(event);
    // }
  }

  Stream<ProfileState> _pickImage(PickImageEvent event) async* {
    String bearerToken = await _appStorage.getToken(TokenType.ACCESS);
    String token = 'Bearer $bearerToken';
    var image = event.file;
    yield ProfileUploadState();
    var img = File(image.path);
    Tuple2<String, String> response = await _repository.uploadImage(token: token, file: img);
    if (response.item1 is String) {
      yield ProfileUploadSuccessState(response.item1);
    } else if (response.item2 is String) {
      yield ProfileUploadFailureState(response.item2);
    }
  }

  Stream<ProfileState> _uploadImage(UploadImageEvent event) async* {
    String bearerToken = await _appStorage.getToken(TokenType.ACCESS);
    String token = 'Bearer $bearerToken';
    var image = event.file;
    yield ProfileUploadState();
    var img = File(image.path);
    var response = await _repository.uploadImage(token: token, file: img);
    if (response.item1 is String) {
      yield ProfileUploadSuccessState(response.item1);
    } else if (response.item2 is String) {
      yield ProfileUploadFailureState(response.item2);
    }
  }

  // Stream<ProfileState> _retrieveImage(RetrieveImageEvent event) async* {
  //   var response = await repository.retrievePic();
  //   if (response is ImageResponse) {
  //     yield ProfileUploadSuccessState(response.data);
  //   } else {
  //     yield ProfileFailureState();
  //   }
  //
  // }
}
