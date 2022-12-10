import 'package:e_commerce/model/fetured_offers.dart';
import 'package:e_commerce/UI/screens/Home%20Screen/home_screen.dart';
import 'package:e_commerce/UI/screens/Home%20Screen/Home%20Screen%20Widgets/featured/featured_offers_widget.dart';
import 'package:flutter/material.dart';

class FeaturedOffers extends StatelessWidget {
  const FeaturedOffers({
    super.key,
    required this.featuredOffers,
  });

  final List<FeaturedOffer> featuredOffers;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 180,
          child: GridView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            scrollDirection: Axis.horizontal,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              mainAxisExtent: 330,
              mainAxisSpacing: 15,
            ),
            itemCount: 2,
            itemBuilder: (BuildContext context, int index) {
              FeaturedOffer featuredoffer = featuredOffersList[index];
              return FeaturedOffersWidget(image: featuredoffer.image);
            },
          ),
        )
      ],
    );
  }
}
