part of 'details_bloc.dart';

abstract class DetailsState extends Equatable {
  const DetailsState();
}

class DetailsInitial extends DetailsState {
  @override
  List<Object> get props => [];
}

class OnDetailsLoading extends DetailsState {
  @override
  List<Object> get props => [];
}

class OnDetailsSuccess extends DetailsState {
  final String message;

  OnDetailsSuccess(this.message);

  @override
  List<Object> get props => [message];
}

class OnDetailsFailure extends DetailsState {

  final String error;

  OnDetailsFailure(this.error);

  @override
  List<Object> get props => [error];

}
