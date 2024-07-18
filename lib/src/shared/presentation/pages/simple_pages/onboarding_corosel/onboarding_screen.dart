import 'package:ecommerce/src/core/utils/colors/colors.dart';
import 'package:ecommerce/src/core/utils/constant/width_height.dart';
import 'package:ecommerce/src/shared/presentation/pages/simple_pages/sign_up_in/signin_page.dart';
import 'package:ecommerce/src/shared/presentation/pages/simple_pages/sign_up_in/signup_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class OnBoardingScreenPage extends StatelessWidget {
  const OnBoardingScreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return OnBoardingSlider(
      finishButtonText: 'Get Started ',
      onFinish: () {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (context) => SignUpPage(),
            ),
            (route) => false);
      },
      finishButtonStyle: const FinishButtonStyle(
        backgroundColor: kBlack,
      ),
      skipTextButton: const Text(
        'Skip',
        style: TextStyle(
          fontSize: 16,
          color: kDarkBlueColor,
          fontWeight: FontWeight.w600,
        ),
      ),
      trailing: const Text(
        'Login',
        style: TextStyle(
          fontSize: 16,
          color: kDarkBlueColor,
          fontWeight: FontWeight.w600,
        ),
      ),
      trailingFunction: () {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (context) => SignInPage(),
            ),
            (route) => false);
      },
      controllerColor: kBlack,
      totalPage: 3,
      headerBackgroundColor: Colors.white,
      pageBackgroundColor: Colors.white,
      background: [
        SizedBox(
          width: size.width,
          child: Lottie.asset("assets/animations/X3iL6g0EPT.json",
              width: size.width / 2, height: size.height / 2),
        ),
        SizedBox(
          width: size.width,
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Image.asset("assets/gif/Retailmarkdown.gif",
                width: (size.width / 2), height: size.height / 2),
          ),
        ),
        SizedBox(
          width: size.width,
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: Image.asset("assets/gif/Onlinetransactions.gif",
                width: size.width / 2, height: size.height / 2),
          ),
        ),
      ],
      speed: 1.8,
      pageBodies: [
        Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const SizedBox(
                height: 480,
              ),
              Text('Explore a  Wide range of products',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: kBlack)),
              kHeight10,
              Text(
                  'Explore a Wide range of products at your fingertips.FamilyMart offers an extensive collections to suit your needs',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                      color: Colors.black26)),
            ],
          ),
        ),
        Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 480,
              ),
              Text(
                'Unlock exclusive offers and discounts',
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                    fontSize: 24, fontWeight: FontWeight.w600, color: kBlack),
              ),
              kHeight10,
              Text(
                  'Get access to limited- time deals and special promotions available only to our valued customers',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                      color: Colors.black26)),
            ],
          ),
        ),
        Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 480),
              Text('Safe and secure payments',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: kBlack)),
              kHeight10,
              Text(
                  'FamilyMart employs industry-leading encryption and trusted payment gateways to safegaurd your your personal information',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                      color: Colors.black26)),
            ],
          ),
        ),
      ],
    );
  }
}
