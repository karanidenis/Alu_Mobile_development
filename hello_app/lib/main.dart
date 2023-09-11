import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Hello World'),
          backgroundColor: Colors.blueGrey[900],
        ),
        body: const Center(
          child: Text(
            'Hello World',
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    ),
  );
}
