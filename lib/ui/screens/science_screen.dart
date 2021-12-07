import 'package:c_news_app/blocs/home_cubit/cubit.dart';
import 'package:c_news_app/blocs/home_cubit/states.dart';
import 'package:c_news_app/ui/widgets/article_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ScienceScreen extends StatelessWidget {
  ScienceScreen({Key? key}) : super(key: key);

  List<dynamic> scienceList = [];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is NewsGetScienceSuccessState) {
          scienceList = state.scienceList;
        }
       if(scienceList.isEmpty){
         return const Center(child: CircularProgressIndicator(),);
       }else{
         return RefreshIndicator(
           onRefresh:() async => NewsCubit.get(context).getScienceData(),
           child: ListView.separated(
             itemBuilder: (context, index) {
               return ArticleItem(scienceList[index]);
             },
             separatorBuilder: (context, index) => const Divider(
               thickness: 2,
             ),
             itemCount: 5,
             physics: const BouncingScrollPhysics(),
           ),
         );
       }
      },
    );
  }
}
