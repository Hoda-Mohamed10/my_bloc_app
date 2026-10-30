import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import 'package:my_bloc_app/home/home_state.dart';
import 'package:my_bloc_app/models/article_model.dart';

class HomeCubit extends Cubit<HomeState>{
  HomeCubit() : super(HomeInitial());

  final dio = Dio();

  Future<void> getHomeData() async{
    try {
      emit(HomeLoading());

      final Response response = await dio.get(
          'https://newsapi.org/v2/top-headlines',
          queryParameters: {
            'apiKey': '4d8c29dae3c9472cbc43ea7ffb4763a4',
            'country': 'us'
          }
      );

      final article = response.data['articles'] as List;

      final data= article.map((e) => ArticleModel.fromJson(e)).toList();
      emit(HomeSuccess(data));
    }


    on DioException catch (e){
      emit(HomeFailure(e.message ?? 'dio exception'));
    } catch (e){
      emit(HomeFailure(e.toString()));
    }
  }
  Future<void>getSearchData({required String query})async{
    try{
      emit(HomeLoading());
      final Response response= await dio.get('https://newsapi.org/v2/everything',
        queryParameters: {
        'q' : query,
         'apiKey' : '4d8c29dae3c9472cbc43ea7ffb4763a4'
        }
      );
      final articles= response.data['articles'] as List;
      final data= articles.map((e)=> ArticleModel.fromJson(e)).toList();
      emit(HomeSuccess(data));
    }
    on DioException catch(E){
      emit(HomeFailure(E.message ?? 'DioExp'));
    }
    catch(e){
      emit(HomeFailure(e.toString()));
    }
  }
}