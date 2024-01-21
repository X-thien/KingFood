import 'package:burgerapp/config/color.dart';
import 'package:burgerapp/models/review_cart_model.dart';
import 'package:burgerapp/provider/review_cart_provider.dart';
import 'package:burgerapp/screen/order/xacnhan.dart';
import 'package:burgerapp/widgets/single_item.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class reviewCart extends StatelessWidget {
  const reviewCart({super.key});

  @override
  Widget build(BuildContext context) {
    ReviewCartProvider reviewCartProvider = Provider.of(context);
    reviewCartProvider.getReviewCartData();

    return Scaffold(
      bottomNavigationBar: ListTile(
        title: Text("Total Aout"),
        subtitle: Text(
          "${reviewCartProvider.getTotalPrice()} \k VND",
          style: TextStyle(color: Colors.green[900]),
        ),
        trailing: Container(
          width: 160,
          child: MaterialButton(
            child: Text("Submit"),
            color: primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => Xacnhan(),
                  ),
                );
            },
          ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text(
          "Review Cart",
          style: TextStyle(
            color: textColor,
            fontSize: 18,
          ),
        ),
      ),
      body: reviewCartProvider.getReviewCartDataList.isEmpty
          ? Center(
              child: Text("No DATA"),
            )
          : ListView.builder(
              itemCount: reviewCartProvider.getReviewCartDataList.length,
              itemBuilder: (context, index) {
                ReviewCartModel data =
                    reviewCartProvider.getReviewCartDataList[index];
                return Column(
                  children: [
                    SizedBox(height: 10),
                    SingleItem(
                      isBool: true,
                      productImage: data.cartImage,
                      productName: data.cartName,
                      productPrice: data.cartPrice,
                      productId: data.cartId,
                      productQuantity: data.cartQuantity,
                      onDelete: () {},
                    ),
                  ],
                );
              },
            ),
    );
  }
}
