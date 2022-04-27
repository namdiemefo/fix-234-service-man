part of 'profile_bloc.dart';

abstract class ProfileEvent extends Equatable {
  const ProfileEvent();
}

class PickImageEvent extends ProfileEvent {
  final File file;
  PickImageEvent(this.file);

  @override
  List<Object> get props => [file];
}

class UploadImageEvent extends ProfileEvent {
  final File file;
  UploadImageEvent(this.file);

  @override
  List<Object> get props => [file];
}


