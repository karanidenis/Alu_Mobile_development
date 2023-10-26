import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AdminPage extends StatefulWidget {
  @override
  _AdminPageState createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  List<UserDetails> users = [];

  @override
  void initState() {
    super.initState();
    getUsersFromFirebase();
  }

  Future<void> getUsersFromFirebase() async {
    final List<User> userList =
        (await FirebaseAuth.instance.authStateChanges().toList()) as List<User>;

    // Fetch user details from Firebase
    for (User user in userList) {
      // Here, you can fetch additional user details, such as email and location, from your database.
      // For demonstration purposes, we'll use the user's email as the email and location.
      String email = user.email ?? 'N/A';
      String location = 'Location Not Available';

      users.add(UserDetails(user.displayName ?? 'N/A', email, location));
    }

    setState(() {}); // Trigger a rebuild to display the data
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Page'),
      ),
      body: SingleChildScrollView(
        child: DataTable(
          columns: const <DataColumn>[
            DataColumn(
              label: Text('Username'),
            ),
            DataColumn(
              label: Text('Email'),
            ),
            DataColumn(
              label: Text('Location'),
            ),
          ],
          rows: users
              .map(
                (user) => DataRow(
                  cells: <DataCell>[
                    DataCell(Text(user.username)),
                    DataCell(Text(user.email)),
                    DataCell(Text(user.location)),
                  ],
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}

class UserDetails {
  final String username;
  final String email;
  final String location;

  UserDetails(this.username, this.email, this.location);
}

void main() {
  runApp(MaterialApp(home: AdminPage()));
}
