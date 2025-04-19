// ignore_for_file: use_build_context_synchronously

import 'package:blood_donation_app/routes/routes.dart';
import 'package:blood_donation_app/util/appstyles.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _logoAnimation;
  late Animation<Offset> _textAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _logoAnimation = Tween<Offset>(
      begin: const Offset(0, -1),
      end: const Offset(0, 0),
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _textAnimation = Tween<Offset>(
      begin: const Offset(-1, 0),
      end: const Offset(0, 0),
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _controller.forward();

    Future.delayed(const Duration(seconds: 10), () {
      if (context.mounted) {
        context.goNamed(AppRoutes.main.name);
      }
    });

  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyles.mainColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SlideTransition(
              position: _logoAnimation,
              child: Image.asset('assets/logo.png', width: 150),
            ),
            const SizedBox(height: 20),
            SlideTransition(
              position: _textAnimation,
              child: Text('Blood Donation App',style: AppStyles.titleTextStyle,),
            ),
            SlideTransition(
              position: _textAnimation,
              child: Text(
                ' रक्तदान है प्राणी पूजा \nइसके जैसा ना दान टूजा', style: AppStyles.normalTextStyle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
