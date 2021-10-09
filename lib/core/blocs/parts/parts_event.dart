part of 'parts_bloc.dart';

abstract class PartsEvent extends Equatable {
  const PartsEvent();
}

class FetchParts extends PartsEvent {

  final String search;

  FetchParts(this.search);

  @override
  List<Object> get props => [search];

}
