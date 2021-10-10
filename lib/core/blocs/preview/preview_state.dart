part of 'preview_bloc.dart';

abstract class PreviewState extends Equatable {
  const PreviewState();
}

class PreviewInitial extends PreviewState {
  @override
  List<Object> get props => [];
}

class OnCreateBillLoading extends PreviewState {
  @override
  List<Object> get props => [];

}

class OnCreateBillSuccess extends PreviewState {
  @override
  List<Object> get props => [];

}

class OnCreateBillFailure extends PreviewState {

  final String error;

  OnCreateBillFailure(this.error);

  @override
  List<Object> get props => [error];

}
