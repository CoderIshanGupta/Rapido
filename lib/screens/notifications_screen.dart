import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: ChangeNotifierProvider(
        create: (context) => NotificationProvider(),
        child: NotificationsScreen(),
      ),
    );
  }
}

class Notification {
  final String title;
  final String message;

  Notification({required this.title, required this.message});
}

class NotificationProvider with ChangeNotifier {
  bool _isLoading = false;
  List<Notification> _notifications = [];

  bool get isLoading => _isLoading;
  List<Notification> get notifications => _notifications;

  // Simulate fetching notifications
  Future<void> fetchNotifications() async {
    _isLoading = true;
    notifyListeners();

    // Simulate a network call or Firebase query here
    await Future.delayed(Duration(seconds: 2)); // Simulate network delay

    _notifications = [
      Notification(title: 'New Ride Request', message: 'You have a new ride request from John.'),
      Notification(title: 'Ride Completed', message: 'Your ride with Sarah has been completed.'),
    ];

    _isLoading = false;
    notifyListeners();
  }
}

class NotificationsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Fetch notifications when the screen is loaded
    Future.microtask(() => context.read<NotificationProvider>().fetchNotifications());

    return Scaffold(
      appBar: AppBar(title: Text('Notifications')),
      body: Consumer<NotificationProvider>(
        builder: (context, notificationProvider, child) {
          if (notificationProvider.isLoading) {
            return Center(child: CircularProgressIndicator());
          }

          if (notificationProvider.notifications.isEmpty) {
            return Center(child: Text('No notifications.'));
          }

          return ListView.builder(
            itemCount: notificationProvider.notifications.length,
            itemBuilder: (context, index) {
              final notification = notificationProvider.notifications[index];
              return ListTile(
                title: Text(notification.title),
                subtitle: Text(notification.message),
              );
            },
          );
        },
      ),
    );
  }
}