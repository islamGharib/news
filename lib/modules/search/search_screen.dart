
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/cubit/news_cubit.dart';
import 'package:news_app/layout/cubit/news_states.dart';
import 'package:news_app/shared/component/components.dart';

class SearchScreen extends StatelessWidget {
  var searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state){},
      builder: (context, state){
        var list = NewsCubit.get(context).search;
        return Scaffold(
          appBar: AppBar(),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: defaultTextFormField(
                    controller: searchController,
                    type: TextInputType.text,
                    onChange: (value){
                      NewsCubit.get(context).getSearch(value);
                    },
                    validate: (String? value){
                      if(value!.isEmpty){
                        return 'Search must not be empty';
                      }
                      return null;
                    },
                    label: 'Search',
                    prefix: Icons.search,
                ),
              ),
              Expanded(
                child: articleBuilder(list, isSearch: true),
              ),
            ],
          ),
        );
      },
    );
  }
}
