class CupCakeModel {
  final String cupCakeImage;
  final String cupCakeTopImage;

  CupCakeModel({required this.cupCakeImage, required this.cupCakeTopImage});
}

List<CupCakeModel> getCupCakeList() {
  final List<CupCakeModel> cupCakeList = [
    CupCakeModel(
        cupCakeImage: "assets/images/blueberry.png",
        cupCakeTopImage: "assets/images/blueberry_toppings.png"),
    CupCakeModel(
        cupCakeImage: "assets/images/rasberry.png",
        cupCakeTopImage: "assets/images/rasberry_toppings.png"),
    CupCakeModel(
        cupCakeImage: "assets/images/strawberry.png",
        cupCakeTopImage: "assets/images/strawberry_toppings.png"),
    CupCakeModel(
        cupCakeImage: "assets/images/choclate.png",
        cupCakeTopImage: "assets/images/choclate_toppings.png"),
  ];

  return cupCakeList;
}
