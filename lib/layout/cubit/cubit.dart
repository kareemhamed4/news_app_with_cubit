import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/cubit/states.dart';
import 'package:news_app/modules/business_screen/business_screen.dart';
import 'package:news_app/modules/science_screen/science_screen.dart';
import 'package:news_app/modules/sports_screen/sports_screen.dart';
import 'package:news_app/network/remote/dio_helper.dart';

class NewsAppCubit extends Cubit<NewsAppStates> {
  NewsAppCubit() : super(NewsAppInitialState());

  static NewsAppCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  List<Widget> screens = [
    const BusinessScreen(),
    const SportsScreen(),
    const ScienceScreen(),
  ];

  void changeBottomNavIndex(index) {
    if (index == 0) {
      getNews(category: "business");
      emit(NewsAppGetBusinessState());
    }
    if (index == 1) {
      getNews(category: "sports");
      emit(NewsAppGetSportsState());
    }
    if (index == 2) {
      getNews(category: "science");
      emit(NewsAppGetScienceState());
    }
    currentIndex = index;
    emit(NewsAppBottomNavState());
  }

  /*
  List<dynamic> business = [];

  void getBusinessNews() {
    emit(NewsAppGetBusinessLoadingState());
    DioHelper.getData(
        url: "v2/top-headlines",
        query: {
          "country": "eg",
          "category": "business",
          "apiKey": "14dfb8aa09f04636befb50537e8312e5",
    }).then((value) {
      business = value.data["articles"];
      emit(NewsAppGetBusinessState());
    }).catchError((error) {
      if (kDebugMode) {
        print(error.toString());
      }
      emit(NewsAppGetBusinessErrorState(error));
    });
  }

  List<dynamic> sports = [];

  void getSportsNews() {
    emit(NewsAppGetSportsLoadingState());
    DioHelper.getData(
        url: "v2/top-headlines",
        query: {
          "country": "eg",
          "category": "sports",
          "apiKey": "14dfb8aa09f04636befb50537e8312e5",
    }).then((value) {
      sports = value.data["articles"];
      emit(NewsAppGetSportsState());
    }).catchError((error) {
      if (kDebugMode) {
        print(error.toString());
      }
      emit(NewsAppGetSportsErrorState(error));
    });
  }

  List<dynamic> science = [];

  void getScienceNews() {
    emit(NewsAppGetScienceLoadingState());
    DioHelper.getData(
        url: "v2/top-headlines",
        query: {
          "country": "eg",
          "category": "science",
          "apiKey": "14dfb8aa09f04636befb50537e8312e5",
    }).then((value) {
      science = value.data["articles"];
      emit(NewsAppGetScienceState());
    }).catchError((error) {
      if (kDebugMode) {
        print(error.toString());
      }
      emit(NewsAppGetScienceErrorState(error));
    });
  }

 */

  List<dynamic> business = [];
  List<dynamic> sports = [];
  List<dynamic> science = [];

  void getNews({required String category}) {
    if (business.isEmpty || sports.isEmpty || science.isEmpty) {
      DioHelper.getData(url: "v2/top-headlines", query: {
        "country": "eg",
        "category": category,
        "apiKey": "14dfb8aa09f04636befb50537e8312e5",
      }).then((value) {
        if (category == "business") {
          business = value.data["articles"];
          emit(NewsAppGetBusinessState());
        } else if (category == "sports") {
          sports = value.data["articles"];
          emit(NewsAppGetSportsState());
        } else {
          science = value.data["articles"];
          emit(NewsAppGetScienceState());
        }
      }).catchError((error) {
        if (category == "business") {
          emit(NewsAppGetBusinessErrorState(error));
        } else if (category == "sports") {
          emit(NewsAppGetSportsErrorState(error));
        } else {
          emit(NewsAppGetScienceErrorState(error));
        }
      });
    }
  }

  bool isDark = false;

  void changeAppMode() {
    isDark = !isDark;
    emit(ChangeAppModeState());
  }

  List<dynamic> search = [];

  void getSearchNews({
    required String searchedValue,
  }) {
    emit(NewsAppGetSearchLoadingState());
    DioHelper.getData(url: "v2/everything", query: {
      "q": searchedValue,
      "apiKey": "14dfb8aa09f04636befb50537e8312e5",
    }).then((value) {
      search = value.data["articles"];
      emit(NewsAppGetSearchState());
    }).catchError((error) {
      if (kDebugMode) {
        print(error.toString());
      }
      emit(NewsAppGetSearchErrorState(error.toString()));
    });
  }

   nullImage({
    required String imageUrl,
  }) {
    if (imageUrl.isEmpty) {
      imageUrl =
      "https://fisnikde.com/wp-content/uploads/2019/01/broken-image.png";
    }
  }
}
