import 'package:e_commerce/providers/phone_confirmation_provider.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';

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
            icon: Icon(
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
            SizedBox(height: 16),
            Text(
              'We sent you a six digit number.',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 16),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 18),
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
                  //Provider.of<PhoneConfirmation>(context, listen: false)
                  //.codeConfirm(value);
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
            SizedBox(height: 16),
            OutlinedButton(
              onPressed: () {},
              child: Text(
                'Resend code',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 19,
                    fontWeight: FontWeight.w600),
              ),
              style: OutlinedButton.styleFrom(
                  side: BorderSide(
                      width: 2.3, color: Colors.grey.withOpacity(0.8)),
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12)),
            ),
            Expanded(child: SizedBox()),
            Padding(
              padding: const EdgeInsets.only(bottom: 22),
              child: ElevatedButton(
                onPressed: () {
                  print(code);
                  Provider.of<PhoneConfirmation>(context, listen: false)
                      .codeConfirm(code!, widget.verificationId, context);
                },
                child: Text(
                  'Continue',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w600),
                ),
                style: ElevatedButton.styleFrom(
                    fixedSize: Size(360, 60),
                    backgroundColor: Theme.of(context).primaryColor,
                    padding:
                        EdgeInsets.symmetric(horizontal: 70, vertical: 14)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
