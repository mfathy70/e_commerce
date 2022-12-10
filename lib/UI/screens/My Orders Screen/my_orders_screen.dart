import 'package:e_commerce/UI/widgets/app_bar.dart';
import 'package:flutter/material.dart';

import 'My Orders Screen Widgets/my_orders_tab_bar.dart';
import 'My Orders Screen Widgets/my_orders_tab_bar_view.dart';

class MyOrdersScreen extends StatefulWidget {
  const MyOrdersScreen({super.key});

  @override
  State<MyOrdersScreen> createState() => _MyOrdersScreenState();
}

class _MyOrdersScreenState extends State<MyOrdersScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Column(
        children: const [
          AppBarWidget(
            leading: Text(
              'My Orders',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.w600),
            ),
          ),
          MyOrdersTabBar(),
          MyOrdersTabBarView()
        ],
      ),
    );
  }
}
