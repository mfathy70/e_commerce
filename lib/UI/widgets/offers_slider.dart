import 'package:carousel_slider/carousel_slider.dart';

import 'package:flutter/material.dart';

class OffersSlider extends StatefulWidget {
  const OffersSlider({super.key});

  @override
  State<OffersSlider> createState() => _OffersSliderState();
}

class _OffersSliderState extends State<OffersSlider> {
  int activeIndex = 0;
  final imagesList = [
    'assets/images/logo.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
      child: CarouselSlider.builder(
        itemCount: imagesList.length,
        itemBuilder: (context, index, realIndex) {
          final image = imagesList[index];

          return buildImage(image, index);
        },
        options: CarouselOptions(
          autoPlay: false,
          height: 200,
          viewportFraction: 1,
          onPageChanged: (index, reason) {
            setState(() {
              activeIndex = index;
            });
          },
        ),
      ),
    );
  }

  Widget buildImage(String images, int index) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(10),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.asset(
          images,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
