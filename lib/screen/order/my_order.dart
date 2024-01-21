import 'package:burgerapp/provider/order_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyOrder extends StatelessWidget {
  const MyOrder({super.key});

  @override
  Widget build(BuildContext context) {
    // OrderProvider orderProvider = Provider.of(context);
    // orderProvider.ge();

    return Scaffold(
      appBar: AppBar(
        title: Text('My Order'),
      ),
      // body: ListView.builder(
      //   itemCount: reviewCartProvider.length,
      //   itemBuilder: (context, index) {
      //     final transaction = transactionList[index];
      //     return Card(
      //       elevation: 3,
      //       margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      //       child: ListTile(
      //         leading: Icon(Icons.shopping_cart),
      //         title: Text(transaction.productName),
      //         subtitle: Text('Date: ${transaction.date}\nAmount: ${transaction.amount.toStringAsFixed(2)}'),
      //       ),
      //     );
      //   },
      // ),
    );
  }
}
