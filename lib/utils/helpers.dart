import 'package:intl/intl.dart';

class DateFormatter {
  static String formatDate(DateTime date) {
    return DateFormat('MMM dd, yyyy').format(date);
  }

  static String formatDateTime(DateTime dateTime) {
    return DateFormat('MMM dd, yyyy • HH:mm').format(dateTime);
  }

  static String formatTime(DateTime dateTime) {
    return DateFormat('HH:mm').format(dateTime);
  }

  static String formatRelativeTime(DateTime dateTime) {
    final now = DateTime.now();
    final difference = now.difference(dateTime);

    if (difference.inDays > 0) {
      return '${difference.inDays}d ago';
    } else if (difference.inHours > 0) {
      return '${difference.inHours}h ago';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes}m ago';
    } else {
      return 'just now';
    }
  }

  static String formatDeadline(DateTime deadline) {
    final now = DateTime.now();
    final difference = deadline.difference(now);

    if (difference.isNegative) {
      return 'Overdue';
    } else if (difference.inDays == 0) {
      return 'Today at ${formatTime(deadline)}';
    } else if (difference.inDays == 1) {
      return 'Tomorrow at ${formatTime(deadline)}';
    } else if (difference.inDays < 7) {
      return '${difference.inDays} days left';
    } else {
      return formatDate(deadline);
    }
  }
}

class ValidationHelper {
  static bool isValidUrl(String url) {
    try {
      Uri.parse(url);
      return url.startsWith('http://') || url.startsWith('https://');
    } catch (e) {
      return false;
    }
  }

  static bool isValidEmail(String email) {
    final RegExp emailRegex =
        RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    return emailRegex.hasMatch(email);
  }

  static String? validateUrl(String? value) {
    if (value == null || value.isEmpty) {
      return 'URL is required';
    }
    if (!isValidUrl(value)) {
      return 'Please enter a valid URL (http:// or https://)';
    }
    return null;
  }

  static String? validateNotes(String? value) {
    if (value == null || value.isEmpty) {
      return 'Notes are required';
    }
    if (value.length < 10) {
      return 'Notes must be at least 10 characters';
    }
    return null;
  }

  static String? validateReason(String? value) {
    if (value == null || value.isEmpty) {
      return 'Reason is required';
    }
    if (value.length < 5) {
      return 'Please provide a valid reason (min 5 characters)';
    }
    return null;
  }
}

extension StringExtension on String {
  String capitalize() {
    return '${this[0].toUpperCase()}${substring(1)}';
  }

  String truncate(int length, {String ellipsis = '...'}) {
    if (this.length <= length) return this;
    return '${substring(0, length - ellipsis.length)}$ellipsis';
  }
}
