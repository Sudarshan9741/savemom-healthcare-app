class NewsArticle {
  final String id;
  final String title;
  final String description;
  final String content;
  final String imageUrl;
  final String topic;
  final DateTime publishedDate;
  final String author;

  NewsArticle({
    required this.id,
    required this.title,
    required this.description,
    required this.content,
    required this.imageUrl,
    required this.topic,
    required this.publishedDate,
    required this.author,
  });

  NewsArticle copyWith({
    String? id,
    String? title,
    String? description,
    String? content,
    String? imageUrl,
    String? topic,
    DateTime? publishedDate,
    String? author,
  }) {
    return NewsArticle(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      content: content ?? this.content,
      imageUrl: imageUrl ?? this.imageUrl,
      topic: topic ?? this.topic,
      publishedDate: publishedDate ?? this.publishedDate,
      author: author ?? this.author,
    );
  }
}

class NewsTopic {
  final String id;
  final String name;
  final String icon;
  bool isSubscribed;

  NewsTopic({
    required this.id,
    required this.name,
    required this.icon,
    this.isSubscribed = false,
  });

  NewsTopic copyWith({
    String? id,
    String? name,
    String? icon,
    bool? isSubscribed,
  }) {
    return NewsTopic(
      id: id ?? this.id,
      name: name ?? this.name,
      icon: icon ?? this.icon,
      isSubscribed: isSubscribed ?? this.isSubscribed,
    );
  }
}
