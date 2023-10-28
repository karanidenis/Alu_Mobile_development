import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hello_app/database_pages.dart/database.dart';
import 'package:fluttertoast/fluttertoast.dart';

// Apply CRUD operations
class ReadData extends StatefulWidget {
  const ReadData({super.key});

  @override
  State<ReadData> createState() => _ReadDataState();
}

class _ReadDataState extends State<ReadData> {
  String? firstname, lastname, age, id;

  TextEditingController textcontroller = TextEditingController();

  searchUser(String name) async {
    QuerySnapshot querySnapshot = await DatabaseMethods().getthisUserInfo(name);

    id = querySnapshot.docs[0].id;

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Read Data"),
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
                "Write User First Name",
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
              padding: const EdgeInsets.symmetric(vertical: 3.0, horizontal: 20.0),
              margin: const EdgeInsets.symmetric(horizontal: 20.0),
              decoration: BoxDecoration(
                  color: const Color(0xFF4c59a5),
                  borderRadius: BorderRadius.circular(22)),
              child: TextField(
                controller: textcontroller,
                decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Enter First Name',
                    hintStyle: TextStyle(color: Colors.white60)),
                style: const TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(
              height: 60.0,
            ),
            GestureDetector(
              onTap: () {
                searchUser(textcontroller.text);
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
                    "Search",
                    style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  )),
                ),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            GestureDetector(
              onTap: () async {
                await DatabaseMethods().UpdateUserData("25", id!);
                searchUser(textcontroller.text); 
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
                    "Update",
                    style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  )),
                ),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            GestureDetector(
              onTap: () async {
                await searchUser(textcontroller.text);
                await DatabaseMethods().DeleteUserData(id!);
                 Fluttertoast.showToast(
        msg: "User Data Deleted Successfully!!!",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
    );
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
                    "Delete",
                    style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  )),
                ),
              ),
            ),
            const SizedBox(
              height: 90.0,
            ),
            firstname == null
                ? Container()
                : Center(
                    child: Text(
                      "First Name :  ${firstname!}",
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
            const SizedBox(
              height: 10.0,
            ),
            lastname == null
                ? Container()
                : Center(
                    child: Text(
                      "Last Name :  ${lastname!}",
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
            const SizedBox(
              height: 10.0,
            ),
            age == null
                ? Container()
                : Center(
                    child: Text(
                      "Age :  ${age!}",
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w500),
                    ),
                  )
          ],
        ),
      ),
    );
  }
}