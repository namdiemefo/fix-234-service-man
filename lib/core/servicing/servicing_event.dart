part of 'servicing_bloc.dart';

abstract class ServicingEvent extends Equatable {
  const ServicingEvent();
}

class FetchServicing extends ServicingEvent {

  final String search;

  FetchServicing(this.search);

  @override
  List<Object> get props => [search];

}
