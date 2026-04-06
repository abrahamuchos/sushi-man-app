import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:sushi_man/models/food.dart';
import 'package:sushi_man/utils/utils.dart';

class FoodTile extends StatelessWidget {
  final Food food;
  final void Function()? onTap;

  const FoodTile({
    super.key,
    required this.food,
    this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(left: 12),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: Colors.grey[100]),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 24),
          child: Column(
            children: [
              //Image Food
              Image.asset(food.imagePath, height: 100,),

              //Title Food
              Text(Utils.truncate(food.name, 10),
                style: GoogleFonts.dmSerifDisplay(
                  fontSize: 20,
                ),
              ),
              SizedBox(height: 10,),
              //Price and Rating
              SizedBox(
                width: 105,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('\$${food.price}'),
                    Row(
                      children: [
                        Icon(Icons.star, color: Colors.yellow[800],),
                        Text(food.rating)
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
