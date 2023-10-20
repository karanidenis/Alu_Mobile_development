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
        actions: [
          IconButton(
            icon: const Icon(Icons.navigate_next),
            tooltip: 'Go to the registration page',
            onPressed: () {
              Navigator.pushNamed(context, '/login');
            },
          ),
        ],
      ),
      body: const Center(
        child: Padding(
          padding: EdgeInsets.only(top: 10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Login',
                style: TextStyle(fontSize: 24.0, color: Colors.white),
              ),
              SizedBox(height: 20), // Add space between text and the form
              LoginForm(),
              // Add your login form widget here
            ],
          ),
        ),
      ),
    );
  }
}

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  // Define a static constant for the border
  static const OutlineInputBorder inputBorder = OutlineInputBorder(
    borderSide: BorderSide(
        color: Colors.transparent), // Set the border color to transparent
  );

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: <Widget>[
        // Email TextField
        const TextField(
          decoration: InputDecoration(
            labelText: 'Email',
            labelStyle: TextStyle(color: Colors.white),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.white,
                width: 2.0,
              ),
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(
                    5), // Adjust the top radius to control the length
                bottom: Radius.circular(
                    5), // Adjust the bottom radius to control the length
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.white,
              ),
              // Optional: Set border radius
            ),
          ),
          style: TextStyle(color: Colors.white),
        ),
        const SizedBox(
            height: 20), // Add space between email and password fields
        // Password TextField
        const TextField(
          decoration: InputDecoration(
            labelText: 'Password',
            labelStyle: TextStyle(color: Colors.white),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.white,
                width: 2.0,
              ),
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(
                    5), // Adjust the top radius to control the length
                bottom: Radius.circular(
                    5), // Adjust the bottom radius to control the length
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.white,
              ),
              // Optional: Set border radius
            ),
          ),
          style: TextStyle(color: Colors.white),
        ),
        const SizedBox(
            height: 20), // Add space between email and password fields
        // Password TextField
        const SizedBox(
            height: 20), // Add space between password field and the button
        const SizedBox(height: 50), // Add space here (adjust as needed)
        ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/home');
            },
            child: const Text('LOGIN ')),
        const SizedBox(height: 10), // Add space here (adjust as needed)
        InkWell(
          onTap: () {
            // Navigate to the "/registration" route
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) {
                return Scaffold(
                  appBar: AppBar(
                    title: const Text('RegistrationPage'),
                  ),
                  body: const Center(
                    child: Text('This is the Registration screen.'),
                  ),
                );
              },
            ));
          },
          child: const Text(
            'Forgot Password',
            style: TextStyle(
              fontSize: 30,
              color: Colors.blue,
              decoration: TextDecoration.underline,
            ),
          ),
        ),

        const SizedBox(
            height: 20), // Add space between password field and the button
        ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/registration');
          },
          child: const Text('SIGN UP'),
        ),
      ],
    ));
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
        actions: [
          IconButton(
            icon: const Icon(Icons.navigate_next),
            tooltip: 'Go to the homepage',
            onPressed: () {
              Navigator.pushNamed(context, '/home');
            },
          ),
        ],
      ),
      body: const Center(
        child: Padding(
          padding: EdgeInsets.only(top: 10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Sign Up',
                style: TextStyle(fontSize: 24.0, color: Colors.white),
              ),
              SizedBox(height: 20), // Add space between text and the form
              RegistrationForm(),
              // Add your login form widget here
            ],
          ),
        ),
      ),
    );
  }
}

class RegistrationForm extends StatelessWidget {
  const RegistrationForm({super.key});

  // Define a static constant for the border
  static const OutlineInputBorder inputBorder = OutlineInputBorder(
    borderSide: BorderSide(
        color: Colors.transparent), // Set the border color to transparent
  );

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: <Widget>[
        const TextField(
          decoration: InputDecoration(
            labelText: 'Full name',
            labelStyle: TextStyle(color: Colors.white),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.white,
                width: 2.0,
              ),
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(
                    5), // Adjust the top radius to control the length
                bottom: Radius.circular(
                    5), // Adjust the bottom radius to control the length
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.white,
              ),
              // Optional: Set border radius
            ),
          ),
          style: TextStyle(color: Colors.white),
        ),
        const SizedBox(
            height: 20), // Add space between email and password fields
        // Password TextField
        // Email TextField
        const TextField(
          decoration: InputDecoration(
            labelText: 'Email',
            labelStyle: TextStyle(color: Colors.white),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.white,
                width: 2.0,
              ),
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(
                    5), // Adjust the top radius to control the length
                bottom: Radius.circular(
                    5), // Adjust the bottom radius to control the length
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.white,
              ),
              // Optional: Set border radius
            ),
          ),
          style: TextStyle(color: Colors.white),
        ),
        const SizedBox(
            height: 20), // Add space between email and password fields
        // Password TextField
        const TextField(
          decoration: InputDecoration(
            labelText: 'Password',
            labelStyle: TextStyle(color: Colors.white),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.white,
                width: 2.0,
              ),
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(
                    5), // Adjust the top radius to control the length
                bottom: Radius.circular(
                    5), // Adjust the bottom radius to control the length
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.white,
              ),
              // Optional: Set border radius
            ),
          ),
          style: TextStyle(color: Colors.white),
        ),
        const SizedBox(
            height: 20), // Add space between email and password fields
        // Password TextField
        const SizedBox(
            height: 20), // Add space between password field and the button
        const SizedBox(height: 50), // Add space here (adjust as needed)
        ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/login');
            },
            child: const Text('SIGN UP ')),
        const SizedBox(height: 10), // Add space here (adjust as needed)
        InkWell(
          onTap: () {
            // Navigate to the "/registration" route
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) {
                return Scaffold(
                  appBar: AppBar(
                    title: const Text('RegistrationPage'),
                  ),
                  body: const Center(
                    child: Text('This is the Registration screen.'),
                  ),
                );
              },
            ));
          },
          child: const Text(
            'ALREADY HAVE AN ACCOUNT?',
            style: TextStyle(
              fontSize: 20,
              color: Colors.blue,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      ],
    ));
  }
}

// class PasswordForm extends StatefulWidget {
//   const PasswordForm({super.key});

// class PasswordFormState extends State<PasswordForm> {
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//   String _password = '';

//   void _submitForm() {
//     if (_formKey.currentState!.validate()) {
//       // Form is valid, you can process the password here
//       // logger.d('Form submitted with valid data');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Password Form Example'),
//       ),
//       body: Form(
//         key: _formKey,
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             children: <Widget>[
//               TextFormField(
//                 obscureText: true,
//                 decoration: InputDecoration(labelText: 'Password'),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter a password';
//                   }
//                   return null;
//                 },
//                 onSaved: (value) {
//                   _password = value!;
//                 },
//               ),
//               const SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: _submitForm,
//                 child: const Text('Submit'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
// }