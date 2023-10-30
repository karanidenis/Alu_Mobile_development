import 'package:flutter/material.dart';

class Location extends StatefulWidget {
  @override
  _LocationState createState() => _LocationState();
}

class _LocationState extends State<Location> {
  TextEditingController userLocationController = TextEditingController();

  uploadData() async {
    String location = userLocationController.text;
    // You can use the 'location' variable in your data upload process
    Map<String, dynamic> uploadData = {"Location": location};
    // Add your data upload logic here
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1E213A),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 200), // Adding space instead of an AppBar
          Text(
            'Default Location',
            style: TextStyle(fontSize: 24.0, color: Colors.white),
          ),
          SizedBox(height: 50),

          TextField(
            controller: userLocationController,
            decoration: InputDecoration(
              labelText: 'Enter Location',
              labelStyle: TextStyle(color: Colors.white),
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
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              uploadData();
            },
            child: Text('Upload Data'),
          ),
          SizedBox(height: 20), // Add space between the two buttons
          ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/third');
              },
              child: const Text('Checkout The Weather')),
        ],
      ),
    );
  }
}
