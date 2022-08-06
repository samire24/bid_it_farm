part of 'app_cubit.dart';

abstract class CubitState extends Equatable {
  const CubitState();
}

class InitialState extends CubitState {
  @override
  List<Object> get props => [];
}
class WelcomeState extends CubitState {
  @override
  List<Object> get props => [];
}
class LoadingState extends CubitState {
  @override
  List<Object> get props => [];
}
class LoadedState extends CubitState {
  LoadedState(this.places);
  final List<DataModel> places;
  @override
  List<Object> get props => [places];
}
class DetailState extends CubitState {
  DetailState(this.place);
  //because we are passing only one item, we dont need to wrap Datamodel around list
  final DataModel place;
  @override
  List<Object> get props => [place];
}

