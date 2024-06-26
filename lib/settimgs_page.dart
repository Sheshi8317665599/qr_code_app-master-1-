import 'package:flutter/material.dart';
import 'package:qr_code_app/login_signup.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          // Profile Section
          ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage('assets/images/PHOTOS.jpg'),
            ),
            title: Text('Sheshipreetham'),
            subtitle: Text('App Developer'),
            trailing: IconButton(
              icon: Icon(Icons.edit),
              onPressed: () {
                // Edit profile
              },
            ),
          ),
          Divider(),

          // Dark Mode Toggle
          SwitchListTile(
            title: Text('Dark Mode'),
            value: true, // Replace with your dark mode state
            onChanged: (value) {
              // Toggle dark mode
            },
          ),
          Divider(),

          // Account Section
          ListTile(
            leading: Icon(Icons.lock),
            title: Text('Account Settings'),
            onTap: () {
              // Navigate to account settings page
            },
          ),
          Divider(),

          // Notifications Section
          ListTile(
            leading: Icon(Icons.notifications),
            title: Text('Notifications'),
            onTap: () {
              // Navigate to notifications settings page
            },
          ),
          ListTile(
            leading: Icon(Icons.volume_up),
            title: Text('Sound'),
            trailing: Switch(
              value: true, // Replace with your sound state
              onChanged: (value) {
                // Toggle sound
              },
            ),
          ),
          ListTile(
            leading: Icon(Icons.vibration),
            title: Text('Vibration'),
            trailing: Switch(
              value: true, // Replace with your vibration state
              onChanged: (value) {
                // Toggle vibration
              },
            ),
          ),
          Divider(),

          // Language Section
          ListTile(
            leading: Icon(Icons.language),
            title: Text('Language'),
            onTap: () {
              // Navigate to language settings page
            },
          ),
          Divider(),

          // Logout Section
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Logout'),
            onTap: () {
                Navigator.push(context, 
                   MaterialPageRoute(builder: (context) => LoginSignupScreen()));
                    print('Icon button pressed');
            },
          ),
        ],
      ),
    );
  }
}