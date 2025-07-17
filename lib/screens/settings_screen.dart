import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rapido/provider/theme_provider.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final _formKey = GlobalKey<FormState>();
  String _username = 'JohnDoe';
  bool _notificationsEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Navigate back to the previous screen
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: <Widget>[
            // Existing Username Field and Switch for Notifications
            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    initialValue: _username,
                    decoration: InputDecoration(labelText: 'Username'),
                    onSaved: (value) => _username = value!,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter a username';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 10),
                  SwitchListTile(
                    title: Text('Enable Notifications'),
                    value: _notificationsEnabled,
                    onChanged: (bool value) {
                      setState(() {
                        _notificationsEnabled = value;
                      });
                    },
                  ),
                ],
              ),
            ),
            Divider(), // Divider between settings and options

            // Additional Settings Options
            ListTile(
              title: Text('Change Password'),
              onTap: () {
                // Navigate to the Change Password screen
                Navigator.pushNamed(context, '/changePassword');
              },
            ),
            ListTile(
              title: Text('Help & Support'),
              onTap: () {
                // Navigate to Help & Support screen
                Navigator.pushNamed(context, '/helpSupport');
              },
            ),
            ListTile(
              title: Text('About Us'),
              onTap: () {
                // Navigate to About Us screen
                Navigator.pushNamed(context, '/about');
              },
            ),
            Divider(), // Divider for better separation

            // Toggle Dark/Light Mode Button
            ListTile(
              title: Text('Toggle Dark/Light Mode'),
              trailing: Switch(
                value: Provider.of<ThemeProvider>(context).isDarkMode,
                onChanged: (value) {
                  Provider.of<ThemeProvider>(context, listen: false)
                      .toggleTheme();
                },
              ),
            ),

            // "Save Settings" button placed below all options
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Settings saved')),
                    );
                  }
                },
                child: Text('Save Settings'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}