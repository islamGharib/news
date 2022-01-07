import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/modules/search/search_screen.dart';
import 'package:news_app/shared/component/components.dart';
import 'package:news_app/shared/cubit/app_cubit.dart';
import 'cubit/news_cubit.dart';
import 'cubit/news_states.dart';

class NewsLayout extends StatelessWidget {
  var scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {

    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state){},
      builder: (context, state){
        NewsCubit newsCubit = NewsCubit.get(context);
        AppCubit appCubit = AppCubit.get(context);
        return Scaffold(
          key: scaffoldKey,
          appBar: AppBar(
            title: Text(
              newsCubit.titles[newsCubit.currentIndex],
            ),
            actions: [
              IconButton(
                icon: Icon(
                  Icons.search,
                ),
                onPressed: (){
                  navigateTo(context, SearchScreen());
                },
              ),
              IconButton(
                icon: Icon(
                  Icons.brightness_4_outlined,
                ),
                onPressed: (){
                  appCubit.changeAppMode();
                },
              ),
            ],
          ),
          body: newsCubit.screens[newsCubit.currentIndex],

          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: newsCubit.currentIndex,
            onTap: (index){
              newsCubit.changeIndex(index);
            },
            items: newsCubit.bottomNavItem,
          ),
        );
      },
    );
  }
}
