import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';

class CategoriesScreenTapBar extends StatelessWidget {
  const CategoriesScreenTapBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      width: double.infinity,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          blurRadius: 6,
          offset: const Offset(0, 2),
        )
      ], color: Colors.white),
      child: ButtonsTabBar(
        buttonMargin: const EdgeInsets.all(5),
        height: 40,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedBackgroundColor: Colors.white,
        labelStyle:
            const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        unselectedLabelStyle: TextStyle(
            color: Theme.of(context).primaryColor, fontWeight: FontWeight.bold),
        borderWidth: 1.3,
        borderColor: Colors.grey.withOpacity(0.3),
        unselectedBorderColor: Colors.grey.withOpacity(0.3),
        radius: 100,
        contentPadding: const EdgeInsets.symmetric(horizontal: 10),
        tabs: const <Widget>[
          Tab(
            text: 'Restaurant',
            icon: Icon(Icons.restaurant_sharp),
          ),
          Tab(
            text: 'Supermarket',
            icon: Icon(Icons.shopping_bag),
          ),
          Tab(
            text: 'Bkeries & Cakes',
            icon: Icon(Icons.bakery_dining),
          ),
          Tab(
            text: 'Pharmacies',
            icon: Icon(Icons.local_pharmacy),
          ),
          Tab(
            text: 'Fruits & vegetables',
            icon: Icon(Icons.food_bank),
          ),
        ],
      ),
    );
  }
}
