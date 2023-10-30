import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hello_app/database_pages.dart/database.dart';


// Apply CRUD operations to feedback collection
class ReadFeedback extends StatefulWidget {
  const ReadFeedback({super.key});

  @override
  State<ReadFeedback> createState() => _ReadFeedbackState();
}

class _ReadFeedbackState extends State<ReadFeedback> {
  String? email, bugtype, message;

  TextEditingController textcontroller = TextEditingController();

  searchFeedback(String email) async {
    QuerySnapshot querySnapshot =
        await DataFeedMethods().getthisUserInfo(email);

    email = querySnapshot.docs[0].id;

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
                "Enter Your Email",
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
                controller: textcontroller,
                decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Email',
                    hintStyle: TextStyle(color: Colors.white60)),
                style: const TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(
              height: 60.0,
            ),
            GestureDetector(
              onTap: () {
                searchFeedback(textcontroller.text);
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
                await DataFeedMethods().UpdateFeedData("Bug Type", email!);
                searchFeedback(textcontroller.text);
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
                await searchFeedback(textcontroller.text);
                await DataFeedMethods().DeleteFeedData(
                    EmailAuthProvider.EMAIL_LINK_SIGN_IN_METHOD!);
                Fluttertoast.showToast(
                    msg: "User Data Deleted Successfully!!!",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.CENTER,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.red,
                    textColor: Colors.white,
                    fontSize: 16.0);
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
            EmailAuthCredential == null
                ? Container()
                : Center(
                    child: Text(
                      "Email :  ${EmailAuthProvider.EMAIL_LINK_SIGN_IN_METHOD!}",
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
            const SizedBox(
              height: 10.0,
            ),
            bugtype == null
                ? Container()
                : Center(
                    child: Text(
                      "Bug Type : bugtype!",
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
            const SizedBox(
              height: 10.0,
            ),
            message == null
                ? Container()
                : Center(
                    child: Text(
                      "Message : message!",
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
