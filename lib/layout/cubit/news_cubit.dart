
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/modules/business/business_screen.dart';
import 'package:news_app/modules/science/science_screen.dart';
import 'package:news_app/modules/sports/sports_screen.dart';

import 'news_states.dart';

class NewsCubit extends Cubit <NewsStates>{
  NewsCubit() : super(NewsInitialState());
  static NewsCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<String> titles = [
    'Business',
    'Science',
    'Sports',
  ];

  List<Widget> screens = [
    Business(),
    Science(),
    Sports(),
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


  void changeIndex(int index){
    currentIndex = index;
    emit(AppChangeBottomNavigationState());
  }


}