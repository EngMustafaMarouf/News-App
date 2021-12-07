import 'package:c_news_app/blocs/home_cubit/cubit.dart';
import 'package:c_news_app/blocs/home_cubit/states.dart';
import 'package:c_news_app/ui/widgets/article_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class SportsScreen extends StatelessWidget {
  SportsScreen({Key? key}) : super(key: key);

  List<dynamic> sportList = [];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
     listener: (context,state){},
      builder: (context,state){
       if(state is NewsGetSportsSuccessState){
         sportList = state.sportsList;
       }

       if(sportList.isEmpty){
         return const Center(child: CircularProgressIndicator());
       }else{
         return RefreshIndicator(
           onRefresh:() async => NewsCubit.get(context).getSportsData(),
           child: ListView.separated(itemBuilder: (ctx,index){

             return ArticleItem(sportList[index]);
           }, separatorBuilder: (context,index)=> const Divider(thickness: 2,), itemCount: sportList.length,physics: const BouncingScrollPhysics(),),
         );
       }
      },
    );
  }
}
