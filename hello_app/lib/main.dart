import 'package:flutter/material.dart';

// function to trigger build when the app is run
void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
     '/': (context) => const WelcomeRoute(),
     '/login': (context) => const LoginPage(),
     '/registration': (context) => const RegistrationPage(),
     '/home': (context) => const HomeRoute(),
     '/third': (context) => const ThirdRoute(),
    },
  ));
}


class WelcomeRoute extends StatelessWidget {
  const WelcomeRoute({Key? key}) : super(key: key);

  ButtonStyle _buttonStyle() {
    return ElevatedButton.styleFrom(
      textStyle: const TextStyle(
        fontSize: 55.0,
        fontWeight: FontWeight.bold,
      ), backgroundColor: Colors.blue, 
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome Page'),
        actions: [
          IconButton(
            icon: const Icon(Icons.navigate_next),
            tooltip: 'Go to the second page',
            onPressed: () {
              Navigator.pushNamed(context, '/login');
            },
            // Add additional action buttons 
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Welcome to WeatherMan App',
              style: TextStyle(fontSize: 24.0),
            ),
           const Text(
              'Version 1.0',
              style: TextStyle(fontSize: 12.0),
            ),
            const Text(
              'Discover the Weather in Your City',
              style: TextStyle(fontSize: 16.0),
            ),

            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/login');
              },
              child: const Text('Get Started'),
            ),
          ],
        ),
      ),
    );
  }
}


class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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

class HomeRoute extends StatelessWidget {
  const HomeRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Home Page",
          style: TextStyle(
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.blueGrey[900],
        actions: [
          IconButton(
            icon: const Icon(Icons.navigate_next),
            tooltip: 'Go to the third page',
            onPressed: () {
              Navigator.pushNamed(context, '/third');
            },
          ),
        ],
      ), // AppBar
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
             Text(
        'Hello, User', 
        style: TextStyle(
          fontSize: 24.0,
          fontWeight: FontWeight.bold,
        ),
      ),
     
            // Row(
            //   // Use Row instead of Column
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: <Widget>[
            //     ElevatedButton(
            //       onPressed: () {
            //         Navigator.pushNamed(context, '/');
            //       },
            //       child: const Text(
            //         'Back!',
            //         style: TextStyle(
            //           fontSize: 30.0,
            //           fontWeight: FontWeight.bold,
            //         ),
            //       ),
            //     ),
            //     const SizedBox(width: 16.0), // Add horizontal spacing
            //     ElevatedButton(
            //       onPressed: () {
            //         Navigator.pushNamed(context, '/third');
            //       },
            //       style: ElevatedButton.styleFrom(
            //         primary: Colors.blue,
            //         textStyle: const TextStyle(
            //           fontSize: 24.0,
            //           fontWeight: FontWeight.bold,
            //         ),
            //       ),
            //       child: const Text('To Third!'),
            //     ),
            //   ],
            // ),
          ],
        ),
      ), // Center
    ); // Scaffold
  }
}

class ThirdRoute extends StatelessWidget {
  const ThirdRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Third Page",
          style: TextStyle(
            fontSize: 40.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.blueGrey[900],
      ), // AppBar
      body: const Center(
          // child: Row(
          //   // Use Row instead of Column
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: <Widget>[
          //     ElevatedButton(
          //       onPressed: () {
          //         Navigator.pushNamed(context, '/second');
          //       },
          //       child: const Text(
          //         'Back!',
          //         style: TextStyle(
          //           fontSize: 30.0,
          //           fontWeight: FontWeight.bold,
          //         ),
          //       ),
          //     ),
          //   ],
          // ),
          ), // Center
    ); // Scaffold
  }
}




