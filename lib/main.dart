import 'package:ecommerce/firebase_options.dart';
import 'package:ecommerce/src/core/utils/colors/colors.dart';
import 'package:ecommerce/src/shared/domain/repositories/auth/auth.dart';
import 'package:ecommerce/src/shared/presentation/bloc/auth/auth_bloc.dart';
import 'package:ecommerce/src/shared/presentation/pages/simple_pages/splash_screen/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => AuthBloc(AuthRepository())),
      ],
      child: MaterialApp(
        title: 'Familymart',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            scaffoldBackgroundColor: kWhite,
            // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
            textTheme: GoogleFonts.poppinsTextTheme()),
        home: const SplashScrn(),
      ),
    );
  }
}
