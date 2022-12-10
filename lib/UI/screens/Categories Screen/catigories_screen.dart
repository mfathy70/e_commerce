import 'package:e_commerce/UI/widgets/search_button.dart';
import 'package:flutter/material.dart';
import 'Categories Screen Widgets/categories_screen_app_bar.dart';
import 'Categories Screen Widgets/categories_screen_tab_bar.dart';
import 'Categories Screen Widgets/categories_screen_tab_bar_view.dart';

class CatigoriesScreen extends StatefulWidget {
  const CatigoriesScreen({super.key, required this.currentPage});
  final int currentPage;

  @override
  State<CatigoriesScreen> createState() => _CatigoriesScreenState();
}

class _CatigoriesScreenState extends State<CatigoriesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: DefaultTabController(
      initialIndex: widget.currentPage,
      length: 5,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            color: Theme.of(context).primaryColor,
            child:
                const SafeArea(bottom: false, child: CategoriesScreenAppbar()),
          ),
          const SearchButton(),
          const CategoriesScreenTapBar(),
          const CategoriesScreenTabBarView()
        ],
      ),
    ));
  }
}
