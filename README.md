# HR-DASHBOARD

A clean, professional Flutter application demonstrating modern mobile UI/UX with two main modules: Task Dashboard and News Feed. Built with mock data, clean architecture, and Provider state management.

## 📋 Project Overview

This is a comprehensive Flutter HR Dashboard application designed for HR professionals to manage tasks and stay updated with news. The app showcases best practices in Flutter development including:

- **Clean Architecture**: Well-organized folder structure with separation of concerns
- **State Management**: Provider pattern for efficient state handling
- **Material Design 3**: Modern UI following Material Design 3 principles
- **Responsive Layout**: Optimized for various screen sizes
- **Mock Data**: Complete mock dataset for demonstration without backend
- **Reusable Components**: Custom widgets for code reusability

## 🎯 Features

### Module 1: Task Dashboard

#### Dashboard Screen
- **Task List View**: Card-based UI displaying all tasks
- **Filter Tabs**: Toggle between Pending, Completed, and Denied tasks
- **Visual Indicators**: 
  - Priority badges (High/Medium/Low) with color coding
  - Status badges (Pending/Completed/Denied)
  - Deadline indicators with relative time
- **Task Overview**: Title, description, deadline, priority at a glance

#### Task Detail Screen
- **Full Task Information**: Complete description, instructions, and timeline
- **Key Information Section**: Assigned date and deadline display
- **Instructions Panel**: Formatted task instructions
- **Status-Specific Actions**:
  - **Pending Tasks**: Mark as Completed or Denied buttons
  - **Completed Tasks**: Display URL and completion notes with reset option
  - **Denied Tasks**: Show denial reason with reset option

#### Task Completion Form
- **URL Field**: Validates HTTP/HTTPS URLs
- **Notes Section**: Required text field (minimum 10 characters)
- **Attachment UI**: Placeholder for file uploads (UI only)
- **Form Validation**: Real-time validation with helpful error messages
- **Loading States**: Visual feedback during submission
- **Success Feedback**: Snackbar confirmation after completion

#### Task Denial Form
- **Reason Field**: Required text field (minimum 5 characters)
- **Simple Flow**: Quick denial with mandatory feedback
- **Form Validation**: Ensures meaningful input

### Module 2: News Feed

#### All News Tab
- **Topic Section**: Horizontal scrollable topic chips
- **Subscribe/Unsubscribe**: Toggle subscription with visual feedback
- **News List**: All available news articles with images
- **Article Cards**: Image, title, description, topic tag, publish time

#### My Feed Tab
- **Subscription-Based Feed**: Shows only news from subscribed topics
- **Empty State**: Helpful message when no topics subscribed
- **Dynamic Updates**: Real-time feed updates based on subscriptions

#### News Detail Screen
- **Hero Image**: Large article image at the top
- **Article Metadata**: Topic tag, publication date, author info
- **Author Section**: Avatar and publication time
- **Full Content**: Complete article text with proper formatting
- **Subscribe Button**: Direct subscription toggle from detail view

## 🏗️ Project Structure

```
lib/
├── main.dart                          # App entry point
├── models/
│   ├── task_model.dart               # Task data model
│   └── news_model.dart               # News article and topic models
├── providers/
│   ├── task_provider.dart            # Task state management
│   └── news_provider.dart            # News state management
├── screens/
│   ├── tasks/
│   │   ├── task_dashboard_screen.dart    # Main task list
│   │   └── task_detail_screen.dart       # Task details and forms
│   └── news/
│       ├── news_feed_screen.dart         # News feed and topics
│       └── news_detail_screen.dart       # News article detail
├── widgets/
│   ├── task_widgets.dart             # Task-specific widgets
│   └── news_widgets.dart             # News-specific widgets
├── utils/
│   ├── app_theme.dart                # Colors, spacing, typography
│   └── helpers.dart                  # Date formatting, validation
└── mock_data/
    ├── mock_tasks.dart               # Mock task data
    └── mock_news.dart                # Mock news data
```

## 🔧 State Management: Provider Pattern

### TaskProvider
- Manages task state and operations
- Methods:
  - `markTaskCompleted(id, url, notes)`: Mark task as completed
  - `markTaskDenied(id, reason)`: Mark task as denied
  - `resetTask(id)`: Reset task to pending status
- Computed properties:
  - `pendingTasks`: Filtered pending tasks
  - `completedTasks`: Filtered completed tasks
  - `deniedTasks`: Filtered denied tasks

### NewsProvider
- Manages news articles and subscriptions
- Methods:
  - `toggleTopicSubscription(topicId)`: Toggle subscription
  - `subscribeToTopic(topicId)`: Subscribe to topic
  - `unsubscribeFromTopic(topicId)`: Unsubscribe from topic
- Computed properties:
  - `subscribedTopics`: Currently subscribed topics
  - `feedArticles`: News from subscribed topics only

## 🎨 Design System

### Color Palette (Material 3)
- **Primary**: #6750A4 (Purple)
- **Secondary**: #625B71 (Gray)
- **Success**: #34A853 (Green)
- **Error**: #B3261E (Red)
- **Warning**: #FFA500 (Orange)

### Spacing System
- xs: 4dp, sm: 8dp, md: 16dp, lg: 24dp, xl: 32dp, xxl: 48dp

### Typography
- Display Styles (Large/Medium/Small)
- Headline Styles (Large/Medium/Small)
- Title Styles (Large/Medium/Small)
- Body Styles (Large/Medium/Small)
- Label Styles (Large/Medium/Small)

### Component Radius
- xs: 4dp, sm: 8dp, md: 12dp, lg: 16dp, xl: 20dp, xxl: 28dp

