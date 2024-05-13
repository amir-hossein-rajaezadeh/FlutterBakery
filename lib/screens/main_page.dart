import 'package:flutter/material.dart';
import '../utils/colors.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

enum Sides { right, left }

final List<String> imageList = [
  "assets/images/blueberry.png",
  "assets/images/rasberry.png",
  "assets/images/strawberry.png",
  "assets/images/choclate.png",
];

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.red,
      appBar: AppBar(
        backgroundColor: MyColors.red,
        leading: IconButton(
          icon: const Icon(Icons.menu),
          color: Colors.white,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            color: Colors.white,
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.shopping_cart_outlined),
            color: Colors.white,
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 50,
            width: 300,
            decoration: BoxDecoration(
              color: MyColors.white.withOpacity(0.1),
              borderRadius: const BorderRadius.all(Radius.circular(40)),
            ),
            child: const Center(
              child: Text(
                'Choose Your favourite ',
                style: TextStyle(
                  color: MyColors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          Center(
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 90),
                  child: Container(
                    height: 420,
                    width: 300,
                    decoration: BoxDecoration(
                      color: MyColors.white.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(200),
                    ),
                    child: Center(
                      child: Image.asset('assets/images/rasberry.png'),
                    ),
                  ),
                ),
                Positioned(
                  top: 0,
                  child: Image.asset("assets/images/rasberry_toppings.png"),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 40,
              right: 20,
              left: 20,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildArrowWidet(Sides.right),
                _buildAddCardWidget(),
                _buildArrowWidet(Sides.left)
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 40),
            alignment: Alignment.center,
            height: 60,
            child: ListView.builder(
              itemCount: imageList.length,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final imageItem = imageList[index];
                return Container(
                  color: Colors.amber,
                  child: Image.asset(
                    imageItem,
                    fit: BoxFit.cover,
                    alignment: Alignment.center,
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }

  Container _buildAddCardWidget() {
    return Container(
      height: 60,
      width: 230,
      decoration: BoxDecoration(
        color: MyColors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(100),
      ),
      child: const Center(
        child: Text(
          'Add to card  ',
          style: TextStyle(
            color: MyColors.white,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  Widget _buildArrowWidet(Sides sides) {
    bool isRightSide = sides.name == "right";
    return Container(
      height: 60,
      margin: EdgeInsets.only(
          left: isRightSide ? 0 : 20, right: isRightSide ? 20 : 0),
      width: 60,
      decoration: BoxDecoration(
        color: MyColors.white.withOpacity(0.1),
        borderRadius: const BorderRadius.all(
          Radius.circular(60),
        ),
      ),
      child: IconButton(
        icon: Icon(
          isRightSide
              ? Icons.arrow_back_ios_new_rounded
              : Icons.arrow_forward_ios,
          color: MyColors.white,
        ),
        onPressed: () {},
      ),
    );
  }
}
