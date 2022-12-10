import 'package:e_commerce/UI/screens/Home%20Screen/Home%20Screen%20Widgets/popular/popular_vendrors_widget.dart';
import 'package:flutter/material.dart';

class PopularVendors extends StatelessWidget {
  const PopularVendors({
    super.key,
    required this.label,
  });

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
              mainAxisExtent: 100,
              mainAxisSpacing: 8,
            ),
            itemCount: 5,
            itemBuilder: (BuildContext context, int index) {
              return const PopularVendor(
                  name: 'Test', image: 'assets/images/logo2.png');
            },
          ),
        ),
        const SizedBox(height: 14)
      ],
    );
  }
}
