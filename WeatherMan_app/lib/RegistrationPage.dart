import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegistrationPage extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  RegistrationPage({super.key});

  // Function to handle user registration
  Future<void> _registerUser(BuildContext context) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        // name: nameController.text,
        email: emailController.text,
        password: passwordController.text,
      );
      // User created successfully, you can navigate to the home page or show a success message.
      Navigator.of(context).pushReplacementNamed('/home');
    } on FirebaseAuthException catch (e) {
      // Handle exceptions and show error messages to the user
      if (e.code == 'weak-password') {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('The password provided is too weak.'),
        ));
      } else if (e.code == 'email-already-in-use') {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('The account already exists for that email.'),
        ));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Registration failed. Please try again.'),
        ));
      }
    } catch (e) {
      // Handle other errors and show a generic error message
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('An error occurred. Please try again later.'),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1E213A),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 100), // Adding space instead of an AppBar
            Text(
              'Sign Up',
              style: TextStyle(fontSize: 24.0, color: Colors.white),
            ),
            SizedBox(height: 30),
            TextFormField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: 'Name',
                labelStyle: TextStyle(color: Colors.white),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 5.0, // Adjust the horizontal padding
                  vertical: 5.0, // Adjust the vertical padding
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.white,
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(5),
                    bottom: Radius.circular(5),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.white,
                  ),
                ),
              ),
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(height: 20),

            TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                labelStyle: TextStyle(color: Colors.white),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 5.0, // Adjust the horizontal padding
                  vertical: 5.0, // Adjust the vertical padding
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.white,
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(5),
                    bottom: Radius.circular(5),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.white,
                  ),
                ),
              ),
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
                labelStyle: TextStyle(color: Colors.white),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 5.0, // Adjust the horizontal padding
                  vertical: 5.0, // Adjust the vertical padding
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.white,
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(5),
                    bottom: Radius.circular(5),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.white,
                  ),
                ),
                // obscure text: true,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _registerUser(context);
              },
              child: const Text('Sign Up'),
            ),
            const SizedBox(height: 20),
            const Text(
              'Already have an account? Login',
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.white, // Set text color to white
                fontWeight: FontWeight
                    .bold, // Make the text blue or your preferred color
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // Navigate to the login page when the "Login" button is pressed
                Navigator.of(context).pushReplacementNamed('/login');
              },
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
