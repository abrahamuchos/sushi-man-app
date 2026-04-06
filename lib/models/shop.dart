import 'package:flutter/foundation.dart';

import 'package:sushi_man/models/food.dart';

class Shop extends ChangeNotifier{
  final List<Food> _foodMenu = [
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

  //Customer cart
  final List<Food> _cart = [];

  //Getter methods
  List<Food> get foodMenu => _foodMenu;
  List<Food> get cart => _cart;

  void addToCart(Food foodItem, int qty){
    for(int i = 0; i < qty; i++){
      _cart.add(foodItem);
    }
    notifyListeners();
  }

  void removeFromCart(Food food){
    _cart.remove(food);

    notifyListeners();
  }



}
