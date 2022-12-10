import 'package:e_commerce/UI/screens/Categories%20Screen/Screens%20for%20each%20category/restaurant_screen.dart';
import 'package:flutter/material.dart';

import '../Screens for each category/bakery_screen.dart';
import '../Screens for each category/fruits_screen.dart';
import '../Screens for each category/pharmacies_screen.dart';
import '../Screens for each category/super_markets_screen.dart';

class CategoriesScreenTabBarView extends StatelessWidget {
  const CategoriesScreenTabBarView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Expanded(
        child: TabBarView(children: [
      RestaurantScreen(),
      SupermarketsScreen(),
      BakeryScreen(),
      PharmaciesScreen(),
      FruitsScreen(),
    ]));
  }
}
