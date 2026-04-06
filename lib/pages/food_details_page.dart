import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'package:sushi_man/components/button.dart';
import 'package:sushi_man/models/food.dart';
import 'package:sushi_man/models/shop.dart';
import 'package:sushi_man/themes/colors.dart';

class FoodDetailsPage extends StatefulWidget {
  final Food food;

  const FoodDetailsPage({super.key, required this.food});

  @override
  State<FoodDetailsPage> createState() => _FoodDetailsPageState();
}

class _FoodDetailsPageState extends State<FoodDetailsPage> {
  int quantityCount = 1;

  void incrementQuantity() {
    setState(() {
      quantityCount++;
    });
  }

  void decrementQuantity() {
    setState(() {
      if (quantityCount > 0) {
        quantityCount--;
      }
    });
  }

  void addToCart() {
    if (quantityCount > 0) {
      final shop = context.read<Shop>();

      shop.addToCart(widget.food, quantityCount);

      //Alert Dialog
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Enjoy!', style: TextStyle(fontSize: 20),),
          content: RichText(
            text: TextSpan(
              style: TextStyle(fontSize: 18, color: Colors.black54),
              children: [
                TextSpan(text: 'Successfully your '),
                TextSpan(
                  text: widget.food.name,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(text: '  was added to cart.'),
              ],
            ),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  //One to remove dialog box. Pop again to previous screen
                  Navigator.pop(context);
                  Navigator.pop(context);
                },
                icon: Icon(Icons.done))
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 12, top: 16, right: 12, bottom: 0),
              // Food Detail (Product)
              child: buildDetail(),
            ),
          ),

          //Price and CTA
          buildAction()
        ],
      ),
    );
  }

  ListView buildDetail() {
    return ListView(
      children: [
        //Image
        Image.asset(
          widget.food.imagePath,
          height: 200,
        ),

        //Score
        Row(
          children: [
            Icon(
              Icons.star,
              color: Colors.yellow[800],
            ),
            Text(widget.food.rating),
          ],
        ),
        SizedBox(
          height: 10,
        ),

        //Title
        Text(
          widget.food.name,
          style: GoogleFonts.dmSerifDisplay(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.grey[800],
          ),
        ),
        SizedBox(
          height: 20,
        ),

        //Description
        Text(
          'Description',
          style: GoogleFonts.dmSerifDisplay(
            fontSize: 18,
            color: Colors.grey[800],
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin semper, orci sit amet dictum lacinia, est quam sollicitudin lorem, in ornare leo mauris non tellus. Quisque quis libero non sapien pretium consectetur. Sed in nisi sollicitudin, gravida arcu id, mattis mi. Nullam quis ornare justo. Vivamus risus arcu, facilisis sit amet egestas ut, molestie at metus. Morbi interdum urna quis felis vehicula tincidunt. Aenean maximus pellentesque risus ut aliquet.',
          style: TextStyle(
            color: Colors.grey[600],
            fontSize: 14,
            height: 2,
          ),
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          'Donec interdum erat ligula, non mollis mi malesuada vel. Suspendisse volutpat dolor imperdiet, facilisis ligula sagittis, luctus magna. In magna ipsum, mollis ut augue sit amet, blandit fermentum elit. Duis pellentesque felis quis dui pretium, eu eleifend nulla blandit. Donec rhoncus risus velit, non sollicitudin velit bibendum non. ',
          style: TextStyle(
            color: Colors.grey[600],
            fontSize: 14,
            height: 2,
          ),
        ),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }

  /// Build price, qty and add.
  Container buildAction() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: MyColors.primary,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Price
                Text(
                  '\$${widget.food.price}',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                //Quantity
                Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.remove),
                      iconSize: 24,
                      color: Colors.white,
                      onPressed: () => decrementQuantity(),
                    ),
                    Text(
                      quantityCount.toString(),
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    IconButton(
                      icon: Icon(Icons.add),
                      iconSize: 24,
                      color: Colors.white,
                      onPressed: () => incrementQuantity(),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            //CTA Add to cart
            MyButton(text: 'Add To Cart', onTap: addToCart),
          ],
        ),
      ),
    );
  }
}
