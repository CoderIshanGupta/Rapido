import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthProvider with ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Phone Sign-Up Method
  Future<String?> signUpWithPhone(
      String phoneNumber, String password, String email) async {
    try {
      // Send OTP verification to the phone number
      await _auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) async {
          await _auth.signInWithCredential(credential);
        },
        verificationFailed: (FirebaseAuthException e) {
          throw e.message ?? "Phone number verification failed.";
        },
        codeSent: (String verificationId, int? resendToken) {
          print("OTP sent. Verification ID: $verificationId");
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          // Timeout callback
        },
      );
      return null; // Successful request
    } catch (e) {
      return e.toString(); // Return error if failed
    }
  }

  // Phone Login Method
  Future<String?> loginWithPhone(String phoneNumber, String otp) async {
    try {
      // PhoneAuthCredential is used to sign in after receiving OTP
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: phoneNumber, // This should be passed from the OTP screen
        smsCode: otp,
      );
      // Sign in using the credential
      await _auth.signInWithCredential(credential);
      return null; // Successful login
    } catch (e) {
      return e.toString(); // Return error message if login fails
    }
  }

  // Email Sign Up Method
  Future<String?> signUpWithEmail(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return null;
    } catch (e) {
      return e.toString();
    }
  }

  // Email Login Method
  Future<String?> loginWithEmail(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return null;
    } catch (e) {
      return e.toString();
    }
  }

  // Sign-Out Method
  Future<void> signOut() async {
    await _auth.signOut();
  }

   // Password Reset Method
  Future<String?> resetPassword(String emailOrPhone) async {
    try {
      if (emailOrPhone.contains('@')) {
        // If it's an email, use Firebase's sendPasswordResetEmail method
        await _auth.sendPasswordResetEmail(email: emailOrPhone);
      } else {
        // For phone number, you can send an OTP and reset the password
        // but Firebase does not directly support password reset with phone number.
        // You would need to implement OTP verification and update the password manually.
        return "Phone number reset is not supported directly. Use email for reset.";
      }
      return null; // Successful reset link sent
    } catch (e) {
      return e.toString(); // Return error message if something goes wrong
    }
  }
}