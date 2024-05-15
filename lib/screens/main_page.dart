import 'package:flutter/material.dart';
import 'package:flutter_bakery_shop/model/cupcake_model.dart';
import '../utils/colors.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

enum Sides { right, left }

final PageController _pageController = PageController(
  initialPage: 0,
);

class _MainPageState extends State<MainPage> with TickerProviderStateMixin {
  int currentpage = 0;
  late final AnimationController _rotationController = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 520),
  );
  late final Animation<double> _rotationAnimation = Tween<double>(
    begin: 0,
    end: 1,
  ).animate(_rotationController);

  late final AnimationController _slideController = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 550),
  );
  late Animation<Offset> _slideAnimation = Tween<Offset>(
    begin: const Offset(0, 1.5),
    end: const Offset(0, -2),
  ).animate(_slideController);

  late final AnimationController _slideController2 = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 500),
  );

  late Animation<Offset> _slideAnimation2 = Tween<Offset>(
    begin: const Offset(0, -1.5),
    end: const Offset(0, 1.5),
  ).animate(_slideController2);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedContainer(
        alignment: Alignment.center,
        duration: const Duration(milliseconds: 350),
        color: getCupCakeList()[currentpage].backgroundColor,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(
                top: 70,
              ),
              child: Container(
                height: 420,
                width: 300,
                decoration: BoxDecoration(
                  color: MyColors.white.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(200),
                ),
              ),
            ),
            PageView.builder(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  currentpage = index;
                });
              },
              itemCount: getCupCakeList().length,
              itemBuilder: (context, index) {
                return _buildPageViewItemWidget(index);
              },
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Container(
                      margin:
                          const EdgeInsets.only(top: 60, right: 10, left: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.menu),
                            color: Colors.white,
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                          Row(
                            children: [
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
                        ],
                      ),
                    ),
                    Container(
                      height: 50,
                      width: 300,
                      decoration: BoxDecoration(
                        color: MyColors.white.withOpacity(0.1),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(40),
                        ),
                      ),
                      child: const Center(
                        child: Text(
                          'Choose Your favourite',
                          style: TextStyle(
                            color: MyColors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        bottom: 30,
                        right: 20,
                        left: 20,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _buildArrowWidet(Sides.right, 2),
                          _buildAddCardWidget(),
                          _buildArrowWidet(Sides.left, 1)
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 30),
                      height: 80,
                      child: ListView.separated(
                        separatorBuilder: (context, index) => const SizedBox(
                          width: 9,
                        ),
                        itemCount: getCupCakeList().length,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          final cupcakeItem = getCupCakeList()[index];
                          return SizedBox(
                            width: 55,
                            child: Column(
                              children: [
                                Image.asset(
                                  cupcakeItem.cupCakeImage,
                                  fit: BoxFit.cover,
                                  height: 50,
                                ),
                                AnimatedContainer(
                                  duration: const Duration(milliseconds: 240),
                                  margin: const EdgeInsets.only(top: 10),
                                  width: currentpage == index ? 40 : 0,
                                  height: 3,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(100),
                                      color: Colors.white),
                                )
                              ],
                            ),
                          );
                        },
                      ),
                    )
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Stack _buildPageViewItemWidget(int index) {
    final cupcakeItem = getCupCakeList()[index];
    return Stack(
      alignment: Alignment.center,
      children: [
        Center(
          child: Container(
            margin: const EdgeInsets.only(top: 110),
            height: 200,
            child: Image.asset(
              height: 200,
              cupcakeItem.cupCakeImage,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          alignment: Alignment.topCenter,
          child: SlideTransition(
            position: _slideAnimation,
            child: RotationTransition(
              turns: _rotationAnimation,
              child: Image.asset(cupcakeItem.cupCakeTopImage),
            ),
          ),
        ),
        Container(
          alignment: Alignment.topCenter,
          child: SlideTransition(
            position: _slideAnimation2,
            child: RotationTransition(
              turns: _rotationAnimation,
              child: Image.asset(getCupCakeList()[index].cupCakeTopImage),
            ),
          ),
        ),
      ],
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
          'Add to card',
          style: TextStyle(
            color: MyColors.white,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  Widget _buildArrowWidet(Sides sides, int index) {
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
        onPressed: () async {
          if (!isRightSide) {
            onCupcakePageChange(index, false);

            _pageController.animateToPage(
                duration: const Duration(milliseconds: 700),
                currentpage + 1,
                curve: Curves.easeInOutSine);
          } else {
            onCupcakePageChange(index, true);

            _pageController.animateToPage(
                duration: const Duration(milliseconds: 700),
                currentpage - 1,
                curve: Curves.easeInOutSine);
          }
        },
      ),
    );
  }

  Future<void> onCupcakePageChange(int index, bool isRightSide) async {
    _rotationController.forward();
    _slideController.forward();
    await Future.delayed(
      const Duration(milliseconds: 300),
    );
    _slideController2.forward();

    _rotationController
      ..reset()
      ..forward().then((value) async {
        await Future.delayed(
          const Duration(milliseconds: 300),
        );
        _rotationController.reset();
        setState(() {
          _slideAnimation2 = Tween<Offset>(
            begin: const Offset(0, -1),
            end: const Offset(0, 1.5),
          ).animate(_slideController2);

          _slideAnimation = Tween<Offset>(
            begin: const Offset(0, 1.5),
            end: const Offset(0, -2),
          ).animate(_slideController);
        });
        _slideController.reset();
        _slideController2.reset();
      });
  }
}
