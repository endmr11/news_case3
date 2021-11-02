import 'package:bloc/bloc.dart';
import 'package:news_case3/bloc/news_event.dart';
import 'package:news_case3/bloc/news_state.dart';
import 'package:news_case3/models/article_model.dart';
import 'package:news_case3/repository/news_repository.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  NewsRepository newsRepository;
  NewsBloc({required NewsState initialState, required this.newsRepository})
      : super(initialState) {
    add(StartEvent());
  }

  @override
  Stream<NewsState> mapEventToState(NewsEvent event) async* {
    if (event is StartEvent) {
      try {
        List<ArticleModel> _articleList = [];
        yield NewsLoadingState();
        _articleList = await newsRepository.fetchNews();
        yield NewsLoadedState(articleList: _articleList);
      } catch (e) {
        yield NewsErrorState(errorMessage: e.toString());
      }
    }
  }
}
