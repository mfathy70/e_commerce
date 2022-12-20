import 'package:e_commerce/UI/screens/Home%20Screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool animate = false;
  @override
  void initState() {
    super.initState();
    startAnimation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: Center(
          child: SizedBox(
            width: 350,
            height: 350,
            child: Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              child: Lottie.asset(
                'assets/animation/splash.json',
                fit: BoxFit.contain,
                repeat: false,
              ),
            ),
          ),
        ));
  }

  Future startAnimation() async {
    await Future.delayed(const Duration(milliseconds: 1800));
    setState(() {
      animate = true;
    });
    await Future.delayed(const Duration(milliseconds: 1800));
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const HomeScreen()));
  }
}
