import 'package:e_commerce/UI/screens/My%20Account%20Screen/My%20account%20widgets/my_account_button.dart';
import 'package:flutter/material.dart';
import '../../widgets/arrow_back_button.dart';
import 'My account widgets/my_account_text_field.dart';

class PersonalDetails extends StatelessWidget {
  const PersonalDetails({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController mobileController = TextEditingController();
    TextEditingController emailController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: const ArrowBackButton(),
        title: const Text('Personal Details'),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 18),
        child: Column(
          children: [
            MyAccTextfield(
              label: 'Name',
              controller: nameController,
            ),
            const SizedBox(height: 30),
            Row(
              children: [
                const SizedBox(width: 120, child: CountryCode()),
                const SizedBox(width: 12),
                Expanded(
                    child: MyAccTextfield(
                  label: 'Mobile Number',
                  controller: mobileController,
                ))
              ],
            ),
            const SizedBox(height: 30),
            MyAccTextfield(label: 'Email address', controller: emailController),
            const Expanded(child: SizedBox()),
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
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.blueGrey[50],
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextFormField(
        initialValue: '+20',
        decoration: const InputDecoration(
          enabled: false,
          label: Text('country'),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
