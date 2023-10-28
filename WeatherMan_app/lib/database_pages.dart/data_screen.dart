import 'package:hello_app/database_pages.dart/database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  uploadData() async {
    Map<String, dynamic> uploaddata = {
      "First Name": userfirstnamecontroller.text,
      "Last Name": userlastnamecontroller.text,
      "Age": useragecontroller.text,
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

  TextEditingController userfirstnamecontroller = new TextEditingController();
  TextEditingController userlastnamecontroller = new TextEditingController();
  TextEditingController useragecontroller = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create/Write Data"),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20.0,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30.0),
              child: Text(
                "First Name",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                    fontWeight: FontWeight.w500),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 3.0, horizontal: 20.0),
              margin: EdgeInsets.symmetric(horizontal: 20.0),
              decoration: BoxDecoration(
                  color: Color(0xFF4c59a5),
                  borderRadius: BorderRadius.circular(22)),
              child: TextField(
                controller: userfirstnamecontroller,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Your First Name',
                    hintStyle: TextStyle(color: Colors.white60)),
                style: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30.0),
              child: Text(
                "Last Name",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                    fontWeight: FontWeight.w500),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 3.0, horizontal: 20.0),
              margin: EdgeInsets.symmetric(horizontal: 20.0),
              decoration: BoxDecoration(
                  color: Color(0xFF4c59a5),
                  borderRadius: BorderRadius.circular(22)),
              child: TextField(
                controller: userlastnamecontroller,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Your Last Name',
                    hintStyle: TextStyle(color: Colors.white60)),
                style: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30.0),
              child: Text(
                "Age",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                    fontWeight: FontWeight.w500),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 3.0, horizontal: 20.0),
              margin: EdgeInsets.symmetric(horizontal: 20.0),
              decoration: BoxDecoration(
                  color: Color(0xFF4c59a5),
                  borderRadius: BorderRadius.circular(22)),
              child: TextField(
                controller: useragecontroller,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Your Age',
                    hintStyle: TextStyle(color: Colors.white60)),
                style: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(
              height: 90.0,
            ),
            GestureDetector(
              onTap: () {
                uploadData();
              },
              child: Center(
                child: Container(
                  width: 150,
                  padding: EdgeInsets.symmetric(vertical: 10.0),
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                      child: Text(
                    "Create",
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
