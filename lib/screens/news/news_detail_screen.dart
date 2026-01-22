import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/news_model.dart';
import '../../providers/news_provider.dart';
import '../../utils/app_theme_v2.dart';
import '../../utils/helpers.dart';

class NewsDetailScreen extends StatelessWidget {
  final NewsArticle article;

  const NewsDetailScreen({required this.article, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: colors.background,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      backgroundColor: colors.background,
      body: Consumer<NewsProvider>(
        builder: (context, newsProvider, _) {
          final topic = newsProvider.getTopicById(
            newsProvider.topics
                .firstWhere(
                  (t) => t.name == article.topic,
                  orElse: () => newsProvider.topics.first,
                )
                .id,
          );

          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Hero image with gradient overlay
                Container(
                  width: double.infinity,
                  height: 250,
                  color: colors.primaryContainer,
                  child: Stack(
                    children: [
                      Image.network(
                        article.imageUrl,
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: double.infinity,
                        errorBuilder: (context, error, stackTrace) {
                          return Center(
                            child: Icon(
                              Icons.image_not_supported,
                              color: colors.onSurfaceVariant,
                              size: 64,
                            ),
                          );
                        },
                      ),
                      // Gradient overlay
                      Positioned.fill(
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.transparent,
                                Theme.of(context).colorScheme.primary.withOpacity(0.2),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // Content
                Padding(
                  padding: const EdgeInsets.all(AppSpacing.lg),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Topic and date
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: AppSpacing.lg,
                              vertical: AppSpacing.sm,
                            ),
                            decoration: BoxDecoration(
                              color: colors.primary.withOpacity(0.15),
                              borderRadius: BorderRadius.circular(AppRadius.pill),
                            ),
                            child: Text(
                              article.topic,
                              style: textTheme.labelMedium?.copyWith(
                                color: colors.primary,
                              ),
                            ),
                          ),
                          Text(
                            DateFormatter.formatDate(article.publishedDate),
                            style: textTheme.bodySmall?.copyWith(
                              color: colors.onSurfaceVariant,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: AppSpacing.lg),

                      // Title
                      Text(
                        article.title,
                        style: textTheme.displaySmall,
                      ),
                      const SizedBox(height: AppSpacing.lg),

                      // Author
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 20,
                            backgroundColor: colors.primary,
                            child: Text(
                              article.author[0],
                              style: textTheme.titleMedium?.copyWith(
                                color: colors.onPrimary,
                              ),
                            ),
                          ),
                          const SizedBox(width: AppSpacing.lg),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  article.author,
                                  style: textTheme.labelLarge,
                                ),
                                Text(
                                  DateFormatter.formatRelativeTime(
                                    article.publishedDate,
                                  ),
                                  style: textTheme.bodySmall?.copyWith(
                                    color: colors.onSurfaceVariant,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: AppSpacing.lg),

                      // Divider
                      Divider(
                        color: colors.outline,
                        height: 1,
                      ),
                      const SizedBox(height: AppSpacing.lg),

                      // Content
                      Text(
                        article.content,
                        style: textTheme.bodyLarge?.copyWith(
                          height: 1.8,
                          color: colors.onBackground,
                        ),
                      ),
                      const SizedBox(height: AppSpacing.lg),

                      // Subscribe button
                      if (topic != null)
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton.icon(
                            onPressed: () {
                              newsProvider.toggleTopicSubscription(topic.id);
                              final isSubscribed = topic.isSubscribed;
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    isSubscribed
                                        ? 'Subscribed to ${topic.name}'
                                        : 'Unsubscribed from ${topic.name}',
                                  ),
                                  duration: const Duration(seconds: 2),
                                ),
                              );
                            },
                            icon: Icon(
                              topic.isSubscribed
                                  ? Icons.favorite
                                  : Icons.favorite_outline,
                            ),
                            label: Text(
                              topic.isSubscribed
                                  ? 'Unsubscribe from ${topic.name}'
                                  : 'Subscribe to ${topic.name}',
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: topic.isSubscribed
                                  ? colors.error
                                  : colors.primary,
                              padding: const EdgeInsets.symmetric(
                                vertical: AppSpacing.lg,
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
