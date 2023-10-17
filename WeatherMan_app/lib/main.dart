import 'package:flutter/material.dart';
// import 'showweather.dart';
import 'Login.dart';
import 'api.dart';

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
                      Navigator.pushNamed(context, '/login');
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

class HomeRoute extends StatelessWidget {
  const HomeRoute({Key? key}) : super(key: key);
  static const primarybackground = Color(0xFF1E213A);

  @override
  Widget build(BuildContext context) {
    const String city = 'Nairobi';

    return Scaffold(
      backgroundColor: primarybackground,
      appBar: AppBar(
        backgroundColor: primarybackground,
        title: const Text(
          "Home Page",
          style: TextStyle(
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.navigate_next),
            tooltip: 'Go to the third page',
            onPressed: () async {
              try {
                final cityData =
                    await fetchCityData(city); // Fetch city data here
                final weatherData = await fetchWeatherData(cityData["lat"],
                    cityData["lon"]); // Fetch weather data using coordinates

                Navigator.pushNamed(
                  context,
                  '/third',
                  arguments: {
                    "cityData": cityData,
                    "weatherData": weatherData,
                  }, // Pass both city and weather data as arguments
                );
              } catch (e) {
                // Handle any errors that may occur during the fetch.
                print('Error fetching data: $e');
              }
            },
          ),
        ],
      ),
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
          ],
        ),
      ),
    );
  }
}
