import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hello_app/database_pages.dart/database.dart';

//screen for location
class Geometry extends StatefulWidget {
  const Geometry({super.key});
  static const primarybackground = Color(0xFF1E213A);

  @override
  State<Geometry> createState() => _GeoState();
}

class _GeoState extends State<Geometry> {
  uploadData() async {
    Map<String, dynamic> uploaddata = {
      "Location": userlocationcontroller.text,
      "Country": usercountrycontroller.text,
      "Time Zone": usertimezonecontroller.text
    };

    await DataGeoMethods().addUserDetails(uploaddata);
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

//Screen for feedback
class Feedback extends StatefulWidget {
  const Feedback({super.key});
  static const primarybackground = Color(0xFF1E213A);

  @override
  State<Feedback> createState() => _FeedbackState();
}

class _FeedbackState extends State<Feedback> {
  uploadData() async {
    Map<String, dynamic> uploaddata = {
      "Email": feedbackemailcontroller.text,
      "Bug Type": feedbackbugtypecontroller.text,
      "Message": feedbackmessagecontroller.text
    };

    await DataFeedMethods().addFeedDetails(uploaddata);
    Fluttertoast.showToast(
        msg: "Data Uploaded Successfully",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  TextEditingController feedbackemailcontroller = TextEditingController();
  TextEditingController feedbackbugtypecontroller = TextEditingController();
  TextEditingController feedbackmessagecontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Enter Your Email"),
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
                "Email",
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
                controller: feedbackemailcontroller,
                decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Email',
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
                "Enter Bug Type",
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
                controller: feedbackbugtypecontroller,
                decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Bug Type',
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
                "Message",
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
                controller: feedbackemailcontroller,
                decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Message',
                    hintStyle: TextStyle(color: Colors.white60)),
                style: const TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(
              height: 50.0,
            ),
            GestureDetector(
              onTap: () {
                uploadData();
              },
              child: Center(
                child: Container(
                  width: 150,
                  padding: EdgeInsets.symmetric(vertical: 5.0),
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
