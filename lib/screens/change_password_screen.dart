import 'package:flutter/material.dart';

class ChangePasswordScreen extends StatefulWidget {
  @override
  _ChangePasswordScreenState createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  String _oldPassword = '';
  String _newPassword = '';
  String _confirmPassword = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Change Password"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: "Old Password"),
                obscureText: true,
                onChanged: (value) {
                  _oldPassword = value;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your old password.";
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: "New Password"),
                obscureText: true,
                onChanged: (value) {
                  _newPassword = value;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter a new password.";
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: "Confirm New Password"),
                obscureText: true,
                onChanged: (value) {
                  _confirmPassword = value;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please confirm your new password.";
                  } else if (value != _newPassword) {
                    return "Passwords do not match.";
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    // Submit the change password request
                    // For now, let's assume the password change is successful
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Password Changed Successfully")));
                  }
                },
                child: Text("Change Password"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
