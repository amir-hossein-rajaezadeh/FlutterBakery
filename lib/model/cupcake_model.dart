import 'package:flutter/material.dart';
import 'package:flutter_bakery_shop/utils/colors.dart';

class CupCakeModel {
  final String cupCakeImage;
  final String cupCakeTopImage;
  final Color backgroundColor;
  CupCakeModel(
      {required this.cupCakeImage,
      required this.cupCakeTopImage,
      required this.backgroundColor});
}

List<CupCakeModel> getCupCakeList() {
  final List<CupCakeModel> cupCakeList = [
    CupCakeModel(
        cupCakeImage: "assets/images/blueberry.png",
        cupCakeTopImage: "assets/images/blueberry_toppings.png",
        backgroundColor: MyColors.purple),
    CupCakeModel(
      cupCakeImage: "assets/images/rasberry.png",
      cupCakeTopImage: "assets/images/rasberry_toppings.png",
      backgroundColor: MyColors.red,
    ),
    CupCakeModel(
      cupCakeImage: "assets/images/strawberry.png",
      cupCakeTopImage: "assets/images/strawberry_toppings.png",
      backgroundColor: MyColors.peech,
    ),
    CupCakeModel(
      cupCakeImage: "assets/images/choclate.png",
      cupCakeTopImage: "assets/images/choclate_toppings.png",
      backgroundColor: MyColors.brown,
    ),
  ];

  return cupCakeList;
}
