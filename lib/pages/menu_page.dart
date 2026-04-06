import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sushi_man/components/button.dart';
import 'package:sushi_man/components/food_tile.dart';
import 'package:sushi_man/models/food.dart';
import 'package:sushi_man/pages/food_details_page.dart';
import 'package:sushi_man/themes/colors.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  List<Food> foodMenu = [
    Food(
      name: "Ikura",
      price: '21.00',
      imagePath: 'lib/images/ikura.png',
      rating: '4.5',
    ),
    Food(
      name: "Nigiri",
      price: '26.00',
      imagePath: 'lib/images/nigiri.png',
      rating: '4.0',
    ),
    Food(
      name: "Uramaki",
      price: '25.00',
      imagePath: 'lib/images/002-uramaki-2.png',
      rating: '3.9',
    ),
    Food(
      name: "Uramaki Special",
      price: '25.00',
      imagePath: 'lib/images/006-uramaki-1.png',
      rating: '4.1',
    ),
    Food(
      name: "Nigiri Double Top",
      price: '25.00',
      imagePath: 'lib/images/007-nigiri.png',
      rating: '4.1',
    ),
  ];

  void navigateToFoodDetails(Food food) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FoodDetailsPage(food: food),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: buildAppBar(),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //promo banner
                  buildPromoBanner(),
                  SizedBox(
                    height: 25,
                  ),
                  //search bar
                  buildSearchBar(),
                  SizedBox(
                    height: 25,
                  ),
                  //menu list
                  Text(
                    'Food menu',
                    style: GoogleFonts.dmSerifDisplay(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),

            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: foodMenu.length,
                itemBuilder: (context, index) => FoodTile(
                  food: foodMenu[index],
                  onTap: () => navigateToFoodDetails(foodMenu[index]),
                ),
              ),
            ),
            // popular food
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(20)),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 28, vertical: 24),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset(
                        'lib/images/salmon_eggs.png',
                        width: 65,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Salmon Eggs',
                            style: GoogleFonts.dmSerifDisplay(
                              fontSize: 20,
                            ),
                          ),
                          Text('\$10.00'),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ));
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: Icon(
        Icons.menu,
        color: Colors.grey[900],
      ),
      title: Text(
        'Tokyo',
        style: TextStyle(
          color: Colors.grey[900],
        ),
      ),
      centerTitle: true,
    );
  }

  TextField buildSearchBar() {
    return TextField(
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(20),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }

  Container buildPromoBanner() {
    return Container(
      decoration: BoxDecoration(
        color: MyColors.primary,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 24),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Text(
                  'Get 32% Promo',
                  style: GoogleFonts.dmSerifDisplay(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                MyButton(text: 'Redeem', onTap: () {}),
              ],
            ),
            Column(children: [
              Image.asset(
                'lib/images/salmon.png',
                height: 100,
              )
            ])
          ],
        ),
      ),
    );
  }
}
