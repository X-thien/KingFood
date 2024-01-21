import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:burgerapp/models/product_model.dart';

class ProductProvider with ChangeNotifier {
  late ProductModel productModel;

  // List<ProductModel> search = [];
  // productModels(QueryDocumentSnapshot element) {
  //   productModel = ProductModel(
  //     productImage: element.get("productImage"),
  //     productName: element.get("productName"),
  //     productPrice: element.get("productPrice"),
  //     // productId: element.get("productId"),
  //     // productUnit: element.get("productUnit"),
  //   );
  //   search.add(productModel);
  // }

  /////////////// herbsProduct ///////////////////////////////
  List<ProductModel> herbsProductList = [];

  Future<List<QueryDocumentSnapshot>> fatchHerbsProductData() async {
    try {
      List<ProductModel> newList = [];

      QuerySnapshot value =
          await FirebaseFirestore.instance.collection("Combo").get();
      if (value != null) {
        List<QueryDocumentSnapshot> list = [];
        list.addAll(value.docs);
        return list;
      }
      // value.docs.forEach(
      //   (element) {
      //     productModel = ProductModel(
      //       productImage: element.get("productImage"),
      //       productName: element.get("productName"),
      //       productPrice: element.get("productPrice"),
      //     );
      //     newList.add(productModel);
      // productModels(element);

      // newList.add(productModel);
      //   },
      // );
      // herbsProductList = newList;
      // notifyListeners();
    } catch (e) {
      print(e.toString());
    }
    return [];
  }

  List<ProductModel> get getHerbsProductDataList {
    return herbsProductList;
  }

//////////////// Fresh Product ///////////////////////////////////////

//   List<ProductModel> freshProductList = [];

//   fatchFreshProductData() async {
//     List<ProductModel> newList = [];

//     QuerySnapshot value =
//         await FirebaseFirestore.instance.collection("Burger").get();

//     value.docs.forEach(
//       (element) {
//         productModels(element);
//         newList.add(productModel);
//       },
//     );
//     freshProductList = newList;
//     notifyListeners();
//   }

//   List<ProductModel> get getFreshProductDataList {
//     return freshProductList;
//   }

// //////////////// Root Product ///////////////////////////////////////

//   List<ProductModel> rootProductList = [];

//   fatchRootProductData() async {
//     List<ProductModel> newList = [];

//     QuerySnapshot value =
//         await FirebaseFirestore.instance.collection("water").get();

//     value.docs.forEach(
//       (element) {
//         productModels(element);
//         newList.add(productModel);
//       },
//     );
//     rootProductList = newList;
//     notifyListeners();
//   }

//   List<ProductModel> get getRootProductDataList {
//     return rootProductList;
//   }

//   /////////////////// Search Return ////////////
//   List<ProductModel> get gerAllProductSearch {
//     return search;
//   }
}
