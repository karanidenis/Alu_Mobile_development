import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'Login.dart';
import 'Signup.dart';

import 'api.dart';
import 'firebase_options.dart';
import 'home.dart';
// await Firebase.initializeApp(
//   options: DefaultFirebaseOptions.currentPlatform,
// );

// check user status
// FirebaseAuth.instance
//   .authStateChanges()
//   .listen((User? user) {
//     if (user == null) {
//       print('User is currently signed out!');
//     } else {
//       print('User is signed in!');
//     }
//   });

// // Password reset
// try {
//   final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
//     email: emailAddress,
//     password: password,
//   );
// } on FirebaseAuthException catch (e) {
//   if (e.code == 'weak-password') {
//     print('The password provided is too weak.');
//   } else if (e.code == 'email-already-in-use') {
//     print('The account already exists for that email.');
//   }
// } catch (e) {
//   print(e);
// }

// Sign in
// try {
//   final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
//     email: emailAddress,
//     password: password,
//   );
// } on FirebaseAuthException catch (e) {
//   if (e.code == 'user-not-found') {
//     print('No user found for that email.');
//   } else if (e.code == 'wrong-password') {
//     print('Wrong password provided for that user.');
//   }
// }


// function to trigger build when the app is run
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.android);
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => const WelcomeRoute(),
      '/registration': (context) => SignUpPage(),
      '/login': (context) => LoginPage(),
      '/home': (context) => const Geometry(),
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
