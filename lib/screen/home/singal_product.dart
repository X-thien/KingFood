import 'package:burgerapp/config/colors.dart';
import 'package:burgerapp/screen/product_overview/product_overview.dart';
import 'package:burgerapp/widgets/count.dart';
import 'package:flutter/material.dart';
import 'package:burgerapp/config/color.dart';
// import 'package:burgerapp/config/colors.dart';

class SingalProduct extends StatelessWidget {
  final String productImage;
  final String productName;
  final int productPrice;
  final Function onTap;
  final String productId;
  SingalProduct({
    required this.productImage,
    required this.productName,
    required this.onTap,
    required this.productPrice,
    required this.productId,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(right: 10),
            height: 250,
            width: 170,
            decoration: BoxDecoration(
              color: Color(0xffd9dad9),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ProductOverView(
                          productName: productName,
                          productImage: productImage,
                          productPrice: productPrice,
                          productId: productId,
                        ),
                      ),
                    );
                  },
                  child: Container(
                    height: 140,
                    padding: EdgeInsets.all(5),
                    width: double.infinity,
                    child: Image.network(
                      productImage,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 65,
                          child: Column(
                            children: [
                              Text(
                                productName,
                                style: TextStyle(
                                  color: textColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "$productPrice k VND",
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                        // SizedBox(height: 5),
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.only(left: 4),
                                height: 30,
                                width: 45,
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                  // color: Colors.black,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        "Topping",
                                        style: TextStyle(fontSize: 10),
                                      ),
                                    ),
                                    Center(
                                      child: Icon(
                                        Icons.arrow_drop_down,
                                        size: 20,
                                        color: Colors.yellow,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(width: 5),
                            Count(
                              productId: productId,
                              productImage: productImage,
                              productName: productName,
                              productPrice: productPrice,
                            ),
                            // Expanded(
                            //   child: Container(
                            //     height: 30,
                            //     width: 50,
                            //     decoration: BoxDecoration(
                            //       border: Border.all(color: Colors.grey),
                            //       // color: Colors.grey,
                            //       borderRadius: BorderRadius.circular(10),
                            //     ),
                            //     child: Row(
                            //       mainAxisAlignment: MainAxisAlignment.center,
                            //       children: [
                            //         Icon(
                            //           Icons.remove,
                            //           size: 20,
                            //           color: AppColors.ColorOrange,
                            //         ),
                            //         Text(
                            //           "1",
                            //           style: TextStyle(
                            //               color: AppColors.textColor,
                            //               fontWeight: FontWeight.bold),
                            //         ),
                            //         Icon(
                            //           Icons.add,
                            //           size: 20,
                            //           color: AppColors.ColorOrange,
                            //         ),
                            //       ],
                            //     ),
                            //   ),
                            // ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
