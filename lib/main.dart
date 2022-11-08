import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:punditv/firebase_options.dart';
import 'package:punditv/provider/banner_provider.dart';

import 'package:punditv/provider/sign_in_provider.dart';
import 'package:punditv/screens/welcome_page/splash.dart';

import 'provider/internet_provider.dart';

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
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: ((context) => SignInProvider())),
          ChangeNotifierProvider(create: ((context) => InternetProvider())),
          ChangeNotifierProvider(create: (_) => SignInProvider()),
          ChangeNotifierProvider(create: (_) => BannerProvider())
        ],
        child: MaterialApp(
          theme: ThemeData(fontFamily: 'Poppins'),
          debugShowCheckedModeBanner: false,
          home: const SplashScreen(),
        ));
  }
}
