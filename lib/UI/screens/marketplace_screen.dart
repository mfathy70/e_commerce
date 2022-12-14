import 'package:e_commerce/UI/screens/Home%20Screen/home_screen.dart';
import 'package:e_commerce/UI/widgets/app_bar.dart';
import 'package:e_commerce/UI/screens/Home%20Screen/Home%20Screen%20Widgets/catigories/catigories_widget.dart';
import 'package:e_commerce/UI/widgets/delivering_to.dart';
import 'package:e_commerce/UI/screens/Home%20Screen/Home%20Screen%20Widgets/featured/featured_offers.dart';
import 'package:e_commerce/UI/screens/Home%20Screen/Home%20Screen%20Widgets/featured/featured_vendors.dart';
import 'package:e_commerce/UI/screens/Home%20Screen/Home%20Screen%20Widgets/popular/popular_vendors.dart';
import 'package:e_commerce/UI/widgets/search_button.dart';
import 'package:flutter/material.dart';

class MarketplaceScreen extends StatelessWidget {
  const MarketplaceScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: [
            AppBarWidget(
                leading: Text(
              'E-commerce',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.w600),
            )),
            const SearchButton(),
          ],
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 12),
                const DeliveringTo(),
                const SizedBox(height: 18),
                CatigoriesWidget(categories: categories),
                FeaturedOffers(featuredOffers: featuredOffersList),
                FeaturedVendors(vendors: discountsVendors, label: 'Discounts'),
                FeaturedVendors(
                    vendors: featuredVendors, label: 'Health and well-being'),
                const PopularVendors(label: 'Popular near you'),
                FeaturedVendors(
                    vendors: topPicks, label: 'Our top picks near you')
              ],
            ),
          ),
        ),
      ],
    );
  }
}
