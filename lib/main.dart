import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/book_ride_screen.dart';
import 'screens/ride_details_screen.dart';
import 'screens/payment_screen.dart';
import 'screens/map_screen.dart';
import 'screens/user_profile_screen.dart';
import 'screens/ride_history_screen.dart';
import 'screens/booking_confirmation_screen.dart';
import 'screens/rating_feedback_screen.dart';
import 'screens/notifications_screen.dart';
import 'screens/help_support_screen.dart';
import 'screens/login_screen.dart';
import 'screens/signup_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rapido Clone',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // Define the routes for navigation
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/bookRide': (context) => BookRideScreen(),
        '/rideDetails': (context) => RideDetailsScreen(),
        '/payment': (context) => PaymentScreen(),
        '/map': (context) => MapScreen(),
        '/userProfile': (context) => UserProfileScreen(),
        '/rideHistory': (context) => RideHistoryScreen(),
        '/bookingConfirmation': (context) => BookingConfirmationScreen(),
        '/ratingFeedback': (context) => RatingFeedbackScreen(),
        '/notifications': (context) => NotificationsScreen(),
        '/helpSupport': (context) => HelpSupportScreen(),
        '/login': (context) => LoginScreen(),
        '/signup': (context) => SignupScreen(),
      },
      // Optional: You can also define onGenerateRoute or onUnknownRoute for dynamic routing or error handling
    );
  }
}
