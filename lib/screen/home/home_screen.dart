// ignore_for_file: camel_case_types

import 'package:burgerapp/config/colors.dart';
import 'package:burgerapp/provider/getdata.dart';
import 'package:burgerapp/screen/home/drawer_side.dart';
import 'package:burgerapp/screen/home/singal_product.dart';
import 'package:burgerapp/screen/product_overview/product_overview.dart';
import 'package:burgerapp/screen/review_cart/review_cart.dart';
import 'package:burgerapp/screen/search/search.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

// import 'package:burgerapp/screen/product_overview/'
class home_Screen extends StatefulWidget {
  const home_Screen({super.key});

  @override
  State<home_Screen> createState() => _home_ScreenState();
}

class _home_ScreenState extends State<home_Screen> {
  List<QueryDocumentSnapshot> combo = [];
  List<QueryDocumentSnapshot> burger = [];
  List<QueryDocumentSnapshot> water = [];
  getdata() async {
    combo = await ComboProductData();
    burger = await burgerProductData();
    water = await waterProductData();
    // print(data.length);
    setState(() {});
  }

  // late ProductProvider productProvider;

  Widget _buildComboProduct(context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('COMBO'),
              // Text(
              //   'view all',
              //   style: TextStyle(color: Colors.grey),
              // ),
            ],
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: 280,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: combo.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ProductOverView(
                        productName: combo[index]['productName'],
                        productImage: combo[index]['productImage'],
                        productPrice: combo[index]['productPrice'],
                        productId: combo[index]['productId'],
                      ),
                    ),
                  );
                  // showbottomsheet(context, data[index]);
                },
                child: SingalProduct(
                  productImage: combo[index]['productImage'],
                  productName: combo[index]['productName'],
                  productPrice: combo[index]['productPrice'],
                  productId: combo[index]['productId'],
                  onTap: () {},
                ),

                // Column(
                //   children: [
                //     Container(
                //       width: 150,
                //       height: 50,
                //       child: Text(
                //         "${data[index]['productName']}",
                //         textAlign: TextAlign.center,
                //         style: TextStyle(
                //             fontWeight: FontWeight.bold, fontSize: 20),
                //       ),
                //     ),
                //     //  Text("${data}"),
                //     Container(
                //       alignment: Alignment.bottomCenter,
                //       child: Text(
                //         '${data[index]['productPrice']}',
                //         textAlign: TextAlign.end,
                //         style: TextStyle(fontSize: 15),
                //       ),
                //     )
                //   ],
                // ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildBurgerProduct(context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('BURGER'),
              // Text(
              //   'view all',
              //   style: TextStyle(color: Colors.grey),
              // ),
            ],
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: 280,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: burger.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ProductOverView(
                        productName: burger[index]['productName'],
                        productImage: burger[index]['productImage'],
                        productPrice: burger[index]['productPrice'],
                        productId: burger[index]['productId'],
                      ),
                    ),
                  );
                  // showbottomsheet(context, data[index]);
                },
                child: SingalProduct(
                  productImage: burger[index]['productImage'],
                  productName: burger[index]['productName'],
                  productPrice: burger[index]['productPrice'],
                  productId: burger[index]['productId'],
                  onTap: () {},
                ),

                // Column(
                //   children: [
                //     Container(
                //       width: 150,
                //       height: 50,
                //       child: Text(
                //         "${data[index]['productName']}",
                //         textAlign: TextAlign.center,
                //         style: TextStyle(
                //             fontWeight: FontWeight.bold, fontSize: 20),
                //       ),
                //     ),
                //     //  Text("${data}"),
                //     Container(
                //       alignment: Alignment.bottomCenter,
                //       child: Text(
                //         '${data[index]['productPrice']}',
                //         textAlign: TextAlign.end,
                //         style: TextStyle(fontSize: 15),
                //       ),
                //     )
                //   ],
                // ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildWaterProduct(context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('WATER'),
              // Text(
              //   'view all',
              //   style: TextStyle(color: Colors.grey),
              // ),
            ],
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: 280,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: water.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ProductOverView(
                        productName: water[index]['productName'],
                        productImage: water[index]['productImage'],
                        productPrice: water[index]['productPrice'],
                        productId: water[index]['productId'],
                      ),
                    ),
                  );
                  // showbottomsheet(context, data[index]);
                },
                child: SingalProduct(
                  productImage: water[index]['productImage'],
                  productName: water[index]['productName'],
                  productPrice: water[index]['productPrice'],
                  productId: water[index]['productId'],
                  onTap: () {},
                ),

                // Column(
                //   children: [
                //     Container(
                //       width: 150,
                //       height: 50,
                //       child: Text(
                //         "${data[index]['productName']}",
                //         textAlign: TextAlign.center,
                //         style: TextStyle(
                //             fontWeight: FontWeight.bold, fontSize: 20),
                //       ),
                //     ),
                //     //  Text("${data}"),
                //     Container(
                //       alignment: Alignment.bottomCenter,
                //       child: Text(
                //         '${data[index]['productPrice']}',
                //         textAlign: TextAlign.end,
                //         style: TextStyle(fontSize: 15),
                //       ),
                //     )
                //   ],
                // ),
              );
            },
          ),
        ),
      ],
    );
  }

  @override
  void initState() {
    super.initState();
    getdata();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background1,
      drawer: DrawerSide(),
      appBar: AppBar(
        iconTheme: IconThemeData(color: AppColors.iconColor1),
        title: Text(
          "Home",
          style: TextStyle(color: AppColors.iconColor1, fontSize: 17),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: CircleAvatar(
              radius: 12,
              backgroundColor: AppColors.mainColor1,
              child: IconButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => Search(),
                    ),
                  );
                },
                icon: Icon(
                  Icons.search,
                  size: 17,
                  color: AppColors.iconColor1,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: CircleAvatar(
              backgroundColor: AppColors.mainColor1,
              radius: 12,
              child: IconButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => reviewCart(),
                    ),
                  );
                },
                icon: Icon(
                  Icons.shop,
                  size: 17,
                  color: AppColors.iconColor1,
                ),
              ),
            ),
          )
        ],
        backgroundColor: AppColors.background2,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: ListView(
          children: [
            Container(
              height: 180,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      "https://img.idesign.vn/2021/01/burger-king-logo-rebrand-bk-jkr_dezeen_2364_hero_2.jpg"),
                ),
                color: Colors.red,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                      child: Column(
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.only(right: 170, bottom: 20),
                            child: Container(
                                height: 60,
                                width: 120,
                                decoration: BoxDecoration(
                                    color: AppColors.background2,
                                    borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(60),
                                      bottomLeft: Radius.circular(60),
                                    )),
                                child: Center(
                                  child: Text(
                                    "BuKg",
                                    style: TextStyle(
                                        fontSize: 30,
                                        color: Colors.white70,
                                        shadows: [
                                          BoxShadow(
                                            color: Colors.red,
                                            blurRadius: 10,
                                            offset: Offset(3, 3),
                                          )
                                        ]),
                                  ),
                                )),
                          ),
                          // Text(
                          //   "30% Off",
                          //   style: TextStyle(
                          //       fontSize: 35,
                          //       color: Colors.yellow,
                          //       fontWeight: FontWeight.bold),
                          // ),
                          // Padding(
                          //   padding: const EdgeInsets.only(left: 10),
                          //   child: Text(
                          //     "Rau củ quả sạch",
                          //     style: TextStyle(
                          //         color: Colors.green[100],
                          //         fontWeight: FontWeight.bold),
                          //   ),
                          // )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(),
                  ),
                ],
              ),
            ),
            _buildComboProduct(context),
            _buildBurgerProduct(context),
            _buildWaterProduct(context),
          ],
        ),
      ),
    );
  }
}
