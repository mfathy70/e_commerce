import 'package:e_commerce/UI/screens/My%20Account%20Screen/delivery_addresses_screen.dart';
import 'package:e_commerce/UI/screens/My%20Account%20Screen/personal_details_screen.dart';
import 'package:e_commerce/UI/widgets/app_bar.dart';
import 'package:e_commerce/UI/screens/Phone%20Login%20Screens/phone_login_screen.dart';
import 'package:e_commerce/model/my_account_screen_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'my_points_screen.dart';

class MyAccountScreen extends StatefulWidget {
  const MyAccountScreen({super.key});

  @override
  State<MyAccountScreen> createState() => _MyOrdersScreenState();
}

class _MyOrdersScreenState extends State<MyAccountScreen> {
  List<MyAccButton> buttonsList = [
    MyAccButton(
      title: "Personal details",
      subtitle: "First name, Last name, mobile number",
      icon: Icons.person,
      Screen: const PersonalDetails(),
    ),
    MyAccButton(
      title: "Delivery addresses",
      subtitle: "edit and delete addresses",
      icon: Icons.location_on_outlined,
      Screen: const DeliveryAddresses(),
    ),
    MyAccButton(
      title: 'My Points',
      subtitle: "Manage your Points",
      icon: Icons.monetization_on_outlined,
      Screen: const MyPointsScreen(),
    ),
    MyAccButton(
      title: "My reviews",
      subtitle: 'All the reviews you have made',
      icon: Icons.star_rounded,
      Screen: null,
    ),
    MyAccButton(
      title: 'Settings',
      subtitle: 'Languages, search and nearby',
      icon: Icons.settings_outlined,
      Screen: null,
    )
  ];

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
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: buttonsList.length,
              itemBuilder: (BuildContext context, int index) {
                final List = buttonsList[index];
                return GestureDetector(
                  child: Column(
                    children: [
                      MyAccountScreenListTile(
                          icon: List.icon,
                          title: List.title,
                          subtitle: List.subtitle),
                      const Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: Divider(thickness: 0.8),
                      ),
                    ],
                  ),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => List.Screen));
                  },
                );
              },
            ),
            Row(
              children: const [
                Padding(
                  padding: EdgeInsets.only(left: 20, top: 10),
                  child: LoginButton(),
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

class LoginButton extends StatefulWidget {
  const LoginButton({
    Key? key,
  }) : super(key: key);

  @override
  State<LoginButton> createState() => _LoginButtonState();
}

class _LoginButtonState extends State<LoginButton> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          User? user = snapshot.data;
          if (user == null) {
            return TextButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const PhoneLoginScreen();
                  }));
                },
                child: Text(
                  'LOG IN',
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                  ),
                ));
          }
        }
        return TextButton(
            onPressed: () {
              FirebaseAuth.instance.signOut();
            },
            child: const Text(
              'LOG OUT',
              style: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.w600,
                fontSize: 18,
              ),
            ));
      },
    );
  }
}

class MyAccountScreenListTile extends StatelessWidget {
  const MyAccountScreenListTile({
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
      ),
    );
  }
}
