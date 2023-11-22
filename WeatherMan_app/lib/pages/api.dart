import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

final TextEditingController _searchController = TextEditingController();

class SearchBar extends StatelessWidget {
  final TextEditingController searchController;
  final Function(String) onSearch;

  const SearchBar({
    super.key,
    required this.searchController,
    required this.onSearch,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: MediaQuery.of(context).size.width / 2,
      // padding: const EdgeInsets.only(left: 30, right: 70),
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      decoration: BoxDecoration(
        color: const Color(0xFFA09FB1),
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Row(
        mainAxisAlignment:
            MainAxisAlignment.spaceBetween, // Keep the icon on the right side
        children: [
          Expanded(
            child: TextField(
              controller: searchController,
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: 'Search City',
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              final searchText = searchController.text;
              onSearch(searchText);
              // Unfocus the keyboard
              FocusScope.of(context).unfocus();
              searchController.clear(); // Clear the text field after searching
            },
          ),
        ],
      ),
    );
  }
}

class ThirdRoute extends StatefulWidget {
  const ThirdRoute({Key? key}) : super(key: key);

  @override
  _ThirdRouteState createState() => _ThirdRouteState();
}

class _ThirdRouteState extends State<ThirdRoute> {
  final TextEditingController _searchController = TextEditingController();
  String city = 'Nairobi';
  String weatherIconUrl = 'https://openweathermap.org/img/wn/01d@2x.png';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1E213A),
      body: CustomScrollView(
        slivers: <Widget>[
          const SliverAppBar(
            backgroundColor: Color(0xFF1E213A),
            expandedHeight: 0, // Empty app bar, set to 0 height
            floating: false,
            pinned: false,
          ),
          SliverToBoxAdapter(
            child: Container(
              width: MediaQuery.of(context).size.width /
                  2, // Set the width of the search bar
              padding: const EdgeInsets.only(left: 10, right: 100),
              child: SearchBar(
                searchController: _searchController,
                onSearch: (searchText) {
                  setState(() {
                    city = searchText;
                  });
                },
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: FutureBuilder<Map<String, dynamic>>(
              future: fetchCityData(city),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (!snapshot.hasData || snapshot.data == null) {
                  return const Center(child: Text('No data available'));
                } else {
                  final locationData = snapshot.data!;
                  final latitude = locationData["lat"];
                  final longitude = locationData["lon"];
                  final cityName = locationData["name"];

                  return FutureBuilder<Map<String, dynamic>>(
                    future: fetchWeatherData(latitude, longitude),
                    builder: (context, weatherSnapshot) {
                      if (weatherSnapshot.connectionState ==
                          ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (weatherSnapshot.hasError) {
                        return Center(
                            child: Text('Error: ${weatherSnapshot.error}'));
                      } else if (!weatherSnapshot.hasData ||
                          weatherSnapshot.data == null) {
                        return const Center(
                            child: Text('No weather data available'));
                      } else {
                        final weatherData = weatherSnapshot.data!;
                        final weatherDescription =
                            weatherData["text"] ?? 'Weather description N/A';
                        final weatherIcon = weatherData["Icon"] ?? '01d';
                        // show the weather icon on console
                        print(weatherIcon);
                        // final pressure = weatherData["pressure"] ?? 0;
                        // final humidity = weatherData["humidity"] ?? 0;
                        final temp = weatherData["temp"] ?? 0;
                        // final windSpeed = weatherData["wind-speed"] ?? 0;
                        final celsiusTemp = (temp - 273.15).toInt();

                        weatherIconUrl =
                            'https://openweathermap.org/img/wn/$weatherIcon@4x.png';

                        return Column(
                          // crossAxisAlignment: CrossAxisAlignment.center,
                          // mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // String weatherIconUrl = 'https://openweathermap.org/img/wn/$weatherIcon@2x.png';
                            Image.network(
                              weatherIconUrl,
                              width: 200.0,
                              height: 100.0,
                            ),
                            // Icon(getWeatherIcon(weatherIcon), size: 150.0),
                            const SizedBox(height: 20.0),
                            RichText(
                              text: TextSpan(
                                style: const TextStyle(
                                  fontSize: 100.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                                children: [
                                  TextSpan(
                                      text: '$celsiusTemp',
                                      style: const TextStyle(
                                        fontSize: 120.0,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFFE7E7EB),
                                      )),
                                  const TextSpan(
                                    text: '°C',
                                    style: TextStyle(
                                        fontSize: 50.0,
                                        color: Color(0xFFA09FB1)),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 20.0),
                            Text(
                              '$weatherDescription',
                              style: const TextStyle(
                                fontSize: 40.0,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFFA09FB1),
                              ),
                            ),
                            const SizedBox(height: 20.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.room,
                                  size: 27.0,
                                  color: Color(0xFFA09FB1),
                                ),
                                const SizedBox(width: 18.0),
                                Text(
                                  '$cityName',
                                  style: const TextStyle(
                                    fontSize: 30.0,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFFA09FB1),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        );
                      }
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

// IconData getWeatherIcon(String weatherIconCode) {
//   switch (weatherIconCode) {
//     case '01d':
//       return Icons.wb_sunny;
//     case '01n':
//       return Icons.nightlight_round;
//     case '02d':
//     case '02n':
//       return Icons.wb_cloudy;
//     case '03d':
//     case '03n':
//       return Icons.cloud;
//     case '04d':
//     case '04n':
//       return Icons.cloud_queue;
//     case '09d':
//     case '09n':
//       return Icons.waves;
//     case '10d':
//     case '10n':
//       return Icons.beach_access;
//     case '11d':
//     case '11n':
//       return Icons.flash_on;
//     case '13d':
//     case '13n':
//       return Icons.ac_unit;
//     case '50d':
//     case '50n':
//       return Icons.cloud;
//     default:
//       return Icons.cloud;
//   }
// }

Future<Map<String, dynamic>> fetchCityData(String city,
    {http.Client? client}) async {
  // final apiKey = dotenv.env['weathermanAPI_Key'];
  client ??= http.Client();
  const apiKey = 'be5a05dee1eb79acf6457d04817d0300';
  print(apiKey);
  final response = await http.get(Uri.parse(
    'http://api.openweathermap.org/geo/1.0/direct?q=$city&limit=2&appid=$apiKey',
  ));

  if (response.statusCode == 200) {
    final List<dynamic> data = jsonDecode(response.body);
    if (data.isNotEmpty) {
      final location = data[0];
      return {
        "name": location["name"],
        "lat": location["lat"],
        "lon": location["lon"],
        "country": location["country"],
        "state": location["state"],
      };
    }
  }
  throw Exception('Failed to load weather data');
}

Future<Map<String, dynamic>> fetchWeatherData(double latitude, double longitude,
    {http.Client? client}) async {
  client ??= http.Client();
  const apiKey = 'be5a05dee1eb79acf6457d04817d0300';
  final response = await http.get(Uri.parse(
    'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey',
  ));

  if (response.statusCode == 200) {
    final Map<String, dynamic> data = jsonDecode(response.body);
    if (data.isNotEmpty) {
      return {
        "city": data["name"],
        "text": data["weather"][0]["description"],
        "Icon": data["weather"][0]["icon"],
        "state": data["state"],
        "pressure": data["main"]["pressure"],
        "humidity": data["main"]["humidity"],
        "temp": data["main"]["temp"],
        "wind-speed": data["wind"]["speed"],
      };
    }
  }
  throw Exception('Failed to load weather data');
}
