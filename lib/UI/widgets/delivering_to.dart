import 'package:e_commerce/UI/screens/google_map_screen.dart';
import 'package:flutter/material.dart';

class DeliveringTo extends StatelessWidget {
  const DeliveringTo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: GestureDetector(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const GoogleMapScreen()));
        },
        child: Container(
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.withOpacity(0.3)),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(Icons.location_on,
                      color: Theme.of(context).colorScheme.secondary),
                  const SizedBox(width: 5),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Delivering to:',
                        style: TextStyle(
                          color: Colors.grey[600],
                        ),
                      ),
                      Text(
                        'Port Said, Egypt',
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Icon(
                Icons.arrow_forward_ios_rounded,
                size: 15,
                color: Colors.grey[700],
              )
            ],
          ),
        ),
      ),
    );
  }
}
