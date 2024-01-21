import 'package:cloud_firestore/cloud_firestore.dart';

Future<List<QueryDocumentSnapshot>> ComboProductData() async {
  try {
    QuerySnapshot value =
        await FirebaseFirestore.instance.collection("Combo").get();
    if (value != null) {
      List<QueryDocumentSnapshot> list = [];
      list.addAll(value.docs);
      return list;
    }
  } catch (e) {
    print(e.toString());
  }
  return [];
}

Future<List<QueryDocumentSnapshot>> burgerProductData() async {
  try {
    QuerySnapshot value =
        await FirebaseFirestore.instance.collection("Burger").get();
    if (value != null) {
      List<QueryDocumentSnapshot> list = [];
      list.addAll(value.docs);
      return list;
    }
  } catch (e) {
    print(e.toString());
  }
  return [];
}

Future<List<QueryDocumentSnapshot>> waterProductData() async {
  try {
    QuerySnapshot value =
        await FirebaseFirestore.instance.collection("water").get();
    if (value != null) {
      List<QueryDocumentSnapshot> list = [];
      list.addAll(value.docs);
      return list;
    }
  } catch (e) {
    print(e.toString());
  }
  return [];
}
