import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:ecommerce/src/core/utils/colors/colors.dart';
import 'package:ecommerce/src/core/utils/constant/width_height.dart';
import 'package:ecommerce/src/shared/presentation/bloc/auth/auth_bloc.dart';
import 'package:ecommerce/src/shared/presentation/pages/main_pages/home/dashboard.dart';
import 'package:ecommerce/src/shared/presentation/pages/simple_pages/bottom_navigation.dart';
import 'package:ecommerce/src/shared/presentation/pages/simple_pages/sign_up_in/signup_page.dart';
import 'package:ecommerce/src/shared/presentation/pages/simple_pages/sign_up_in/text_field.dart';
import 'package:ecommerce/src/core/utils/usecases/signup_refactory.dart';
import 'package:ecommerce/src/shared/presentation/snackbar/snackbar.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInPage extends StatelessWidget {
  SignInPage({super.key});
  TextEditingController emailSignInEditingController = TextEditingController();
  TextEditingController passwordSignInEditingController =
      TextEditingController();
//
  ValueNotifier<bool> isLoginPasswordNotifier = ValueNotifier(true);
  final logInFormKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      color: kWhite,
      child: Scaffold(
          body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          state.whenOrNull(error: (message) {
            if (message ==
                "'UserSignUp.Firstname' Error:Field validation for 'Firstname' failed on the 'gte' tag") {
              message = 'Please Enter your firstname';
            }
            print(message);
            return NotificationClass().newshowSnackbar(
                context, 'Oops!', message, ContentType.failure);
          });
        },
        builder: (context, state) {
          return state.when(
            initial: () => loginMainPageFun(size, context),
            loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
            loggedIn: (token) => const BottomNavigationBarPage(),
            error: (message) => loginMainPageFun(size, context),
          );
        },
      )),
    );
  }

  Widget loginMainPageFun(Size size, BuildContext) {
    return ListView(
      //crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FamilyMartTitleWidgets(size: size),
        Padding(
          padding: const EdgeInsets.all(13.0),
          child: ValueListenableBuilder(
              valueListenable: isLoginPasswordNotifier,
              builder: (context, isPasswordNoti, child) {
                return Form(
                  key: logInFormKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Login',
                        style: GoogleFonts.poppins(
                            fontSize: 30, fontWeight: FontWeight.w600),
                      ),
                      kHeight15,
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                                builder: (context) => SignUpPage()),
                            (Route<dynamic> route) => false,
                          );
                        },
                        child: RichText(
                          text: TextSpan(
                            text: "Don't have an accout ?",
                            style: GoogleFonts.poppins(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Colors.black38),
                            children: [
                              TextSpan(
                                  text: ' Signup',
                                  style: GoogleFonts.poppins(
                                      color: kWAppColor,
                                      fontWeight: FontWeight.w500)),
                            ],
                          ),
                        ),
                      ),
                      kHeight10,
                      TextFormFieldWidget(
                        label: 'Email',
                        star: '*',
                        controller: emailSignInEditingController,
                        preffixIcon: Icons.email_outlined,
                        hintText: 'Email',
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your email';
                          } else if (EmailValidator.validate(value)) {
                            return null;
                          } else {
                            return 'email is not valid';
                          }
                        },
                      ),
                      kHeight10,
                      TextFormFieldWidget(
                        label: 'Password ',
                        star: '*',
                        preffixIcon: Icons.key,
                        hintText: 'Password',
                        controller: passwordSignInEditingController,
                        validator: (value) {
                          RegExp regex = RegExp(
                              r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
                          if (value!.isEmpty) {
                            return 'Please enter password';
                          } else {
                            if (!regex.hasMatch(value)) {
                              return 'Enter strong password';
                            } else {
                              return null;
                            }
                          }
                        },
                        obscureText: isPasswordNoti,
                        suffixIcon: isPasswordNoti == true
                            ? Icons.visibility_off
                            : Icons.visibility,
                        suffixOnPressed: () {
                          isLoginPasswordNotifier.value = !isPasswordNoti;
                        },
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                              onPressed: () {},
                              child: Text(
                                'Forgot password?',
                                style: GoogleFonts.poppins(),
                              )),
                        ],
                      ),
                      kHeight10,
                      SizedBox(
                        width: size.width,
                        child: ElevatedButtonWidget(
                            backgroundColor: kBlack,
                            textColor: kWhite,
                            fontSize: 18,
                            text: 'Login',
                            onPressed: () {
                              if (logInFormKey.currentState!.validate()) {
                                userSignInDataModelFun(
                                    emailSignInEditingController.text.trim(),
                                    passwordSignInEditingController.text.trim(),
                                    context);
                              }
                            }),
                      ),
                      kHeight15,
                      Divider(),
                      kHeight15,
                      GoogleElevatedBottonWidget(
                        size: size,
                        text: "Loign with Google",
                        onPressed: () {},
                      )
                    ],
                  ),
                );
              }),
        )
      ],
    );
  }
}
