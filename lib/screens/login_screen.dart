import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rapido/provider/auth_provider.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:rapido/screens/home_screen.dart';
import 'package:rapido/screens/forgot_password_screen.dart';
import 'package:rapido/screens/signup_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  String? errorMessage;
  PhoneNumber? phoneNumber;

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/logo.png', // Your logo
                  width: 150,
                  height: 150,
                ),
                SizedBox(height: 20),
                Text(
                  "Login to Your Account",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 20),
                // Phone number field
                InternationalPhoneNumberInput(
                  onInputChanged: (PhoneNumber number) {
                    phoneNumber = number;
                  },
                  initialValue: phoneNumber ?? PhoneNumber(isoCode: 'IN'),
                  selectorConfig: SelectorConfig(
                    selectorType: PhoneInputSelectorType.DIALOG,
                  ),
                  textFieldController: phoneController,
                  inputDecoration: InputDecoration(
                    labelText: "Phone Number",
                    hintText: "Enter your phone number",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                    contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  ),
                ),
                SizedBox(height: 20),
                // Password field (optional for phone number login)
                TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: "Password",
                    hintText: "Enter your password",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                    contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  ),
                ),
                SizedBox(height: 20),
                if (errorMessage != null)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      errorMessage!,
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                ElevatedButton(
                  onPressed: () async {
                    String? error = await authProvider.loginWithPhone(
                      phoneController.text.trim(),
                      passwordController.text.trim(), // Add OTP here
                    );
                    if (error != null) {
                      setState(() {
                        errorMessage = error;
                      });
                    } else {
                      Navigator.pushReplacementNamed(context, "/home");
                    }
                  },
                  child: Text("Login"),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 100),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                  ),
                ),
                SizedBox(height: 20),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ForgotPasswordScreen(),
                      ),
                    );
                  },
                  child: Text(
                    "Forgot Password?",
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have an account?"),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SignupScreen(),
                          ),
                        );
                      },
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}