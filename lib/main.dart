import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:c_news_app/Network/dio_helper.dart';
import 'package:c_news_app/blocs/app_cubit/states.dart';
import 'package:c_news_app/blocs/home_cubit/cubit.dart';
import 'package:c_news_app/blocs/home_cubit/states.dart';
import 'package:c_news_app/servieces/theme_servieces.dart';
import 'package:c_news_app/shared/bloc_observer.dart';
import 'package:c_news_app/ui/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Network/dio_helper.dart';
import 'blocs/app_cubit/cubit.dart';
class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}


void main() {

  HttpOverrides.global = MyHttpOverrides();

   BlocOverrides.runZoned(() {   // to observe all cubits
   DioHelper.init();  // initiate Dio

    runApp(const MyApp());
  },
  blocObserver: MyBlocObserver(),
  );

}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=> AppCubit()..getThemeMode(),),
        BlocProvider(create: (context)=> NewsCubit()..getBusinessData(),),
      ],
      child: BlocConsumer<AppCubit,AppStates>(
        listener: (context,state){},
        builder: (context,state){

          var cubit = AppCubit.get(context);
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            themeMode: cubit.themeMode,
            theme: ThemeServices.lightTheme(context),
            darkTheme: ThemeServices.darkTheme(context),
            home: const MyHomePage(),
          );
        },
      ),
    );
  }
}


