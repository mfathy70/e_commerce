import 'package:e_commerce/providers/phone_confirmation_provider.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';

import '../My Account Screen/My account widgets/my_account_button.dart';
import '../My Account Screen/My account widgets/my_account_outlined_button.dart';

class CodeConfirmationScreen extends StatefulWidget {
  const CodeConfirmationScreen({
    super.key,
    required this.phoneNumber,
    required this.verificationId,
  });
  final String phoneNumber;
  final String verificationId;

  @override
  State<CodeConfirmationScreen> createState() => _codeConfirmationScreenState();
}

class _codeConfirmationScreenState extends State<CodeConfirmationScreen> {
  TextEditingController codeController = TextEditingController();
  String? code;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_rounded,
              color: Colors.white,
            )),
        title: Text(widget.phoneNumber),
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            const Text(
              'We sent you a six digit number.',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: PinCodeTextField(
                controller: codeController,
                autoFocus: true,
                keyboardType: TextInputType.number,
                appContext: context,
                length: 6,
                enableActiveFill: true,
                animationType: AnimationType.fade,
                showCursor: false,
                onCompleted: (value) {
                  print(value);
                  code = value;
                  Provider.of<PhoneConfirmation>(context, listen: false)
                      .codeConfirm(code!, widget.verificationId, context);
                },
                onChanged: (value) {
                  print(value);
                },
                pinTheme: PinTheme(
                  fieldWidth: 45,
                  fieldHeight: 55,
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(12),
                  activeFillColor: Colors.grey[200],
                  inactiveFillColor: Colors.grey[200],
                  selectedFillColor: Colors.grey[200],
                ),
              ),
            ),
            const SizedBox(height: 16),
            MyAccOutlinedButton(
              label: 'Resend code',
              onPressed: () {},
              isExpanded: false,
            ),
            const Expanded(child: SizedBox()),
            Padding(
              padding: const EdgeInsets.only(bottom: 22),
              child: MyAccountButton(
                onPressed: () {
                  onPressed(context);
                },
                label: 'Continue',
              ),
            ),
          ],
        ),
      ),
    );
  }

  void onPressed(BuildContext context) {
    print(code);
    Provider.of<PhoneConfirmation>(context, listen: false)
        .codeConfirm(code!, widget.verificationId, context);
  }
}
