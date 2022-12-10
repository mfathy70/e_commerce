import 'package:flutter/material.dart';

class FeaturedOffersWidget extends StatelessWidget {
  const FeaturedOffersWidget({
    Key? key,
    required this.image,
  }) : super(key: key);

  final String image;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          width: double.infinity,
          height: 160,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.grey.withOpacity(0.3), width: 0.6),
            //boxShadow: [BoxShadow(blurRadius: 6.0, color: Colors.grey)],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              image,
              fit: BoxFit.fill,
            ),
          ),
        ),
      ],
    );
  }
}
