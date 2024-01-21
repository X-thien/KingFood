import 'package:burgerapp/config/color.dart';
import 'package:burgerapp/provider/review_cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class SingleItem extends StatefulWidget {
  bool isBool = false;
  String productImage;
  String productName;
  int productPrice;
  String productId;
  int productQuantity;
  Function onDelete;
  SingleItem({
    super.key,
    required this.isBool,
    required this.productImage,
    required this.productName,
    required this.productPrice,
    required this.productId,
    required this.productQuantity,
    required this.onDelete,
  });

  @override
  State<SingleItem> createState() => _SingleItemState();
}

class _SingleItemState extends State<SingleItem> {
  // ReviewCartProvider reviewCartProvider;
  late int count;
  getCount() {
    setState(() {
      count = widget.productQuantity;
    });
  }

  @override
  void initState() {
    super.initState();
    getCount();
  }

  @override
  Widget build(BuildContext context) {
    getCount();
    ReviewCartProvider reviewCartProvider =
        Provider.of<ReviewCartProvider>(context);
    reviewCartProvider.getReviewCartData();
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  height: 100,
                  child: Center(
                    child: Image.network(
                      widget.productImage,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  height: 100,
                  child: Column(
                    mainAxisAlignment: widget.isBool == false
                        ? MainAxisAlignment.spaceAround
                        : MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.productName,
                            style: TextStyle(
                              color: textColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "${widget.productPrice}\k VND",
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      widget.isBool == false
                          ? Container(
                              margin: EdgeInsets.only(right: 15),
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              height: 35,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      "Topping: 0",
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                  Center(
                                    child: Icon(
                                      Icons.arrow_drop_down,
                                      size: 20,
                                      color: primaryColor,
                                    ),
                                  )
                                ],
                              ),
                            )
                          : Text("Topping: 0"),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  height: 100,
                  padding: widget.isBool == false
                      ? EdgeInsets.symmetric(horizontal: 15, vertical: 32)
                      : EdgeInsets.only(left: 15, right: 15),
                  child: widget.isBool == false
                      ? Container(
                          height: 25,
                          width: 50,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.add,
                                  color: primaryColor,
                                  size: 20,
                                ),
                                Text(
                                  "ADD",
                                  style: TextStyle(
                                    color: primaryColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      : Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: Column(
                            children: [
                              ElevatedButton(
                                  onPressed: () {
                                    reviewCartProvider
                                        .reviewCartDataDelete(widget.productId);
                                  },
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.white,
                                  ),
                                  child: Icon(
                                    Icons.delete,
                                    color: primaryColor,
                                    size: 20,
                                  )),
                              SizedBox(height: 5),
                              Container(
                                height: 25,
                                width: 75,
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: Center(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          if (count == 1) {
                                            Fluttertoast.showToast(
                                                msg: "minimum limit");
                                          } else {
                                            setState(() {
                                              count--;
                                            });
                                            reviewCartProvider
                                                .updateReviewCartData(
                                              cartId: widget.productId,
                                              cartName: widget.productName,
                                              cartImage: widget.productImage,
                                              cartPrice: widget.productPrice,
                                              cartQuantity: count,
                                            );
                                          }
                                        },
                                        child: Icon(
                                          Icons.remove,
                                          color: primaryColor,
                                          size: 20,
                                        ),
                                      ),
                                      Text(
                                        "$count",
                                        style: TextStyle(
                                          color: primaryColor,
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          if (count < 10) {
                                            setState(() {
                                              count++;
                                            });
                                            reviewCartProvider
                                                .updateReviewCartData(
                                              cartId: widget.productId,
                                              cartName: widget.productName,
                                              cartImage: widget.productImage,
                                              cartPrice: widget.productPrice,
                                              cartQuantity: count,
                                            );
                                          }
                                        },
                                        child: Icon(
                                          Icons.add,
                                          color: primaryColor,
                                          size: 20,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                ),
              ),
            ],
          ),
        ),
        widget.isBool == false
            ? Container()
            : Divider(
                height: 1,
                color: Colors.black54,
              )
      ],
    );
  }
}
