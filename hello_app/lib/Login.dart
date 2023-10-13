import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);
  static const primarybackground = Color(0xFF1E213A);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primarybackground,
      appBar: AppBar(
        backgroundColor: primarybackground,
        title: const Text('Login Page'),
        actions: [
          IconButton(
            icon: const Icon(Icons.navigate_next),
            tooltip: 'Go to the second page',
            onPressed: () {
              Navigator.pushNamed(context, '/registration');
            },
          ),
          // Add additional action buttons here
        ],
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Welcome to the Login Page',
              style: TextStyle(fontSize: 24.0),
            ),
            // Add login form or widgets here
          ],
        ),
      ),
    );
  }
}

class RegistrationPage extends StatelessWidget {
  const RegistrationPage({Key? key}) : super(key: key);
  static const primarybackground = Color(0xFF1E213A);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primarybackground,
      appBar: AppBar(
        backgroundColor: primarybackground,
        title: const Text('Registration Page'),
        actions: [
          IconButton(
            icon: const Icon(Icons.navigate_next),
            tooltip: 'Go to the hompage page',
            onPressed: () {
              Navigator.pushNamed(context, '/home');
            },
          ),
          // Add additional action buttons here
        ],
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Create a new account',
              style: TextStyle(fontSize: 24.0),
            ),
            // Add registration form or widgets here
          ],
        ),
      ),
    );
  }
}
