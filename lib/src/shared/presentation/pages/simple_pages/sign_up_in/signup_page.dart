import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:ecommerce/src/core/utils/colors/colors.dart';
import 'package:ecommerce/src/core/utils/constant/width_height.dart';
import 'package:ecommerce/src/shared/presentation/bloc/auth/auth_bloc.dart';
import 'package:ecommerce/src/shared/presentation/pages/simple_pages/bottom_navigation.dart';
import 'package:ecommerce/src/shared/presentation/pages/simple_pages/sign_up_in/signin_page.dart';
import 'package:ecommerce/src/shared/presentation/pages/simple_pages/sign_up_in/text_field.dart';
import 'package:ecommerce/src/core/utils/usecases/signup_refactory.dart';
import 'package:ecommerce/src/shared/presentation/snackbar/snackbar.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

TextEditingController nameEditingController = TextEditingController();
TextEditingController emailEditingController = TextEditingController();
TextEditingController passwordEditingController = TextEditingController();
TextEditingController phoneNumberEditingController = TextEditingController();
ValueNotifier<bool> isPasswordNotifier = ValueNotifier(true);
final signUpFormKey = GlobalKey<FormState>();

class SignUpPage extends StatelessWidget {
  SignUpPage({super.key});

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
                  "Key: 'UserSignUp.Lastname' Error:Field validation for 'Lastname' failed on the 'gte' tag") {
                message = 'Please Enter your lastname';
              }
              print(message);
              return NotificationClass().newshowSnackbar(
                  context, 'Oops!', message, ContentType.failure);
            });
          },
          builder: (context, state) {
            return state.when(
              initial: () => signUpWidgetFun(size, context),
              loading: () => const Center(
                child: CircularProgressIndicator(),
              ),
              loggedIn: (token) => const BottomNavigationBarPage(),
              error: (message) => signUpWidgetFun(size, context),
            );
          },
        ),
      ),
    );
  }
}

Widget signUpWidgetFun(Size size, BuildContext context) {
  return SingleChildScrollView(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
    Padding(
      padding: const EdgeInsets.only(top: 33),
      child: FamilyMartTitleWidgets(size: size),
    ),
    Padding(
      padding: const EdgeInsets.all(13.0),
      child: ValueListenableBuilder(
          valueListenable: isPasswordNotifier,
          builder: (context, isPassword, child) {
            return Form(
              key: signUpFormKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Signup',
                    style: GoogleFonts.poppins(
                        fontSize: 30, fontWeight: FontWeight.w600),
                  ),
                  kHeight15,
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (context) => SignInPage()),
                        (Route<dynamic> route) => false,
                      );
                    },
                    child: RichText(
                      text: TextSpan(
                        text: 'Already have an Account? ',
                        style: GoogleFonts.poppins(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: Colors.black38),
                        children: [
                          TextSpan(
                              text: ' Login',
                              style: GoogleFonts.poppins(
                                  color: kWAppColor,
                                  fontWeight: FontWeight.w500)),
                        ],
                      ),
                    ),
                  ),
                  kHeight10,
                  Column(
                    children: [
                      TextFormFieldWidget(
                        label: 'Name ',
                        star: '*',
                        preffixIcon: Icons.person,
                        hintText: 'Name',
                        controller: nameEditingController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your name';
                          } else if (value.length < 3) {
                            return 'Enter atleast 3 charecters';
                          } else {
                            return null;
                          }
                        },
                      ),
                      kHeight10,
                      TextFormFieldWidget(
                        label: 'Phone ',
                        star: '*',
                        preffixIcon: Icons.phone,
                        hintText: 'Phone number',
                        controller: phoneNumberEditingController,
                        keyboardType: TextInputType.phone,
                        validator: (value) {
                          String patttern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
                          RegExp regExp = RegExp(patttern);
                          if (value!.isEmpty) {
                            return 'Please enter your phone number ';
                          } else if (!regExp.hasMatch(value)) {
                            return 'Please enter valid mobile number';
                          } else {
                            return null;
                          }
                        },
                      ),
                      kHeight10,
                      TextFormFieldWidget(
                        label: 'Email ',
                        star: '*',
                        preffixIcon: Icons.email_outlined,
                        hintText: 'Email',
                        controller: emailEditingController,
                        keyboardType: TextInputType.emailAddress,
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
                        controller: passwordEditingController,
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
                        obscureText: isPassword,
                        suffixIcon: isPassword == true
                            ? Icons.visibility_off
                            : Icons.visibility,
                        suffixOnPressed: () {
                          isPasswordNotifier.value = !isPassword;
                        },
                      ),
                    ],
                  ),
                  kHeight15,
                  SizedBox(
                    width: size.width,
                    child: ElevatedButtonWidget(
                      text: 'Create Account',
                      backgroundColor: kBlack,
                      textColor: kWhite,
                      fontSize: 18,
                      onPressed: () {
                        if (signUpFormKey.currentState!.validate()) {
                          userInputDataModelClassFun(
                              nameEditingController.text.trim(),
                              phoneNumberEditingController.text.trim(),
                              emailEditingController.text.trim(),
                              passwordEditingController.text.trim(),
                              context);
                        }
                      },
                    ),
                  ),
                  kHeight15,
                  const Divider(),
                  kHeight10,
                  GoogleElevatedBottonWidget(
                    size: size,
                    text: "Signup with Google",
                    onPressed: () {},
                  )
                ],
              ),
            );
          }),
    )
  ]));
}
