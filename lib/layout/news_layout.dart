import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/news_cubit.dart';
import 'cubit/news_states.dart';

class NewsLayout extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:(context) => NewsCubit()..getBusiness(),
      child: BlocConsumer<NewsCubit, NewsStates>(
        listener: (context, state){},
        builder: (context, state){
          NewsCubit newsCubit = NewsCubit.get(context);
          return Scaffold(
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

                  },
                ),
                IconButton(
                  icon: Icon(
                    Icons.brightness_4_outlined,
                  ),
                  onPressed: (){

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

      ),
    );
  }
}
