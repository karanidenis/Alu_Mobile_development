import 'package:cloud_firestore/cloud_firestore.dart';

class DataFeedMethods {
  Future addFeedDetails(Map<String, dynamic> userInfoMap) async {
    return await FirebaseFirestore.instance
        .collection("feedback")
        .doc()
        .set(userInfoMap);
  }

  Future<QuerySnapshot> getthisUserInfo(String email) async {
    return await FirebaseFirestore.instance
        .collection("feedback")
        .where("Email", isEqualTo: email)
        .get();
  }

  Future UpdateFeedData(String bugtype, String id) async {
    return await FirebaseFirestore.instance
        .collection("feedback")
        .doc(id)
        .update({"Bug Type": bugtype});
  }

Future DeleteFeedData(String id) async {
    return await FirebaseFirestore.instance
        .collection("feedback")
        .doc(id)
        .delete();
  }
}