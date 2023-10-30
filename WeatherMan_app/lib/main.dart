import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'Login.dart';
import 'RegistrationPage.dart';
import 'api.dart';
import 'firebase_options.dart';
import 'default_locator.dart';
import 'feedback.dart';

// function to trigger build when the app is run
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.android);
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => const WelcomeRoute(),
      '/registration': (context) => RegistrationPage(),
      '/login': (context) => LoginPage(),
      '/home': (context) =>  Location(),
      '/third': (context) => const ThirdRoute(),
    },
  ));
}

class WelcomeRoute extends StatelessWidget {
  const WelcomeRoute({Key? key}) : super(key: key);
  static const primarybackground = Color(0xFF1E213A);

  ButtonStyle _buttonStyle() {
    return ElevatedButton.styleFrom(
      textStyle: const TextStyle(
        fontSize: 55.0,
        fontWeight: FontWeight.bold,
      ),
      backgroundColor: primarybackground,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primarybackground,
      appBar: AppBar(
        backgroundColor: primarybackground,
        // title: const Text('Welcome Page'),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.navigate_next,
              color: Colors.white,
            ),

            tooltip: 'Go to the second page',
            onPressed: () {
              Navigator.pushNamed(context, '/login');
            },
            // Add additional action buttons
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(
                top: 100.0), // Adjust the top padding as needed
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                const Text(
                  'WeatherMan',
                  style: TextStyle(
                      fontSize: 30.0,
                      color: Colors.white, // Set text color to white
                      fontWeight: FontWeight.bold), // Make text bold
                ),
                const SizedBox(height: 10), // Add space here (adjust as needed)
                const Text(
                  'Version 1.0',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Color.fromARGB(255, 86, 84, 84),
                  ),
                ),
                const SizedBox(height: 50), // Add space here (adjust as needed)
                const Text(
                  'Discover the Weather in',
                  style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.white, // Set text color to white
                      fontWeight: FontWeight.bold), // Make text bold),
                ),
                const SizedBox(height: 10), // Add space here (adjust as needed)
                const Text(
                  'Your City',
                  style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.white, // Set text color to white
                      fontWeight: FontWeight.bold), // Make text bold),
                ),
                const SizedBox(height: 50), // Add space here (adjust as needed)
                ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/registration');
                    },
                    child: const Text('Get Started')),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
