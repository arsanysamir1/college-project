import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:untitled3/home.dart';
import 'package:untitled3/save.dart';
import 'package:untitled3/search.dart';
import 'package:untitled3/settings.dart';
import 'package:untitled3/signUp.dart';
import 'package:untitled3/signin.dart';
import 'package:untitled3/structures/test.dart';
import 'package:untitled3/tripsmain.dart';
import 'EditProfile.dart';
import 'hotel.dart';
import 'package:untitled3/StaysSearch.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'addHotel.dart';
import 'flights.dart';
import 'package:untitled3/forgotPassword.dart';

import 'guestdetails.dart';
void main() async {

  await WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var  user=FirebaseAuth.instance.currentUser;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/home',
      //'/Hotel',

      routes: {
        '/signup': (context) => const signUp(),
        '/editProfile': (context) => const editProfile(),
        '/addHotel': (context) => const addHotel(),
        '/guestdetails': (context) => const guestDetails(),
        '/forgetpass': (context) => const forgotPassword(),
        '/signin': (context) => const signIn(),
        '/': (context) => const home(),
        '/search': (context) => const search(),
        '/home': (context) => const home(),
        '/trips': (context) => const trips(),
        '/settings': (context) => const settings(),
        '/test': (context) => const test(),
        '/hotelsearch': (context) => const hotelSearch(),
        '/flights': (context) => const flights(),
        '/Hotel': (context) => const Hotel(),
      },
    );
  }
}
