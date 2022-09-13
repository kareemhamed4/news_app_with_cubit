abstract class NewsAppStates {}

class NewsAppInitialState extends NewsAppStates {}
class NewsAppBottomNavState extends NewsAppStates {}

class NewsAppGetBusinessLoadingState extends NewsAppStates {}
class NewsAppGetSportsLoadingState extends NewsAppStates {}
class NewsAppGetScienceLoadingState extends NewsAppStates {}
class NewsAppGetSettingLoadingState extends NewsAppStates {}
class NewsAppGetSearchLoadingState extends NewsAppStates {}

class NewsAppGetBusinessState extends NewsAppStates {}
class NewsAppGetBusinessErrorState extends NewsAppStates {
  final String error;

  NewsAppGetBusinessErrorState(this.error);
}

class NewsAppGetSportsState extends NewsAppStates {}
class NewsAppGetSportsErrorState extends NewsAppStates {
  final String error;

  NewsAppGetSportsErrorState(this.error);
}

class NewsAppGetScienceState extends NewsAppStates {}
class NewsAppGetScienceErrorState extends NewsAppStates {
  final String error;

  NewsAppGetScienceErrorState(this.error);
}

class NewsAppGetSettingState extends NewsAppStates {}
class NewsAppGetSettingErrorState extends NewsAppStates {
  final String error;

  NewsAppGetSettingErrorState(this.error);
}

class NewsAppGetSearchState extends NewsAppStates {}
class NewsAppGetSearchErrorState extends NewsAppStates {
  final String error;

  NewsAppGetSearchErrorState(this.error);
}

class ChangeAppModeState extends NewsAppStates {}