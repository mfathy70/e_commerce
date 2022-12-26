import 'package:flutter/material.dart';
import '../../widgets/arrow_back_button.dart';

class MyPointsScreen extends StatelessWidget {
  const MyPointsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Points'),
        leading: const ArrowBackButton(),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.monetization_on_outlined,
              size: 150,
              color: Theme.of(context).primaryColor,
            ),
            const Text(
              'Your points will show here',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
            )
          ],
        ),
      ),
    );
  }
}
