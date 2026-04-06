import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sushi_man/components/button.dart';

import 'package:sushi_man/models/food.dart';
import 'package:sushi_man/models/shop.dart';
import 'package:sushi_man/themes/colors.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  void removeFromCart(BuildContext context, Food food) {
    final shop = context.read<Shop>();

    shop.removeFromCart(food);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Shop>(
      builder: (context, value, child) => Scaffold(
        appBar: AppBar(
          title: Text('My Cart'),
          centerTitle: true,
          backgroundColor: MyColors.primary,
          foregroundColor: Colors.white,
        ),
        body: Column(
          children: [
            //List cart
            Expanded(
              child: buildListCart(value),
            ),

            //CTA - Pay Button
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: MyButton(text: 'Pay Now', opacity: false, onTap: (){}),
            )
          ],
        ),
      ),
    );
  }

  /// Build cart with list food
  ListView buildListCart(Shop value) {
    return ListView.builder(
      itemCount: value.cart.length,
      itemBuilder: (context, index) {
        final Food food = value.cart[index];

        return ListTile(
          title: Text(food.name),
          subtitle: Text(food.price),
          trailing: IconButton(
            icon: Icon(Icons.delete),
            onPressed: () => removeFromCart(context, food),
          ),
        );
      },
    );
  }
}
