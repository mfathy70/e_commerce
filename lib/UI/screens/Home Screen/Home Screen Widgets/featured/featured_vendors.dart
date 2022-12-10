import 'package:e_commerce/model/vendor.dart';
import 'package:e_commerce/UI/screens/Home%20Screen/Home%20Screen%20Widgets/featured/featured_vendors_widget.dart';
import 'package:e_commerce/UI/screens/VendorScreen/vendor_screen.dart';
import 'package:flutter/material.dart';

class FeaturedVendors extends StatelessWidget {
  const FeaturedVendors({
    super.key,
    required this.vendors,
    required this.label,
  });

  final List<Vendor> vendors;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 15.0, top: 12),
          child: Row(
            children: [
              Text(
                label,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Theme.of(context).colorScheme.secondary),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        SizedBox(
          height: 150,
          child: GridView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            scrollDirection: Axis.horizontal,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              mainAxisExtent: 300,
              mainAxisSpacing: 15,
            ),
            itemCount: vendors.length,
            itemBuilder: (BuildContext context, int index) {
              var vendorsList = vendors[index];
              return GestureDetector(
                child: Vendors(
                  image: vendorsList.vendorImage,
                  name: vendorsList.vendorName,
                ),
                onTap: () {
                  print(index.toString());
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => VendorScreen(
                                vendorName: vendorsList.vendorName,
                              )));
                },
              );
            },
          ),
        ),
        const SizedBox(height: 14)
      ],
    );
  }
}
