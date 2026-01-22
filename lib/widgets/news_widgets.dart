import 'package:flutter/material.dart';
import '../utils/app_theme_v2.dart';
import '../models/news_model.dart';
import '../utils/helpers.dart';
import 'premium_widgets.dart';

class NewsTopicChip extends StatelessWidget {
  final NewsTopic topic;
  final bool isSelected;
  final ValueChanged<bool> onChanged;

  const NewsTopicChip({
    required this.topic,
    required this.isSelected,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return GestureDetector(
      onTap: () => onChanged(!isSelected),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 220),
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.lg,
          vertical: AppSpacing.md,
        ),
        decoration: BoxDecoration(
          color: isSelected 
            ? colors.primary 
            : colors.surfaceVariant,
          border: Border.all(
            color: isSelected 
              ? colors.primary 
              : colors.outline,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(AppRadius.pill),
          boxShadow: isSelected
            ? [AppShadows.hover(colors)]
            : [],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              topic.icon,
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(width: AppSpacing.lg),
            Text(
              topic.name,
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                color: isSelected ? colors.onPrimary : colors.onSurface,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NewsCard extends StatefulWidget {
  final NewsArticle article;
  final VoidCallback onTap;

  const NewsCard({
    required this.article,
    required this.onTap,
  });

  @override
  State<NewsCard> createState() => _NewsCardState();
}

class _NewsCardState extends State<NewsCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 220),
          margin: const EdgeInsets.symmetric(
            horizontal: AppSpacing.lg,
            vertical: AppSpacing.sm,
          ),
          transform: _isHovered ? Matrix4.translationValues(0, -4, 0) : Matrix4.identity(),
          decoration: BoxDecoration(
            color: colors.surface,
            borderRadius: BorderRadius.circular(AppRadius.md),
            border: Border.all(
              color: _isHovered ? colors.primary.withOpacity(0.3) : colors.outline,
              width: 1.5,
            ),
            boxShadow: _isHovered
                ? [AppShadows.hover(colors)]
                : [AppShadows.base(colors)],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(AppRadius.md),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Image with gradient overlay
                Container(
                  width: double.infinity,
                  height: 200,
                  color: colors.primaryContainer,
                  child: Stack(
                    children: [
                      Image.network(
                        widget.article.imageUrl,
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: double.infinity,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            color: colors.primaryContainer,
                            child: Center(
                              child: Icon(
                                Icons.image_not_supported,
                                color: colors.onSurfaceVariant,
                                size: 52,
                              ),
                            ),
                          );
                        },
                      ),
                      // Gradient overlay (dark bottom)
                      Positioned.fill(
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.transparent,
                                Theme.of(context).colorScheme.primary.withOpacity(0.15),
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: AppSpacing.lg,
                              vertical: AppSpacing.xs,
                            ),
                            decoration: BoxDecoration(
                              color: colors.primary.withOpacity(0.15),
                              borderRadius: BorderRadius.circular(AppRadius.pill),
                            ),
                            child: Text(
                              widget.article.topic,
                              style: textTheme.labelMedium?.copyWith(
                                color: colors.primary,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Text(
                            DateFormatter.formatRelativeTime(widget.article.publishedDate),
                            style: textTheme.bodySmall?.copyWith(
                              color: colors.onSurfaceVariant,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: AppSpacing.lg),
                      Text(
                        widget.article.title,
                        style: textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: AppSpacing.md),
                      Text(
                        widget.article.description,
                        style: textTheme.bodySmall?.copyWith(
                          color: colors.onSurfaceVariant,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class EmptyNewsState extends StatelessWidget {
  const EmptyNewsState();

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return EmptyState(
      icon: Icons.newspaper,
      title: 'No Subscriptions Yet',
      subtitle: 'Subscribe to topics to see news in your feed',
      iconColor: colors.primary,
      action: ElevatedButton(
        onPressed: () {
          // Navigate to topics tab
          DefaultTabController.of(context).animateTo(0);
        },
        child: const Text('Browse Topics'),
      ),
    );
  }
}
