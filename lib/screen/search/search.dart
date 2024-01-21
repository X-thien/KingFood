import 'package:burgerapp/provider/getdata.dart';
import 'package:burgerapp/screen/home/singal_product.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:easy_search_bar/easy_search_bar.dart';

class Search extends StatefulWidget {
  // final List<ProductModel> search;
  // Search(this.search);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  List<QueryDocumentSnapshot> data = [];
  List<QueryDocumentSnapshot> data1 = [];

  getdata() async {
    print("data: ${data.length}");

    data.addAll(await ComboProductData());
    data.addAll(await burgerProductData());
    data.addAll(await waterProductData());
    data1 = data;
    setState(() {});
  }

  void initState() {
    super.initState();
    getdata();
  }

  String seachvalue = "";

  @override
  Widget build(BuildContext context) {
    // List<ProductModel> _searchItem = searchItem(query);
    return Scaffold(
      appBar: EasySearchBar(
        onSearch: (value) {
          seachvalue = value;
          print(value);
          if (seachvalue.isNotEmpty) {
            data1 = data
                .where((element) => element["productName"]
                    .toString()
                    .toLowerCase()
                    .contains(value))
                .toList();
          } else {
            data1 = data;
          }
          setState(() {});
        },
        title: Text("Search"),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, crossAxisSpacing: 2, childAspectRatio: 1),
            itemCount: data1.length,
            itemBuilder: (context, index) {
              return InkWell(
                  onTap: () {},
                  child: SingalProduct(
                    productImage: data1[index]['productImage'],
                    productName: data1[index]['productName'],
                    productPrice: data1[index]['productPrice'],
                    productId: data1[index]['productId'],
                    onTap: () {},
                  ));
            }),
      ),
    );
  }
}
