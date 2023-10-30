import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class CityCapturePage extends StatelessWidget {
  final TextEditingController cityController = TextEditingController();

  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  // Function to store the city in Firestore
  void storeCity(String city) async {
    try {
      await firestore.collection('Location').add({'cityName': city});
    } catch (e) {
      print('Error storing city: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Capture City'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                controller: cityController,
                decoration: const InputDecoration(labelText: 'Set City'),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () {
                      // Get the value from the text field
                      String city = cityController.text;

                      // Store the city in Firestore
                      storeCity(city);
                    },
                    child:const Text('Next'),
                  ),
                  const SizedBox(width: 20),
                  IconButton(
                    onPressed: () {
                      // Close the page or navigate back
                      // Navigator.pop(context);
                      Navigator.pushNamed(context, '/weather');
                    },
                    icon: const Icon(Icons.close, size: 24),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FeedbackPage extends StatelessWidget {
  final TextEditingController feedbackController = TextEditingController();
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  void storeFeedback(String feedback) async {
    if (feedback.isNotEmpty) {
      try {
        await firestore.collection('feedbacks').add({'feedbackText': feedback});
        feedbackController.clear(); // Clear the text field after storing feedback
      } catch (e) {
        print('Error storing feedback: $e');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Provide Feedback'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                controller: feedbackController,
                decoration: const InputDecoration(labelText: 'Enter your feedback (5 words max)'),
                maxLength: 5, // Set the maximum length to 5 words
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  String feedback = feedbackController.text.trim();
                  storeFeedback(feedback);
                },
                child: const Text('Submit Feedback'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

