import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/cubit/cubit.dart';
import 'package:news_app/layout/cubit/states.dart';
import 'package:news_app/modules/search/search_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return BlocConsumer<NewsAppCubit, NewsAppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          NewsAppCubit cubit = BlocProvider.of(context);
          return Scaffold(
            appBar: AppBar(
              title: Text(
                "News App",
                style: Theme.of(context).textTheme.headline6,
              ),
              titleSpacing: 20,
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: IconButton(
                      icon: const Icon(
                        Icons.search_outlined,
                      ),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => SearchScreen()));
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: IconButton(
                      icon: const Icon(
                        Icons.brightness_4_outlined,
                      ),
                      onPressed: () {
                        cubit.changeAppMode();
                      }),
                ),
              ],
            ),
            body: cubit.screens[cubit.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: cubit.currentIndex,
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.business),label: "Business"),
                BottomNavigationBarItem(icon: Icon(Icons.sports_handball_outlined),label: "Sports"),
                BottomNavigationBarItem(icon: Icon(Icons.science_outlined),label: "Science"),
              ],
              onTap: (index){
                cubit.changeBottomNavIndex(index);
              },
            ),
          );
        });
  }
}
