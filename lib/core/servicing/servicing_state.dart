part of 'servicing_bloc.dart';

abstract class ServicingState extends Equatable {
  const ServicingState();
}

class ServicingInitial extends ServicingState {
  @override
  List<Object> get props => [];
}

class OnServicingLoading extends ServicingState {
  @override
  List<Object> get props => [];
}

class OnServicingSuccess extends ServicingState {

  final List<PartService> partService;

  OnServicingSuccess(this.partService);

  @override
  List<Object> get props => [partService];

}

class OnServicingFailure extends ServicingState {

  final String error;

  OnServicingFailure(this.error);

  @override
  List<Object> get props => [error];

}
