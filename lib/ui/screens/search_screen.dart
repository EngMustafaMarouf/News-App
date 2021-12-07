import 'package:c_news_app/blocs/home_cubit/cubit.dart';
import 'package:c_news_app/blocs/home_cubit/states.dart';
import 'package:c_news_app/ui/widgets/article_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



class SearchScreen extends StatelessWidget{
  SearchScreen({Key? key}) : super(key: key);

  var searchList = [];

  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context){

    return  BlocConsumer<NewsCubit,NewsStates>(
        listener: (context,state){},
        builder: (context,state){

          if(state is NewsGetSearchSuccessState){
            searchList = state.searchList;
          }
          return Scaffold(
            body: SafeArea(
              child: Column(
                children: [

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: controller,
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                        label: Text("search"),
                        prefixIcon: Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.teal)
                        )
                      ),
                      validator: (String? value){
                        if(value!.isEmpty){
                          return "search must not be null";
                        }
                        return null;
                      },
                      onChanged: (String val){
                        NewsCubit.get(context).getSearch(val);
                      },
                    ),
                  ),
                  Expanded(
                    child: ListView.separated(
                        itemBuilder: (ctx,index){
                          return ArticleItem(searchList[index]);
                        },
                        separatorBuilder: (ctx,index)=> const Divider(thickness: 2,),
                        itemCount: searchList.length),
                  )

                ],
              ),
            ),
          );

        },
      );
  }


}