## 🚀 Getting Started

### Prerequisites
- Flutter SDK 3.0+
- Dart 3.0+
- VS Code or Android Studio

### Installation

1. **Ensure Flutter is installed**:
```bash
flutter --version
```

2. **Navigate to project directory**:
```bash
cd d:\savemom_Flutter_proj
```

3. **Get dependencies**:
```bash
flutter pub get
```

4. **Run the app**:
```bash
flutter run
```

5. **Run on specific device** (Web):
```bash
flutter run -d chrome
```

## 📱 Mock Data

### Task Dataset
- 6 sample tasks with varying statuses
- Mix of priorities (High/Medium/Low)
- Complete deadline information
- Detailed instructions for each task
- Sample completion data for demonstration

### News Dataset
- 6 news topics: Technology, Business, Health, Science, Sports, Entertainment
- 6 sample news articles with full content
- High-quality placeholder images
- Author information and publication dates

## ✅ Form Validation

### URL Validation
- Checks for valid HTTP/HTTPS format
- Validates URL structure
- Error message: "Please enter a valid URL"

### Notes Validation
- Minimum 10 characters required
- Non-empty validation
- Error message: "Notes must be at least 10 characters"

### Denial Reason Validation
- Minimum 5 characters required
- Non-empty validation
- Error message: "Please provide a valid reason"

## ⚡ UX Features

### Loading States
- Circular progress indicator during form submission
- Disabled buttons while loading
- Smooth transitions

### Feedback Mechanisms
- Snackbar notifications for actions
- Success messages with color coding
- Error messages for validation
- Dialog-based forms for clarity

### Empty States
- Helpful UI when no tasks/news available
- Icon and message prompts
- Call-to-action buttons

### Animations
- Smooth page transitions
- Fade effects on images
- Chip selection animations
- Button press feedback

## 🎓 Best Practices Demonstrated

### Architecture
- **Separation of Concerns**: Models, providers, screens, widgets
- **DRY Principle**: Reusable widgets and utilities
- **Single Responsibility**: Each class has one main purpose

### State Management
- **Efficient Updates**: Only affected widgets rebuild
- **Centralized State**: Single source of truth
- **Provider Pattern**: Easy testing and scalability

### UI/UX
- **Consistent Design**: Unified color scheme and typography
- **Responsive Design**: Adapts to different screen sizes
- **Accessibility**: Proper contrast and readable fonts
- **Feedback**: Clear indication of app state

### Code Quality
- **Type Safety**: Strong typing throughout
- **Null Safety**: Proper null handling
- **Error Handling**: Try-catch blocks for operations
- **Documentation**: Clear variable and method names

## 🔍 Code Walkthrough

### Creating a Task
```dart
Task task = Task(
  id: '1',
  title: 'Complete Project Proposal',
  description: 'Finalize and submit the Q1 project proposal',
  assignedDate: DateTime(2026, 1, 15),
  deadline: DateTime(2026, 1, 25, 17, 0),
  priority: TaskPriority.high,
  status: TaskStatus.pending,
  instructions: 'Review feedback and prepare presentation',
);
```

### Updating Task Status
```dart
await taskProvider.markTaskCompleted(
  taskId,
  url: 'https://example.com/proposal',
  notes: 'Completed all requirements',
);
```

### Managing Subscriptions
```dart
newsProvider.toggleTopicSubscription('tech');
```

## 📊 Performance Considerations

- **Lazy Loading**: News list loads on demand
- **Efficient Rebuilds**: Provider only rebuilds affected widgets
- **Optimized Images**: Placeholder images with error handling
- **Minimal State**: Only necessary data in providers

## 🐛 Testing the App

### Test Scenarios

#### Task Dashboard
1. ✅ Navigate between task filter tabs
2. ✅ Tap on a task to view details
3. ✅ Mark a task as completed with URL and notes
4. ✅ Mark a task as denied with reason
5. ✅ Reset a completed/denied task back to pending
6. ✅ Form validation works correctly

#### News Feed
1. ✅ View all news articles
2. ✅ Subscribe/unsubscribe to topics from chip buttons
3. ✅ Switch to "My Feed" tab
4. ✅ Verify feed shows only subscribed topic articles
5. ✅ Tap on news to view full article
6. ✅ Subscribe/unsubscribe from detail screen
7. ✅ Verify empty state shows when no subscriptions

## 📝 Future Enhancements

### Potential Features
- Backend API integration with REST/GraphQL
- Local database with SQLite/Hive
- Push notifications for task reminders
- Task search and filtering
- Advanced news filtering and sorting
- User authentication
- Dark mode support
- Internationalization (i18n)
- Unit and widget tests
- CI/CD pipeline

## 📄 Technical Requirements Met

✅ Flutter (latest stable version 3.38.7)
✅ Provider for state management
✅ Material 3 design system
✅ Mock JSON data (in-memory)
✅ No backend integration
✅ Clean architecture
✅ Reusable widgets
✅ Responsive layout
✅ Proper validation
✅ Loading states
✅ Error handling
✅ Smooth animations

## 🤝 Contributing

This is a demonstration project. Feel free to modify and extend it for your needs.

## 📞 Support

For questions or issues, refer to:
- [Flutter Documentation](https://flutter.dev)
- [Provider Package](https://pub.dev/packages/provider)
- [Material Design 3](https://m3.material.io/)

## 📄 License

This project is open source and available under the MIT License.

---

**Created**: January 2026
**Flutter Version**: 3.38.7
**Architecture**: Clean Architecture with Provider State Management
