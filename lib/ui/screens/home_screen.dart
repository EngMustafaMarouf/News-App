import 'dart:ui';

import 'package:c_news_app/Network/dio_helper.dart';
import 'package:c_news_app/blocs/app_cubit/cubit.dart';
import 'package:c_news_app/blocs/home_cubit/cubit.dart';
import 'package:c_news_app/blocs/home_cubit/states.dart';
import 'package:c_news_app/shared/components/components.dart';
import 'package:c_news_app/ui/screens/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
        listener: (context,state){},
        builder: (context,state){
          var cubit = NewsCubit.get(context);
          var cubit2 = AppCubit.get(context);
          return Directionality(
            textDirection: TextDirection.rtl,
            child: Scaffold(
                  appBar: AppBar(
                    title: Text("${cubit.pages[cubit.currentIndex]['title']}"),
                    actions: [
                      IconButton(onPressed: (){
                        navigateTo(context,SearchScreen());
                      }, icon: const Icon(Icons.search,color: Colors.grey,)),
                      IconButton(onPressed:(){
                        cubit2.changeTheme();
                        cubit2.setThemeMode(cubit2.themeMode);

                      }, icon: const Icon(Icons.brightness_4_outlined,color: Colors.grey))
                    ],
                  ),
                  body:  cubit.pages[cubit.currentIndex]['page'],
                  bottomNavigationBar: BottomNavigationBar(
                    currentIndex: cubit.currentIndex,
                    onTap: cubit.changeCurrentIndex,
                    items: const [
                      BottomNavigationBarItem(icon: Icon(Icons.work),label: "Business"),
                      BottomNavigationBarItem(icon: Icon(Icons.sports),label: "Sports"),
                      BottomNavigationBarItem(icon: Icon(Icons.science),label: "Science"),
                     // BottomNavigationBarItem(icon: Icon(Icons.settings),label: "Settings"),
                    ],
                  ),
                ),
          );
        },
      );
  }

}