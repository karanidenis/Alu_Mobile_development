import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hello_app/database_pages.dart/database.dart';

import 'Login.dart';
import 'RegistrationPage.dart';
import 'api.dart';
import 'firebase_options.dart';

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
      '/home': (context) => const Home(),
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

class Home extends StatefulWidget {
  const Home({super.key});
  static const primarybackground = Color(0xFF1E213A);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  uploadData() async {
    Map<String, dynamic> uploaddata = {
      "Location": userlocationcontroller.text,
      "Country": usercountrycontroller.text,
      "Time Zone": usertimezonecontroller.text
    };

    await DatabaseMethods().addUserDetails(uploaddata);
    Fluttertoast.showToast(
        msg: "Data Uploaded Successfully",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  TextEditingController userlocationcontroller = TextEditingController();
  TextEditingController usercountrycontroller = TextEditingController();
  TextEditingController usertimezonecontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Your Location"),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20.0,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 30.0),
              child: Text(
                "Location",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                    fontWeight: FontWeight.w500),
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Container(
              padding:
                  const EdgeInsets.symmetric(vertical: 3.0, horizontal: 20.0),
              margin: const EdgeInsets.symmetric(horizontal: 20.0),
              decoration: BoxDecoration(
                  color: const Color(0xFF4c59a5),
                  borderRadius: BorderRadius.circular(22)),
              child: TextField(
                controller: userlocationcontroller,
                decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Your Location',
                    hintStyle: TextStyle(color: Colors.white60)),
                style: const TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 30.0),
              child: Text(
                "Country",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                    fontWeight: FontWeight.w500),
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Container(
              padding:
                  const EdgeInsets.symmetric(vertical: 3.0, horizontal: 20.0),
              margin: const EdgeInsets.symmetric(horizontal: 20.0),
              decoration: BoxDecoration(
                  color: const Color(0xFF4c59a5),
                  borderRadius: BorderRadius.circular(22)),
              child: TextField(
                controller: usercountrycontroller,
                decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Your Country',
                    hintStyle: TextStyle(color: Colors.white60)),
                style: const TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 30.0),
              child: Text(
                "Time Zone",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                    fontWeight: FontWeight.w500),
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Container(
              padding:
                  const EdgeInsets.symmetric(vertical: 3.0, horizontal: 20.0),
              margin: const EdgeInsets.symmetric(horizontal: 20.0),
              decoration: BoxDecoration(
                  color: const Color(0xFF4c59a5),
                  borderRadius: BorderRadius.circular(22)),
              child: TextField(
                controller: usertimezonecontroller,
                decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Your Time Zone',
                    hintStyle: TextStyle(color: Colors.white60)),
                style: const TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(
              height: 90.0,
            ),
            GestureDetector(
              onTap: () {
                uploadData();
              },
              child: Center(
                child: Container(
                  width: 150,
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10)),
                  child: const Center(
                      child: Text(
                    "Add Location",
                    style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  )),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
