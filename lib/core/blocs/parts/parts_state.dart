part of 'parts_bloc.dart';

abstract class PartsState extends Equatable {
  const PartsState();
}

class PartsInitial extends PartsState {
  @override
  List<Object> get props => [];
}

class OnPartsLoading extends PartsState {
  @override
  List<Object> get props => [];
}

class OnPartSuccess extends PartsState {

  final List<PartService> partService;

  OnPartSuccess(this.partService);

  @override
  List<Object> get props => [partService];

}

class OnPartFailure extends PartsState {

  final String error;

  OnPartFailure(this.error);

  @override
  List<Object> get props => [error];

}
