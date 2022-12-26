import 'package:e_commerce/model/restaurant_data.dart';
import 'package:flutter/material.dart';
import '../VendorScreen/vendor_screen.dart';
import 'vendor_widget.dart';
import 'vendors_skeleton.dart';

class VendorsGridView extends StatelessWidget {
  VendorsGridView({
    Key? key,
    required this.vendors,
    required this.isLoaded,
  }) : super(key: key);

  final List<Welcome>? vendors;
  bool isLoaded;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isLoaded,
      replacement: const VendorsSkeleton(),
      child: Expanded(
        child: GridView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          itemCount: vendors?.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
            mainAxisExtent: 195,
          ),
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
                child: VendorWidget(vendor: vendors![index]),
                onTap: (() {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const VendorScreen(
                                vendorName: 'test',
                              )));
                }));
          },
        ),
      ),
    );
  }
}
