import 'package:caliana_clone/screen/identity/data_pribadi.dart';
import 'package:caliana_clone/screen/identity/identity.dart';
import 'package:caliana_clone/screen/identity/locator.dart';
import 'package:caliana_clone/screen/identity/review_data.dart';
import 'package:caliana_clone/screen/identity/selfie_screen.dart';
import 'package:caliana_clone/screen/navbar/navbar.dart';
import 'package:caliana_clone/screen/notification/notification_screen.dart';
import 'package:caliana_clone/screen/profile/profile_screen.dart';
import 'package:caliana_clone/screen/registration/registration_screen.dart';
import 'package:flutter/material.dart';

void main() {
   WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Caliana Clone',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      initialRoute: "/",
      routes: {
        "/" : (context) => const Navbar(),
        "/notif" : (context) => const NotificationScreen(),
        "/profile" : (context) => const ProfileScreen(),
        "/regist" : (context) => const RegistrationScreen(),
        "/identity" : (context) => const Identity(),
        "/dataPribadi" : (context) => const DataPribadi(),
        "/selfie" : (context) => const SelfieScreen(),
        "/review" : (context) => const ReviewData(),
      },
    );
  }
}

