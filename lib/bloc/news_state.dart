import 'package:equatable/equatable.dart';
import 'package:news_case3/models/article_model.dart';

class NewsState extends Equatable {
  const NewsState();

  @override
  List<Object> get props => [];
}

class NewsInitState extends NewsState {}

class NewsLoadingState extends NewsState {}

class NewsLoadedState extends NewsState {
  final List<ArticleModel> articleList;
  const NewsLoadedState({required this.articleList});
}

class NewsErrorState extends NewsState {
  final String errorMessage;
  const NewsErrorState({required this.errorMessage});
}
