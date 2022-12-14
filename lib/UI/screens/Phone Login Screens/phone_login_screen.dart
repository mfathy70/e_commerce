import 'package:e_commerce/providers/phone_confirmation_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class PhoneLoginScreen extends StatefulWidget {
  const PhoneLoginScreen({super.key});

  @override
  State<PhoneLoginScreen> createState() => _PhoneLoginScreenState();
}

class _PhoneLoginScreenState extends State<PhoneLoginScreen> {
  TextEditingController phoneNumberController = TextEditingController();

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
        title: Text("Phone Number"),
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(14.0),
                child: Image.asset(
                  "assets/images/logo.jpg",
                  scale: 15,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Text(
                  "What's your phone number?",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(width: 0.1, color: Colors.grey)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(width: 0.1, color: Colors.grey)),
                  fillColor: Colors.blueGrey[50],
                  isDense: true,
                  filled: true,
                  hintText: "Phone Number",
                  hintStyle: TextStyle(color: Colors.black, fontSize: 16),
                  prefixIcon: Text(
                    '   +20   ',
                    style: TextStyle(fontSize: 16),
                  ),
                  prefixIconConstraints:
                      BoxConstraints(minWidth: 22, maxHeight: 22),
                  suffixIcon: Icon(
                    Icons.search_rounded,
                    size: 24,
                    color: Colors.black,
                  ),
                  suffixIconColor: Colors.black,
                ),
                keyboardType: TextInputType.phone,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ],
                controller: phoneNumberController,
              ),
              Expanded(child: SizedBox()),
              Padding(
                padding: const EdgeInsets.only(bottom: 22),
                child: ElevatedButton(
                  onPressed: () {
                    print("+20${phoneNumberController.text}");
                    Provider.of<PhoneConfirmation>(context, listen: false)
                        .phoneLogin(phoneNumberController.text, context);
                  },
                  child: Text(
                    'Send confirmation code',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).primaryColor,
                      padding:
                          EdgeInsets.symmetric(horizontal: 70, vertical: 14)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}