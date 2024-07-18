import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:ecommerce/src/core/utils/colors/colors.dart';
import 'package:ecommerce/src/core/utils/constant/width_height.dart';
import 'package:ecommerce/src/shared/domain/models/user_data_model.dart';
import 'package:ecommerce/src/shared/presentation/bloc/auth/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class FamilyMartTitleWidgets extends StatelessWidget {
  const FamilyMartTitleWidgets({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Row(
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            Container(
              alignment: Alignment.centerLeft,
              width: size.width / 2 * 0.67,
              // color: kDarkBlueColor,
              child: Image.asset(
                "assets/images/familymarticon.png",
                height: size.height / 2 * 0.1,
              ),
            ),
            Positioned(
              right: 1,
              child: Container(
                alignment: Alignment.center,
                height: 42,
                child: AnimatedTextKit(
                    totalRepeatCount: 3000,
                    pause: const Duration(milliseconds: 1000),
                    animatedTexts: [
                      ColorizeAnimatedText('AMILY MART',
                          textStyle: GoogleFonts.poppins(
                              fontSize: 15, fontWeight: FontWeight.w600),
                          colors: [kDarkBlueColor, kBlack])
                    ]),
              ),
            )
          ],
        ),
      ],
    );
  }
}

////////////////////////////////////////////////
///
class ElevatedButtonWidget extends StatelessWidget {
  ElevatedButtonWidget({
    super.key,
    required this.backgroundColor,
    required this.textColor,
    required this.fontSize,
    required this.text,
    required this.onPressed,
  });
  final Color backgroundColor;
  final Color textColor;
  final double? fontSize;
  FontWeight? fontWeight;
  final String text;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(backgroundColor),
        ),
        child: Text(
          text,
          style: GoogleFonts.poppins(
            color: textColor, //white
            fontSize: fontSize, //18
            fontWeight: fontWeight, //w500
          ),
        ));
  }
}
////////////////////

class GoogleElevatedBottonWidget extends StatelessWidget {
  const GoogleElevatedBottonWidget({
    super.key,
    required this.size,
    this.onPressed,
    required this.text,
  });

  final Size size;
  final void Function()? onPressed;
  final String text;
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/google.png',
              width: (size.width / 2) * 0.2,
            ),
            kWidth10,
            Text(
              text,
              style: GoogleFonts.poppins(
                  color: kBlack, fontSize: 16, fontWeight: FontWeight.w600),
            ),
          ],
        ));
  }
}
///////////////////////

void userInputDataModelClassFun(String nameEditing, String phoneNumberEditing,
    String emailEditin, String passwordEditing, BuildContext context) {
  List<String> namelist = nameEditing.split(' ');
  final signUpModel = UserModel(
      firstname: namelist[0],
      lastname: namelist.length == 2 ? namelist[1] : '',
      phoneNumber: "+91$phoneNumberEditing",
      emailId: emailEditin,
      password: passwordEditing);
  context.read<AuthBloc>().add(AuthEvent.signUp(signUpModel));
}

//
void userSignInDataModelFun(
    String email, String password, BuildContext context) {
  final signInDataModel = UserModel(
    emailId: email,
    password: password,
  );
  context.read<AuthBloc>().add(AuthEvent.logIn(signInDataModel));
}
