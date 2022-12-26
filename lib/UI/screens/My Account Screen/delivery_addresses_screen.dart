import 'package:flutter/material.dart';
import '../../widgets/arrow_back_button.dart';
import 'My account widgets/my_account_outlined_button.dart';

class DeliveryAddresses extends StatelessWidget {
  const DeliveryAddresses({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Delivery Addresses'),
        automaticallyImplyLeading: false,
        leading: const ArrowBackButton(),
      ),
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.location_on_outlined,
                  color: Theme.of(context).primaryColor,
                  size: 150,
                ),
                const Text(
                  'No delivery adresses',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                ),
                Text(
                  'No registered adress found',
                  style: TextStyle(fontSize: 18, color: Colors.grey[600]),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 12),
            child: Align(
                alignment: Alignment.bottomCenter,
                child: MyAccOutlinedButton(
                    isExpanded: true,
                    label: 'Add new address',
                    onPressed: () {})),
          )
        ],
      ),
    );
  }
}
