
import 'package:bloc/bloc.dart';
import 'package:c_news_app/blocs/app_cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppCubit extends Cubit<AppStates>{

  AppCubit():super(AppInitialMode());

  static AppCubit get(context)=> BlocProvider.of(context);

  ThemeMode themeMode = ThemeMode.light;


  void changeTheme(){
    themeMode = themeMode == ThemeMode.dark?ThemeMode.light:ThemeMode.dark;
    emit(ChangeThemeMode());
  }

  void setThemeMode(theme) async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString('theme', '$themeMode');
    emit(AppSetThemeMode());
  }

  void getThemeMode() async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String res = preferences.getString('theme')??"null";
    if(res == 'ThemeMode.light' || res == 'null'){
     themeMode = ThemeMode.light;
    }else{
      themeMode = ThemeMode.dark;
    }
    emit(AppGetThemeMode());
  }



}