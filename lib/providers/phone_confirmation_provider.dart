import 'dart:math';

import 'package:e_commerce/UI/widgets/loading_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../UI/screens/Phone Login Screens/code_onfirmation_screen.dart';

class PhoneConfirmation extends ChangeNotifier {
  String phone = " ";
  String code = " ";

  Future<void> phoneLogin(String phonenumber, BuildContext context) async {
    phone = "+20$phonenumber";
    FirebaseAuth auth = FirebaseAuth.instance;

    await auth.verifyPhoneNumber(
      phoneNumber: "+20$phonenumber",
      timeout: Duration(seconds: 60),
      verificationCompleted: (PhoneAuthCredential credential) async {
        await auth.signInWithCredential(credential);
      },
      verificationFailed: (e) {
        print(e.message);
        final snackBar = SnackBar(content: Text(e.code));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      },
      codeSent: ((String verificationId, int? resendToken) async {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return CodeConfirmationScreen(
            phoneNumber: '+20$phonenumber',
            verificationId: verificationId,
          );
        }));
      }),
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
    notifyListeners();
  }

  void codeConfirm(
      String value, String verificationId, BuildContext context) async {
    code = value;

    final credential = PhoneAuthProvider.credential(
        verificationId: verificationId, smsCode: value);

    try {
      await FirebaseAuth.instance
          .signInWithCredential(credential)
          .then((value) => print("Account created"));
      Navigator.popUntil(context, ModalRoute.withName('/'));
    } catch (e) {
      final snackBar = SnackBar(content: Text("Invalid Verification code"));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }

    print("$code provided");
    notifyListeners();
  }
}
