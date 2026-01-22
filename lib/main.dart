import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/task_provider.dart';
import 'providers/news_provider.dart';
import 'screens/tasks/task_dashboard_screen.dart';
import 'screens/news/news_feed_screen.dart';
import 'utils/app_theme_v2.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => TaskProvider()),
        ChangeNotifierProvider(create: (_) => NewsProvider()),
      ],
      child: MaterialApp(
        title: 'HR Dashboard',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.light(),
        home: const MainScreen(),
      ),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const TaskDashboardScreen(),
    const NewsFeedScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: colors.surface,
          border: Border(
            top: BorderSide(color: colors.outline, width: 1),
          ),
          boxShadow: [
            BoxShadow(
              color: colors.shadow,
              blurRadius: 8,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: NavigationBar(
          height: 72,
          backgroundColor: colors.surface,
          surfaceTintColor: colors.surface,
          selectedIndex: _selectedIndex,
          onDestinationSelected: (int index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          indicatorColor: colors.primary.withOpacity(0.15),
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.task_alt_outlined, size: 24),
              selectedIcon: Icon(Icons.task_alt, size: 24),
              label: 'Tasks',
            ),
            NavigationDestination(
              icon: Icon(Icons.newspaper_outlined, size: 24),
              selectedIcon: Icon(Icons.newspaper, size: 24),
              label: 'News',
            ),
          ],
        ),
      ),
    );
  }
}
