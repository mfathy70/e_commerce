import 'package:e_commerce/UI/screens/Categories%20Screen/filter_action_button.dart';
import 'package:e_commerce/UI/screens/Categories%20Screen/vendors_skeleton.dart';
import 'package:flutter/material.dart';

class PharmaciesScreen extends StatelessWidget {
  const PharmaciesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        children: const [
          VendorsSkeleton()
          /*VendorsGridView(
            vendors: pharmacies,
          ),*/
        ],
      ),
      floatingActionButton: const FilterFloatingActionButton(
        tag: 'btn3',
      ),
    );
  }
}
