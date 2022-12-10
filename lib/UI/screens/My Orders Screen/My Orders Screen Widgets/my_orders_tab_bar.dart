import 'package:flutter/material.dart';

class MyOrdersTabBar extends StatelessWidget {
  const MyOrdersTabBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          blurRadius: 6,
          offset: const Offset(0, 2),
        )
      ], color: Colors.white),
      child: TabBar(
        isScrollable: true,
        indicatorColor: Theme.of(context).primaryColor,
        labelPadding: const EdgeInsets.symmetric(horizontal: 10),
        unselectedLabelColor: Colors.grey.withOpacity(0.5),
        unselectedLabelStyle:
            const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        labelStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        labelColor: Theme.of(context).colorScheme.secondary,
        tabs: const <Widget>[
          Tab(child: Text('Instant')),
          Tab(
              child: Text(
            'Active Scheduled',
            softWrap: false,
          )),
          Tab(child: Text('House Cleaning')),
        ],
      ),
    );
  }
}
