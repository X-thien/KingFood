import 'package:burgerapp/provider/order_provider.dart';
import 'package:burgerapp/provider/review_cart_provider.dart';
import 'package:burgerapp/screen/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Xacnhan extends StatelessWidget {
  const Xacnhan({Key? key});

  @override
  Widget build(BuildContext context) {
    ReviewCartProvider reviewCartProvider = Provider.of(context);
    reviewCartProvider.getReviewCartData();

    return Scaffold(
      appBar: AppBar(
        title: Text('Order'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Shopping Cart',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Card(
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount:
                          reviewCartProvider.getReviewCartDataList.length,
                      itemBuilder: (context, index) {
                        final product =
                            reviewCartProvider.getReviewCartDataList[index];
                        return ListTile(
                          leading: Image.network(
                            product.cartImage,
                            width: 50,
                            height: 50,
                            fit: BoxFit.cover,
                          ),
                          title: Text(product.cartName),
                          subtitle: Text(
                            '${product.cartPrice}k VND',
                          ),
                        );
                      },
                    ),
                    Divider(),
                    Text(
                      'Total: ${reviewCartProvider.getTotalPrice()}k VND',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                reviewCartProvider.getReviewCartDataList.clear();
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text('Order Placed'),
                    content: Text('Your order has been placed successfully.'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const home_Screen(),
                            ),
                          );
                        },
                        child: Text('OK'),
                      ),
                    ],
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: Text(
                  'Place Order',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
