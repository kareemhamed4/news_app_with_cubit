import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/cubit/cubit.dart';
import 'package:news_app/layout/cubit/states.dart';
import 'package:news_app/shared/components/components.dart';

//ignore: must_be_immutable
class SearchScreen extends StatelessWidget {
  SearchScreen({Key? key}) : super(key: key);

  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsAppCubit, NewsAppStates>(
      listener: (context, state) => {},
      builder: (context, state) {
        var list = NewsAppCubit().search;
        return Scaffold(
          appBar: AppBar(),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
              defaultFormField(
              controller:searchController,
              type:TextInputType.text,
              onchange: (value){
                NewsAppCubit.get(context).getSearchNews(searchedValue: value);
              },
              validator:(value){
                if(value!.isEmpty)
                {
                  return 'search must not be empty';
                }
                return null;
              },
              label: 'Search',
              prefix: Icons.search,
            ),
                Expanded(child: buildArticleScreen(list)),
              ],
            ),
          ),
        );
      },
    );
  }
}
