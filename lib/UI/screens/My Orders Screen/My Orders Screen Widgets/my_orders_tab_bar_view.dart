import 'package:flutter/material.dart';

class MyOrdersTabBarView extends StatelessWidget {
  const MyOrdersTabBarView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Expanded(
        child: TabBarView(children: [
      InstantScreen(),
      ActiveScheduled(),
      HouseCleaning(),
    ]));
  }
}

class HouseCleaning extends StatelessWidget {
  const HouseCleaning({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.home_rounded,
            color: Theme.of(context).primaryColor,
            size: 140,
          ),
          const Text(
            'Hmmm...!',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          Text(
            "You haven't made any orders yet",
            style:
                TextStyle(color: Colors.grey[500], fontWeight: FontWeight.w600),
          )
        ],
      ),
    );
  }
}

class ActiveScheduled extends StatelessWidget {
  const ActiveScheduled({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.calendar_month_outlined,
          color: Theme.of(context).primaryColor,
          size: 140,
        ),
        const Text(
          'Hmmm...!',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        Text(
          "There are no scheduled orders to be generated.\nYou can check the instant tab.",
          style: TextStyle(
            color: Colors.grey[600],
            fontWeight: FontWeight.w600,
          ),
          textAlign: TextAlign.center,
        )
      ],
    ));
  }
}

class InstantScreen extends StatelessWidget {
  const InstantScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.shopping_cart_rounded,
            color: Theme.of(context).primaryColor,
            size: 140,
          ),
          const Text(
            "You haven't made any orders yet",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          Text(
            'Every grocery order you make will be added here',
            style:
                TextStyle(color: Colors.grey[500], fontWeight: FontWeight.w600),
          )
        ],
      ),
    );
  }
}
