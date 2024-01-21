import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class UserProvider with ChangeNotifier {
  Future<void> addUserData(
      {required String userName,
      required String userEmail,
      required String pass}) async {
    UserCredential usercredential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: userEmail, password: pass);
    String uid = usercredential.user?.uid ?? "";

    await FirebaseFirestore.instance.collection("usersData").doc(uid).set(
      // .doc(currentUser?.uid)
      //   .set(
      {"userName": userName, "userEmail": userEmail, "uid": uid, "pass": pass},
    );
  }
}

Future<Map<String, dynamic>> getUserData() async {
  try {
    User? user = await FirebaseAuth.instance.currentUser;
    if (user != null) {

      DocumentSnapshot<Map<String, dynamic>> users = await FirebaseFirestore
          .instance
          .collection("usersData")
          .doc(user.uid)
          .get();

      if (users.exists) {
        Map<String, dynamic> userData = users.data()!;

        print('ten:${userData['userName']}');
        return userData;
      }
    }
  } catch (e) {
    print(e.toString());
  }
  return {};
}
