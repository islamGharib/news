
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'news_states.dart';

class NewsCubit extends Cubit <NewsStates>{
  NewsCubit() : super(NewsInitialState());

  int currentIndex = 0;

  List<String> titles = [
    'Business',
    'Science',
    'Sports',
    //'Settings'
  ];



  List<BottomNavigationBarItem> bottomNavItem = [
    BottomNavigationBarItem(
        icon: Icon(Icons.business),
        label: 'Business'
    ),
    BottomNavigationBarItem(
        icon: Icon(Icons.science),
        label: 'Science'
    ),
    BottomNavigationBarItem(
        icon: Icon(Icons.sports),
        label: 'Sports'
    ),

  ];

  static NewsCubit get(context) => BlocProvider.of(context);

  void changeIndex(int index){
    currentIndex = index;
    emit(AppChangeBottomNavigationState());
  }


}