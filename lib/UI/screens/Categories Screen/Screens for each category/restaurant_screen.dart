import 'package:e_commerce/model/restaurant_data.dart';
import 'package:e_commerce/services/remote_service.dart';
import 'package:flutter/material.dart';

import '../filter_action_button.dart';
import '../vendors_grid_view.dart';

class RestaurantScreen extends StatefulWidget {
  const RestaurantScreen({super.key});

  @override
  State<RestaurantScreen> createState() => _RestaurantScreenState();
}

class _RestaurantScreenState extends State<RestaurantScreen> {
  List<Welcome>? restaurantstest;
  bool isLoaded = false;

  @override
  void initState() {
    super.initState();

    //fetch data from API
    getData();
  }

  getData() async {
    restaurantstest = await RemoteService().getRestaurantsData();
    if (restaurantstest != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        children: [
          VendorsGridView(
            vendors: restaurantstest,
            isLoaded: isLoaded,
          ),
        ],
      ),
      floatingActionButton: const FilterFloatingActionButton(),
    );
  }
}
