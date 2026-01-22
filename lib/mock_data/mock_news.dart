import '../models/news_model.dart';

class MockNewsData {
  static final List<NewsTopic> topics = [
    NewsTopic(
      id: 'tech',
      name: 'Technology',
      icon: '💻',
      isSubscribed: true,
    ),
    NewsTopic(
      id: 'business',
      name: 'Business',
      icon: '📈',
      isSubscribed: true,
    ),
    NewsTopic(
      id: 'health',
      name: 'Health',
      icon: '🏥',
      isSubscribed: false,
    ),
    NewsTopic(
      id: 'science',
      name: 'Science',
      icon: '🔬',
      isSubscribed: false,
    ),
    NewsTopic(
      id: 'sports',
      name: 'Sports',
      icon: '⚽',
      isSubscribed: false,
    ),
    NewsTopic(
      id: 'entertainment',
      name: 'Entertainment',
      icon: '🎬',
      isSubscribed: true,
    ),
  ];

  static final List<NewsArticle> articles = [
    NewsArticle(
      id: '1',
      title: 'Flutter 3.38 Released with New Features',
      description: 'Latest Flutter release brings performance improvements and new widgets',
      content: '''
Flutter 3.38 is now available with significant performance improvements and exciting new features. 
The release includes enhanced Material 3 support, improved accessibility features, and better 
developer tooling. This version also brings performance optimizations that reduce app size and 
improve startup time.

Key features include:
- Enhanced Material 3 components
- Improved accessibility features
- New developer tooling
- Performance optimizations
- Better error messages and diagnostics

The Flutter team has worked extensively to ensure backward compatibility while introducing 
these new improvements.
      ''',
      imageUrl: 'https://via.placeholder.com/400x200?text=Flutter+3.38',
      topic: 'Technology',
      publishedDate: DateTime(2026, 1, 20),
      author: 'Flutter Team',
    ),
    NewsArticle(
      id: '2',
      title: 'Tech Giants Announce New Partnership',
      description: 'Major technology companies collaborate on new cloud infrastructure',
      content: '''
In a groundbreaking announcement, several major technology companies have revealed a strategic 
partnership to develop next-generation cloud infrastructure. This collaboration aims to provide 
developers with more efficient, scalable, and cost-effective cloud solutions.

The partnership will focus on:
- Cloud infrastructure optimization
- Open-source contributions
- Developer tool improvements
- Performance enhancements

Industry experts believe this partnership will accelerate innovation in cloud technology.
      ''',
      imageUrl: 'https://via.placeholder.com/400x200?text=Tech+Partnership',
      topic: 'Technology',
      publishedDate: DateTime(2026, 1, 19),
      author: 'Tech News Daily',
    ),
    NewsArticle(
      id: '3',
      title: 'Q4 Earnings Show Strong Growth',
      description: 'Tech companies report record earnings and revenue growth',
      content: '''
Major technology and business companies have released their Q4 earnings reports, showing 
impressive financial performance. Revenue growth exceeded analyst expectations across multiple 
sectors, driven by increased digital transformation initiatives.

Highlights include:
- 25% year-over-year revenue growth
- Increased profit margins
- Expanded market share
- Strong customer retention

Analysts remain optimistic about growth prospects for the coming year.
      ''',
      imageUrl: 'https://via.placeholder.com/400x200?text=Earnings+Report',
      topic: 'Business',
      publishedDate: DateTime(2026, 1, 18),
      author: 'Financial Times',
    ),
    NewsArticle(
      id: '4',
      title: 'New Streaming Service Launches',
      description: 'Entertainment giant unveils new streaming platform with exclusive content',
      content: '''
A major entertainment company has officially launched its new streaming service with an 
impressive catalog of exclusive content, original productions, and partnerships with premium 
studios.

The platform features:
- 5000+ hours of original content
- Exclusive movie premieres
- Live sports events
- 4K and HDR streaming
- Multi-device support

The service is available in 150+ countries with multiple subscription tiers.
      ''',
      imageUrl: 'https://via.placeholder.com/400x200?text=Streaming+Service',
      topic: 'Entertainment',
      publishedDate: DateTime(2026, 1, 17),
      author: 'Entertainment Weekly',
    ),
    NewsArticle(
      id: '5',
      title: 'Mobile App Development Trends 2026',
      description: 'New trends and best practices in mobile app development',
      content: '''
As we move into 2026, mobile app development continues to evolve with new frameworks, 
architectures, and best practices emerging. Developers are increasingly focusing on performance, 
accessibility, and user experience.

Key trends include:
- Increased adoption of cross-platform frameworks
- AI-powered development tools
- Improved performance monitoring
- Enhanced security measures
- Better developer experience

Organizations are investing heavily in modernizing their mobile development practices.
      ''',
      imageUrl: 'https://via.placeholder.com/400x200?text=Mobile+Development',
      topic: 'Technology',
      publishedDate: DateTime(2026, 1, 16),
      author: 'Dev.to',
    ),
    NewsArticle(
      id: '6',
      title: 'Digital Transformation Accelerates',
      description: 'Enterprises adopt digital solutions at record pace',
      content: '''
Corporate enterprises are accelerating their digital transformation initiatives with unprecedented 
investment in cloud services, AI, and automation technologies. This trend reflects the increasing 
importance of digital capabilities in competitive markets.

Investment areas:
- Cloud infrastructure
- Artificial Intelligence
- Business automation
- Data analytics
- Cybersecurity

Industry leaders project continued growth in digital transformation spending.
      ''',
      imageUrl: 'https://via.placeholder.com/400x200?text=Digital+Transformation',
      topic: 'Business',
      publishedDate: DateTime(2026, 1, 15),
      author: 'CIO Magazine',
    ),
  ];
}
