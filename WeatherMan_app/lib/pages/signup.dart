import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  // Function to handle user registration
  Future<void> _registerUser(BuildContext context) async {
    try {
      final UserCredential authResult = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: emailController.text, password: passwordController.text);
      final User? user = authResult.user;

      if (user != null) {
        print("Sign up succeeded");
        // return user;
      }

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

      return;
    }
  }

  Future<User?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await googleSignIn.signIn();

      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;

        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );

        final UserCredential authResult =
            await _auth.signInWithCredential(credential);
        final User? user = authResult.user;

        if (user != null) {
          // Ensure the user is not anonymous
          assert(!user.isAnonymous);
          // Ensure the user is the current user
          assert(user.uid == _auth.currentUser!.uid);

          print('Google Sign In succeeded: $user');
          return user;
        }
      }
    } catch (error) {
      print(error);
      return null;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1E213A),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 100), // Adding space instead of an AppBar
            const Text(
              'Sign Up',
              style: TextStyle(fontSize: 24.0, color: Colors.white),
            ),
            const SizedBox(height: 30),
            TextFormField(
              controller: nameController,
              decoration: const InputDecoration(
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
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 20),

            TextFormField(
              controller: emailController,
              decoration: const InputDecoration(
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
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: passwordController,
              decoration: const InputDecoration(
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
            const SizedBox(height: 20),
            Container(
              width: double.infinity,
              child: InkWell(
                onTap: signInWithGoogle,
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 15),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/google.png', // Replace with your Google icon asset
                        height: 24,
                        width: 15,
                      ),
                      SizedBox(width: 10),
                      Text(
                        'Continue with Google',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
