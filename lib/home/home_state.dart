import 'package:my_bloc_app/models/article_model.dart';

abstract class HomeState {}

class HomeInitial extends HomeState{}

class HomeLoading extends HomeState{}

class HomeSuccess extends HomeState{
  final List<ArticleModel> data;
  HomeSuccess(this.data);
}

class HomeFailure extends HomeState{
  final String msg;
  HomeFailure(this.msg);
}


