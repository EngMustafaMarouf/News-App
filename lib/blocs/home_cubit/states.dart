abstract class NewsStates{}


class CurrentIndexInitialState extends NewsStates{}

class ChangeCurrentIndexState extends NewsStates{}


class NewsGetBusinessLoadingState extends NewsStates{}



class NewsGetBusinessSuccessState extends NewsStates{
  final List<dynamic> businessList;
  NewsGetBusinessSuccessState(this.businessList);
}


class NewsGetBusinessErrorState extends NewsStates{
  final String error;
  NewsGetBusinessErrorState({this.error = 'null'});
}

///////////////////////////////////////////////////states for sports
class NewsGetSportsLoadingState extends NewsStates{}



class NewsGetSportsSuccessState extends NewsStates{
  final List<dynamic> sportsList;
  NewsGetSportsSuccessState(this.sportsList);
}


class NewsGetSportsErrorState extends NewsStates{
  final String error;
  NewsGetSportsErrorState({this.error = 'null'});
}


///////////////////////////////////////////////////states for Science
class NewsGetScienceLoadingState extends NewsStates{}



class NewsGetScienceSuccessState extends NewsStates{
  final List<dynamic> scienceList;
  NewsGetScienceSuccessState(this.scienceList);
}


class NewsGetScienceErrorState extends NewsStates{
  final String error;
  NewsGetScienceErrorState({this.error = 'null'});
}

///////////////////////////////////////////////////states for Search
class NewsGetSearchLoadingState extends NewsStates{}



class NewsGetSearchSuccessState extends NewsStates{
  final List<dynamic> searchList;
  NewsGetSearchSuccessState(this.searchList);
}


class NewsGetSearchErrorState extends NewsStates{
  final String error;
  NewsGetSearchErrorState({this.error = 'null'});
}





