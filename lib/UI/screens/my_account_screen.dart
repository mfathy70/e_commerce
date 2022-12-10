import 'package:e_commerce/UI/widgets/app_bar.dart';
import 'package:flutter/material.dart';

class MyAccountScreen extends StatefulWidget {
  const MyAccountScreen({super.key});

  @override
  State<MyAccountScreen> createState() => _MyOrdersScreenState();
}

class _MyOrdersScreenState extends State<MyAccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: AppBarWidget(
              leading: Text(
            'My account',
            style: TextStyle(
                color: Colors.white, fontSize: 22, fontWeight: FontWeight.w600),
          ))),
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            const MyAccountScreenButton(
              icon: Icons.person,
              title: 'Personal details',
              subtitle: 'First name, last name, mobile number',
            ),
            const Padding(
              padding: EdgeInsets.only(left: 20),
              child: Divider(thickness: 0.8),
            ),
            const MyAccountScreenButton(
              icon: Icons.location_on_outlined,
              title: 'Delivery addresses',
              subtitle: 'Add, edit, and delete address',
            ),
            const Padding(
              padding: EdgeInsets.only(left: 20),
              child: Divider(thickness: 0.8),
            ),
            const MyAccountScreenButton(
              icon: Icons.monetization_on_rounded,
              title: 'My Points',
              subtitle: 'Manage your Points',
            ),
            const Padding(
              padding: EdgeInsets.only(left: 20),
              child: Divider(thickness: 0.8),
            ),
            const MyAccountScreenButton(
              icon: Icons.card_giftcard_rounded,
              title: 'Loyalty cards',
              subtitle: 'Add and delete loyalty cards',
            ),
            const Padding(
              padding: EdgeInsets.only(left: 20),
              child: Divider(thickness: 0.8),
            ),
            const MyAccountScreenButton(
              icon: Icons.star_rounded,
              title: 'My reviews',
              subtitle: 'All the reviews you have made',
            ),
            const Padding(
              padding: EdgeInsets.only(left: 20),
              child: Divider(thickness: 0.8),
            ),
            const MyAccountScreenButton(
              icon: Icons.settings_outlined,
              title: 'Settings',
              subtitle: 'Languages, search and nearby',
            ),
            const Padding(
              padding: EdgeInsets.only(left: 20),
              child: Divider(thickness: 0.8),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 10),
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      'LOG IN',
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            TextButton(
                onPressed: () {},
                child: Text(
                  'Terms of Service & Privacy',
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                )),
            Text(
              '7.7.5(739)',
              style: TextStyle(color: Colors.grey[600]),
            )
          ],
        ),
      ),
    );
  }
}

class MyAccountScreenButton extends StatelessWidget {
  const MyAccountScreenButton({
    Key? key,
    required this.icon,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  final IconData icon;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: ListTile(
        leading: Icon(
          icon,
          size: 30,
          color: Theme.of(context).colorScheme.secondary,
        ),
        title: Text(
          title,
          style: TextStyle(
            color: Theme.of(context).colorScheme.secondary,
            fontWeight: FontWeight.w600,
          ),
        ),
        subtitle: Text(subtitle),
        trailing: const Icon(
          Icons.arrow_forward_ios_rounded,
          size: 16,
        ),
        onTap: () {},
      ),
    );
  }
}
