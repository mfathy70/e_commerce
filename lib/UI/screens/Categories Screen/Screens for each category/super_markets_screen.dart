import 'package:e_commerce/UI/screens/Categories%20Screen/filter_action_button.dart';
import 'package:e_commerce/UI/screens/Categories%20Screen/vendors_skeleton.dart';
import 'package:flutter/material.dart';

class SupermarketsScreen extends StatelessWidget {
  const SupermarketsScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        children: const [
          VendorsSkeleton(),
          /*VendorsGridView(
            vendors: supermarkets,
          ),*/
        ],
      ),
      floatingActionButton: const FilterFloatingActionButton(),
    );
  }
}
