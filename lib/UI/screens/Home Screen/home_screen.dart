import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/model/category.dart';
import 'package:e_commerce/model/fetured_offers.dart';
import 'package:e_commerce/model/vendor.dart';
import 'package:e_commerce/UI/screens/marketplace_screen.dart';
import 'package:e_commerce/UI/screens/my_account_screen.dart';
import 'package:e_commerce/UI/screens/My%20Orders%20Screen/my_orders_screen.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import '../../../notfication/notification_services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

List<FeaturedOffer> featuredOffersList = [
  FeaturedOffer(image: 'assets/images/superbe127.png'),
  FeaturedOffer(image: 'assets/images/superbe126.png'),
];

List<Vendor> featuredVendors = [
  Vendor(
    vendorImage: 'assets/images/ph.jpg',
    vendorName: 'Pharmacies',
  ),
];

List<Vendor> discountsVendors = [
  Vendor(
    vendorImage: 'assets/images/food.jpg',
    vendorName: 'Gourmet',
  ),
  Vendor(
    vendorImage: 'assets/images/food2.jpg',
    vendorName: 'Genena F&V',
  ),
];

List<Vendor> topPicks = [
  Vendor(
    vendorImage: 'assets/images/food.jpg',
    vendorName: 'Gourmet',
  ),
  Vendor(
    vendorImage: 'assets/images/food2.jpg',
    vendorName: 'Genena F&V',
  ),
  Vendor(
    vendorImage: 'assets/images/ph.jpg',
    vendorName: 'Pharmacy',
  ),
];

List<Category> categories = [
  Category(
    label: 'Restaurant',
    image: 'assets/images/restaurant.jpg',
  ),
  Category(
    label: 'Supermarket',
    image: 'assets/images/supermarkets.jpg',
  ),
  Category(
    label: 'Bakeries &\n    Cakes',
    image: 'assets/images/bakery.jpg',
  ),
  Category(
    label: 'Pharmacies',
    image: 'assets/images/pharmacy.jpg',
  ),
  Category(
    label: '   Fruits &\nVegetables',
    image: 'assets/images/fruit.jpg',
  ),
];

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  String? mtoken = " ";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    requestPermission();
    getToken();
    initInfo();
  }

  void getToken() async {
    await FirebaseMessaging.instance.getToken().then((token) {
      setState(() {
        mtoken = token;
        print("My token is $mtoken");
      });
      saveToken(token!);
    });
  }

  void saveToken(String token) async {
    await FirebaseFirestore.instance.collection("UserTokens").doc("User1").set({
      'token': token,
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
          alignment: Alignment.center,
          width: double.infinity,
          height: double.infinity,
          child: _selectedIndex == 0
              ? const MarketplaceScreen()
              : _selectedIndex == 1
                  ? const MyOrdersScreen()
                  : const MyAccountScreen()),
      bottomNavigationBar: bottomAppBar(context),
    );
  }

  Theme bottomAppBar(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        canvasColor: Colors.grey[200],
      ),
      child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          selectedItemColor: Theme.of(context).primaryColor,
          unselectedItemColor: Colors.black.withOpacity(0.5),
          onTap: _onItemTapped,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_bag), label: "Marketplace"),
            BottomNavigationBarItem(
                icon: Icon(Icons.date_range_rounded), label: "My orders"),
            BottomNavigationBarItem(
                icon: Icon(Icons.person), label: "My account"),
          ]),
    );
  }
}
