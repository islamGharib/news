import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app_states.dart';

class AppCubit extends Cubit <AppStates> {
  AppCubit() : super(AppInitialState());
  static AppCubit get(context) => BlocProvider.of(context);

  bool isDark = false;
  void changeAppMode({ fromShared }){
    if(fromShared != null){
      isDark = fromShared;
      emit(AppChangeModeState());
    }
    else{
      isDark = !isDark;
      print(isDark);
      emit(AppChangeModeState());
    }
  }


}


