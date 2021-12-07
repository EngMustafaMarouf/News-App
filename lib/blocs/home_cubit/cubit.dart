
import 'package:bloc/bloc.dart';
import 'package:c_news_app/Network/dio_helper.dart';
import 'package:c_news_app/blocs/home_cubit/states.dart';
import 'package:c_news_app/ui/screens/bussiness_screen.dart';
import 'package:c_news_app/ui/screens/home_screen.dart';
import 'package:c_news_app/ui/screens/science_screen.dart';
import 'package:c_news_app/ui/screens/settings_screen.dart';
import 'package:c_news_app/ui/screens/sports_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsCubit extends Cubit<NewsStates>{

  int currentIndex = 0;

  NewsCubit():super(CurrentIndexInitialState()); //calling super to init

  static NewsCubit get(BuildContext ctx)=> BlocProvider.of(ctx);   // to return an object from this cubit  to be easily

  List<Map<String,dynamic>> pages = [
    {
      'title':"Business News",
      'page':BussinessScreen(),
    },
    {
      'title':"Sports News",
      'page':SportsScreen(),
    },
    {
      'title':"Science News",
      'page':ScienceScreen(),
    },
    // {
    //   'title':"Settings",
    //   'page':const SettingsScreen(),
    // },
  ];


  void changeCurrentIndex(int newVal){
    currentIndex = newVal;
    if(currentIndex == 1){
      getSportsData();
    }else if(currentIndex == 2){
      getScienceData();
    }
    emit(ChangeCurrentIndexState());
  }







  List<dynamic> business = [];
  //get business data
  void getBusinessData(){
    emit(NewsGetBusinessLoadingState());  // to load
    if(business.isEmpty){
      DioHelper.getData(path: 'v2/top-headlines', query: {
        'country':'eg',
        'category':'business',
        'apiKey':'bf2a0c8166cc46efa3b7b0ca4c696bdf',
      }).then((value){
        //print(value.data.toString());
        // print(value.data['totalResults']);
        // print(value.data['articles'][0]['title']);

        business = value.data['articles'];

        print(business[4]['urlToImage']);
        emit(NewsGetBusinessSuccessState(business));

      }).catchError((error){
        print(error.toString());

        emit(NewsGetBusinessErrorState(error: error.toString()));
      });
    }else{
      emit(NewsGetBusinessErrorState());
    }
  }



  List<dynamic> sports = [];
  //get sports data
  void getSportsData(){
    emit(NewsGetSportsLoadingState());  // to load
    if(sports.isEmpty){
      DioHelper.getData(path: 'v2/top-headlines', query: {
        'country':'eg',
        'category':'sports',
        'apiKey':'bf2a0c8166cc46efa3b7b0ca4c696bdf',
      }).then((value){
        //print(value.data.toString());
        // print(value.data['totalResults']);
        // print(value.data['articles'][0]['title']);

        sports = value.data['articles'];

        //print(sports);
        emit(NewsGetSportsSuccessState(sports));

      }).catchError((error){
        print(error.toString());

        emit(NewsGetSportsErrorState(error: error.toString()));
      });
    }else{
      emit(NewsGetSportsErrorState());
    }
  }


  List<dynamic> science = [];
  //get science data
  void getScienceData(){
    emit(NewsGetScienceLoadingState());  // to load
    if(science.isEmpty){
      DioHelper.getData(path: 'v2/top-headlines', query: {
        'country':'eg',
        'category':'science',
        'apiKey':'bf2a0c8166cc46efa3b7b0ca4c696bdf',
      }).then((value){
        //print(value.data.toString());
        // print(value.data['totalResults']);
        // print(value.data['articles'][0]['title']);

        science = value.data['articles'];

        //print(sports);
        emit(NewsGetScienceSuccessState(science));

      }).catchError((error){
        print(error.toString());

        emit(NewsGetScienceErrorState(error: error.toString()));
      });
    }else{
      emit(NewsGetScienceErrorState());
    }

  }



  List<dynamic> search = [];
  //get science data
  void getSearch(String value){
    emit(NewsGetSearchLoadingState());  // to load

    DioHelper.getData(path: 'v2/everything', query: {
      'q':value,
      'apiKey':'bf2a0c8166cc46efa3b7b0ca4c696bdf',
    }).then((value){
      //print(value.data.toString());
      // print(value.data['totalResults']);
      // print(value.data['articles'][0]['title']);

      search = value.data['articles'];

      //print(sports);
      emit(NewsGetSearchSuccessState(search));

    }).catchError((error){
      print(error.toString());

      emit(NewsGetSearchErrorState(error: error.toString()));
    });


  }






}