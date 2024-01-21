// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';

// class OrderProvider with ChangeNotifier {
//   void addOrderData({
//     required String orderId,
//     required String orderName,
//     required String orderImage,
//     required int orderPrice,
//     required int orderQuantity,
//     // required date ,
//   }) async {
//     User? user = FirebaseAuth.instance.currentUser;
//     DateTime date = DateTime.now();
//     if (user != null) {
//       FirebaseFirestore.instance.collection("MyOrder").add(
//         {
//           "orderId": orderId,
//           "orderName": orderName,
//           "orderImage": orderImage,
//           "orderPrice": orderPrice,
//           "orderQuantity": orderQuantity,
//           "orderDate": date.toLocal().toString(),
//         },
//       );
//     }
//   }
// }
