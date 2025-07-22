
import '../fake_Data/food.dart';

class FoodRepository {
  static List _finalFood = [];
  static createFood() {
    List _typeF = [
      "Bureger",
      "Pizza",
      "Bureger1",
      "Pizza1",
      "Bureger2",
      "Pizza2",
      "Bureger3",
      "Pizza3",
    ];
    List<String> _burger = [
      "1.jpg",
      "2.jpg",
      "3.jpg",
      "4.jpg",
      "5.jpg",
      "b1.jpg",
      "7.jpg",
      "b2.jpg"
    ];
    for (int i = 0; i < _typeF.length; i++) {
      Food food = Food(
          type: "${_typeF[i]}",
          price: 450.0,
          desc: "delicious",
          fasting: false,
          rate: 5,
          name: "Chees Burger",
          img: "${_burger[i]}");
      _finalFood.add(food.toMap());
    }
    return _finalFood;
  }

  static getFood() {}
}
