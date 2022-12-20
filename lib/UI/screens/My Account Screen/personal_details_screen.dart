import 'package:e_commerce/UI/screens/My%20Account%20Screen/My%20account%20widgets/my_account_button.dart';
import 'package:flutter/material.dart';

class PersonalDetails extends StatelessWidget {
  const PersonalDetails({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController countryController = TextEditingController();
    TextEditingController mobileController = TextEditingController();
    TextEditingController emailController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_rounded),
            color: Colors.white),
        title: const Text('Personal Details'),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 18),
        child: Column(
          children: [
            PersonalDetailsTextfield(
              label: 'Name',
              controller: nameController,
            ),
            SizedBox(height: 30),
            Row(
              children: [
                SizedBox(width: 120, child: CountryCode()),
                SizedBox(width: 12),
                Expanded(
                    child: PersonalDetailsTextfield(
                  label: 'Mobile Number',
                  controller: mobileController,
                ))
              ],
            ),
            SizedBox(height: 30),
            PersonalDetailsTextfield(
                label: 'Email address', controller: emailController),
            Expanded(child: SizedBox()),
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: MyAccountButton(onPressed: () {}, label: 'Save'),
            )
          ],
        ),
      ),
    );
  }
}

class CountryCode extends StatelessWidget {
  const CountryCode({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      padding: EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.blueGrey[50],
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextFormField(
        initialValue: '+20',
        decoration: InputDecoration(
          enabled: false,
          label: Text('country'),
          border: InputBorder.none,
        ),
      ),
    );
  }
}

class PersonalDetailsTextfield extends StatelessWidget {
  const PersonalDetailsTextfield(
      {Key? key, required this.label, required this.controller})
      : super(key: key);
  final String label;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.blueGrey[50],
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextFormField(
        controller: controller,
        cursorColor: Theme.of(context).primaryColor,
        decoration: InputDecoration(
          border: InputBorder.none,
          label: Text(label),
          isDense: true,
          floatingLabelStyle: TextStyle(color: Colors.grey),
        ),
      ),
    );
  }
}
