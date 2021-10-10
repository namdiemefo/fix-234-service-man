part of 'preview_bloc.dart';

abstract class PreviewEvent extends Equatable {
  const PreviewEvent();
}

class CreateBill extends PreviewEvent {

  final CreateBillModel createBillModel;

  CreateBill(this.createBillModel);

  @override
  List<Object> get props => [];

}
