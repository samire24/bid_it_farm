import 'package:bid_it_farm/models/data_model.dart';
import 'package:bid_it_farm/services/data_services.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'app_cubit_state.dart';

class AppCubit extends Cubit<CubitState> {
  AppCubit({required this.data}) : super(InitialState()){
    emit(WelcomeState());
  }
  final DataServices data;
  late final places;
  void getData() async {
    try {
      emit(LoadingState());
      places = await data.getInfo();
      emit(LoadedState(places));
    }catch(e){

    }
  }
  detailPage(DataModel data){
    emit(DetailState(data));
  }
  goHome(){
    emit(LoadedState(places));
  }

}
