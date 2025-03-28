import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rapido/screens/book_ride_screen.dart';
import 'package:rapido/screens/ride_details_screen.dart';
import 'package:rapido/screens/payment_screen.dart';
import 'package:rapido/screens/booking_confirmation_screen.dart';
import 'package:rapido/screens/rating_feedback_screen.dart';
import 'package:rapido/screens/notifications_screen.dart';
import 'package:rapido/screens/help_support_screen.dart';
import 'package:rapido/screens/user_profile_screen.dart';
import 'package:rapido/screens/home_screen.dart';
import 'package:rapido/screens/login_screen.dart';
import 'package:rapido/provider/auth_provider.dart'; // Assuming you have an AuthProvider
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AuthProvider>(
      create: (context) => AuthProvider(),
      child: MaterialApp(
        title: 'Ride Sharing App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          // Customize the theme as needed
        ),
        // Determine initial route based on login status
        initialRoute: _getInitialRoute(),
        routes: {
          '/': (context) => HomeScreen(),
          '/login': (context) => LoginScreen(),
          '/bookRide': (context) => BookRideScreen(),
          '/rideDetails': (context) => RideDetailsScreen(),
          '/payment': (context) => PaymentScreen(),
          '/bookingConfirmation': (context) => BookingConfirmationScreen(),
          '/ratingFeedback': (context) => RatingFeedbackScreen(),
          '/notifications': (context) => NotificationsScreen(),
          '/helpSupport': (context) => HelpSupportScreen(),
          '/userProfile': (context) => UserProfileScreen(),
        },
        // Handle unknown routes with a custom 404 page
        onUnknownRoute: (settings) {
          return MaterialPageRoute(
            builder: (context) => Scaffold(
              appBar: AppBar(
                title: Text('Page Not Found'),
              ),
              body: Center(
                child: Text('404 - Page Not Found'),
              ),
            ),
          );
        },
      ),
    );
  }

  // Get the initial route based on authentication status
  String _getInitialRoute() {
    // Check if the user is logged in. If not, redirect to login.
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    return authProvider.isAuthenticated ? '/' : '/login';
  }
}