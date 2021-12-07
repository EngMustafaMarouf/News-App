
import 'package:dio/dio.dart';


class DioHelper {

 static Dio? dio;

  static init(){
    dio = Dio(BaseOptions(
      baseUrl: 'https://newsapi.org/',
      receiveDataWhenStatusError: true,
    ),
    );
  }


  static Future<Response> getData({required String path,required Map<String,dynamic> query})async{
    final response = await dio!.get(path,queryParameters: query);
    return response;
  }















}