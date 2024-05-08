import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:untitled3/Provider/popular.dart';
import 'package:untitled3/home.dart';
import 'package:provider/provider.dart';
import 'package:untitled3/search.dart';
import 'package:untitled3/settings.dart';
import 'package:untitled3/signUp.dart';
import 'package:untitled3/signin.dart';
import 'package:untitled3/structures/test.dart';
import 'package:untitled3/tripsmain.dart';
import 'package:untitled3/welcome.dart';
import 'EditProfile.dart';
import 'Provider/activity.dart';
import 'Provider/favourite.dart';
import 'Provider/hotel.dart';
import 'Provider/hotelPageState.dart';
import 'Provider/searchPage.dart';
import 'activity.dart';
import 'addCar.dart';
import 'booking.dart';
import 'hotel.dart';
import 'package:untitled3/StaysSearch.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'addHotel.dart';
import 'addActivity.dart';
import 'flights.dart';
import 'package:untitled3/forgotPassword.dart';
import 'package:untitled3/Provider/User.dart';
import 'guestdetails.dart';
import 'hotelBooking.dart';

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
    var user = FirebaseAuth.instance.currentUser?.uid;
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home:user==null ? signIn():home(),
        //'/Hotel',

        routes: {
          '/signup': (context) => const signUp(),

          '/editProfile': (context) => const editProfile(),
          '/addHotel': (context) => const addHotel(),
          '/addCar': (context) => const addCar(),
          '/addActivity': (context) => const addActivity(),
          '/forgetpass': (context) => const forgotPassword(),
          '/signin': (context) => const signIn(),
          '/home': (context) => const home(),
          '/search': (context) =>  search(),
          '/guestdetails': (context) => const guestDetails(),
          '/trips': (context) => const trips(),
          '/settings': (context) => const settings(),
          '/test': (context) => const test(),
          '/hotelsearch': (context) => const hotelSearch(),
          '/flights': (context) => const flights(),
          '/Hotel': (context) =>  Hotel(),
          '/Activity': (context) =>  Activity(),
          '/hotelBooking': (context) =>  hotelBooking(),
          '/activityBooking': (context) =>  activityBooking(),
        },
      );
  }
}
