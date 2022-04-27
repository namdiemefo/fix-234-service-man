part of 'profile_bloc.dart';

abstract class ProfileState extends Equatable {
  const ProfileState();
}

class ProfileInitial extends ProfileState {
  @override
  List<Object> get props => [];
}

class ProfilePickImageState extends ProfileState {
  final image;
  ProfilePickImageState(this.image);

  @override
  List<Object> get props => [image];
}

class ProfileUploadState extends ProfileState {
  ProfileUploadState();

  @override
  List<Object> get props => [];
}

class ProfileUploadSuccessState extends ProfileState {
  final String image;
  ProfileUploadSuccessState(this.image);

  @override
  List<Object> get props => [image];
}

class ProfileUploadFailureState extends ProfileState {
  final String error;
  ProfileUploadFailureState(this.error);

  @override
  List<Object> get props => [error];
}

class ProfileFailureState extends ProfileState {
  ProfileFailureState();

  @override
  List<Object> get props => [];
}