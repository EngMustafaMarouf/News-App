import 'package:c_news_app/blocs/home_cubit/cubit.dart';
import 'package:c_news_app/blocs/home_cubit/states.dart';
import 'package:c_news_app/ui/widgets/article_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class BussinessScreen extends StatelessWidget {
  BussinessScreen({Key? key}) : super(key: key);

  List<dynamic>  businessList = [];

  @override
  Widget build(BuildContext context) {



     return BlocConsumer<NewsCubit,NewsStates>(
       listener: (context,state) {},
       builder: (context,state){

         if(state is NewsGetBusinessSuccessState){
           businessList = state.businessList;
         }

         if(businessList.isEmpty){

           return const Center(child: CircularProgressIndicator());
         }
          else{
            //print('ListView');
           return RefreshIndicator(
             onRefresh:() async => NewsCubit.get(context).getBusinessData(),
             child: ListView.separated(
                 physics: const BouncingScrollPhysics(),
                 itemBuilder: (context, index) => ArticleItem(businessList[index]),
                 separatorBuilder: (context, index)=> const Divider(thickness: 2,),
                 itemCount: businessList.length),
           );
         }
       },
     );
  }
}

/*

 return ListView.builder(
             physics: const BouncingScrollPhysics(),
             itemCount: businessList.length,
             itemBuilder: (context,index){
               return ArticleItem(businessList[index]);
             });
 */