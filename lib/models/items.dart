import 'package:flutter/foundation.dart';

FooditemList fooditemList = FooditemList(foodItems: [
  FoodItem(
    id: 1,
    title: "Avocado",
    description: "Big single avocado fresh imported fruit from the mexican avocado collection",
    price: 18.78,
    imgUrl: "assets/images/Avocado.JPG",
  ),
  FoodItem(
    id: 2,
    title: "Grapes",
    description: "Grape seedlings of horse milk grape seelings of xinjiang white milk south",
    price: 65.36,
    imgUrl: "assets/images/Grapes.JPG",
  ),
  FoodItem(
    id: 3,
    title: "Oranges",
    description: "Imported egyptian navel orange fresh fruit of the season fresh orange",
    price: 12.88,
    imgUrl: "assets/images/Oranges.JPG",
  ),
  FoodItem(
    id: 4,
    title: "Grapes",
    description: "Grape seedlings of horse milk grape seelings of xinjiang white milk south",
    price: 65.36,
    imgUrl: "assets/images/Grapes.JPG",
  ),
  FoodItem(
    id: 5,
    title: "Avocado",
    description: "Big single avocado fresh imported fruit from the mexican avocado collection",
    price: 18.78,
    imgUrl: "assets/images/Avocado.JPG",
  ),
  FoodItem(
    id: 6,
    title: "Grapes",
    description: "Grape seedlings of horse milk grape seelings of xinjiang white milk south",
    price: 65.36,
    imgUrl: "assets/images/Grapes.JPG",
  ),
  FoodItem(
    id: 7,
    title: "Oranges",
    description: "Imported egyptian navel orange fresh fruit of the season fresh orange",
    price: 12.88,
    imgUrl: "assets/images/Oranges.JPG",
  ),
]);

class FooditemList {
  List<FoodItem> foodItems;

  FooditemList({@required this.foodItems});
}

class FoodItem {
  int id;
  String title;
  String description;
  double price;
  String imgUrl;
  int quantity;

  FoodItem({
    @required this.id,
    @required this.title,
    @required this.description,
    @required this.price,
    @required this.imgUrl,
    this.quantity = 1,
  });

  void incrementQuantity() {
    this.quantity = this.quantity + 1;
  }

  void decrementQuantity() {
    this.quantity = this.quantity - 1;
  }
}