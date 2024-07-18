// ignore_for_file: use_build_context_synchronously
import 'dart:developer';

import 'package:ecommerce/src/core/helper/sharedpreferenc/sharedpreference.dart';
import 'package:ecommerce/src/core/utils/colors/colors.dart';
import 'package:ecommerce/src/core/utils/constant/width_height.dart';
import 'package:ecommerce/src/shared/presentation/pages/simple_pages/bottom_navigation.dart';
import 'package:ecommerce/src/shared/presentation/pages/simple_pages/onboarding_corosel/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashScrn extends StatefulWidget {
  const SplashScrn({super.key});

  @override
  State<SplashScrn> createState() => _SplashScrnState();
}

bool userlogged = false;

class _SplashScrnState extends State<SplashScrn> {
  @override
  void initState() {
    splashTime(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kWhite,
      body: SingleChildScrollView(
        child: Column(children: [
          kHeight80,
          Padding(
            padding: EdgeInsets.only(top: size.height * 0.17),
            child: SizedBox(
              width: size.width,
              height: size.height / 2,
              child: Lottie.asset("assets/animations/Icon.json",
                  width: size.width / 2, height: size.height / 2),
            ),
          ),
        ]),
      ),
    );
  }

  void splashTime(BuildContext contex) async {
    await Future.delayed(const Duration(milliseconds: 2900));

    bool? userLogged = await SharedPreferenceClass.getUserLoggedFun();
    log(userLogged.toString());
    if (userLogged == true) {
      navigateToDashboard();
    } else {
      navigateToOnboarding();
    }
  }

  void navigateToDashboard() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => const BottomNavigationBarPage()),
    );
  }

  void navigateToOnboarding() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => const OnBoardingScreenPage()),
    );
  }

  // void getSharedPreferenceData() async {
  //   await SharedPreferenceClass.getUserLoggedIn().then((value) {
  //     if (value != null) {
  //       setState(() {
  //         userlogged = value;
  //       });
  //     }
  //   });
  // }
}
