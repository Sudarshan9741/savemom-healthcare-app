import 'package:flutter/material.dart';
import '../models/news_model.dart';
import '../mock_data/mock_news.dart';

class NewsProvider extends ChangeNotifier {
  List<NewsTopic> _topics = List.from(MockNewsData.topics);
  final List<NewsArticle> _allArticles = List.from(MockNewsData.articles);
  bool _isLoading = false;

  List<NewsTopic> get topics => _topics;
  List<NewsArticle> get allArticles => _allArticles;
  bool get isLoading => _isLoading;

  List<NewsTopic> get subscribedTopics => _topics.where((t) => t.isSubscribed).toList();

  List<NewsArticle> get feedArticles {
    final subscribedTopicIds = subscribedTopics.map((t) => t.name).toSet();
    if (subscribedTopicIds.isEmpty) {
      return [];
    }
    return _allArticles.where((a) => subscribedTopicIds.contains(a.topic)).toList();
  }

  NewsTopic? getTopicById(String id) {
    try {
      return _topics.firstWhere((topic) => topic.id == id);
    } catch (e) {
      return null;
    }
  }

  NewsArticle? getArticleById(String id) {
    try {
      return _allArticles.firstWhere((article) => article.id == id);
    } catch (e) {
      return null;
    }
  }

  Future<void> toggleTopicSubscription(String topicId) async {
    _isLoading = true;
    notifyListeners();

    // Simulate API delay
    await Future.delayed(const Duration(milliseconds: 500));

    try {
      final index = _topics.indexWhere((t) => t.id == topicId);
      if (index != -1) {
        _topics[index] = _topics[index].copyWith(
          isSubscribed: !_topics[index].isSubscribed,
        );
        notifyListeners();
      }
    } catch (e) {
      rethrow;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void subscribeToTopic(String topicId) {
    final index = _topics.indexWhere((t) => t.id == topicId);
    if (index != -1) {
      _topics[index] = _topics[index].copyWith(isSubscribed: true);
      notifyListeners();
    }
  }

  void unsubscribeFromTopic(String topicId) {
    final index = _topics.indexWhere((t) => t.id == topicId);
    if (index != -1) {
      _topics[index] = _topics[index].copyWith(isSubscribed: false);
      notifyListeners();
    }
  }
}
