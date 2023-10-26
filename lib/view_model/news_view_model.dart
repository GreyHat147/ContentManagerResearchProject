import 'package:flutter/foundation.dart';
import 'package:research_project/repository/models/news.dart';
import 'package:research_project/repository/news_repository.dart';

class NewsViewModel extends ChangeNotifier {
  final NewsRepository _newsRepository;
  NewsViewModel(NewsRepository newsRepository)
      : _newsRepository = newsRepository {
    getNews();
  }

  List<News> news = [];
  News? newSelected;

  Future<void> getNews() async {
    news = await _newsRepository.getNews();
    notifyListeners();
  }

  Future<News> getNew(String id) async {
    return await _newsRepository.getNew(id);
  }
}
