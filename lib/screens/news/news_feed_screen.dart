import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/news_provider.dart';
import '../../utils/app_theme_v2.dart';
import '../../utils/page_transitions.dart';
import '../../widgets/news_widgets.dart';
import 'news_detail_screen.dart';

class NewsFeedScreen extends StatefulWidget {
  const NewsFeedScreen({Key? key}) : super(key: key);

  @override
  State<NewsFeedScreen> createState() => _NewsFeedScreenState();
}

class _NewsFeedScreenState extends State<NewsFeedScreen> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: colors.background,
        title: Text(
          'News Feed',
          style: textTheme.headlineSmall?.copyWith(
            color: colors.onBackground,
          ),
        ),
        centerTitle: false,
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: colors.primary,
          labelColor: colors.primary,
          unselectedLabelColor: colors.onSurfaceVariant,
          tabs: [
            Tab(
              child: Text(
                'All News',
                style: textTheme.labelLarge,
              ),
            ),
            Tab(
              child: Text(
                'My Feed',
                style: textTheme.labelLarge,
              ),
            ),
          ],
        ),
      ),
      backgroundColor: colors.background,
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildAllNewsTab(),
          _buildMyFeedTab(),
        ],
      ),
    );
  }

  Widget _buildAllNewsTab() {
    final colors = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Consumer<NewsProvider>(
      builder: (context, newsProvider, _) {
        return Column(
          children: [
            // Topics section
            Padding(
              padding: const EdgeInsets.all(AppSpacing.lg),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Topics',
                    style: textTheme.titleMedium,
                  ),
                  const SizedBox(height: AppSpacing.lg),
                  SizedBox(
                    height: 50,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: newsProvider.topics.length,
                      separatorBuilder: (context, index) =>
                          const SizedBox(width: AppSpacing.md),
                      itemBuilder: (context, index) {
                        final topic = newsProvider.topics[index];
                        return NewsTopicChip(
                          topic: topic,
                          isSelected: topic.isSubscribed,
                          onChanged: (_) {
                            newsProvider.toggleTopicSubscription(topic.id);
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            // Articles list
            Expanded(
              child: _buildArticlesList(
                articles: newsProvider.allArticles,
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildMyFeedTab() {
    return Consumer<NewsProvider>(
      builder: (context, newsProvider, _) {
        final feedArticles = newsProvider.feedArticles;

        if (feedArticles.isEmpty) {
          return const EmptyNewsState();
        }

        return _buildArticlesList(articles: feedArticles);
      },
    );
  }

  Widget _buildArticlesList({required List articles}) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 220),
      transitionBuilder: (child, animation) => FadeTransition(
        opacity: animation,
        child: child,
      ),
      child: ListView.builder(
        key: ValueKey(articles.length),
        padding: const EdgeInsets.only(bottom: AppSpacing.lg),
        itemCount: articles.length,
        itemBuilder: (context, index) {
          final article = articles[index];
          return NewsCard(
            article: article,
            onTap: () {
              context.pushWithFadeSlide<void>(
                NewsDetailScreen(article: article),
              );
            },
          );
        },
      ),
    );
  }
}
