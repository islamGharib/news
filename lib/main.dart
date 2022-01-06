import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:news_app/shared/bloc_provider.dart';
import 'package:news_app/shared/network/remote/dio_helper.dart';

import 'layout/news_layout.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NewsLayout(),
    );
  }
}

