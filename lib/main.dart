import 'package:driver_rnd_app/AllScreens/carInfoScreen.dart';
import 'package:driver_rnd_app/configMaps.dart';
import 'package:firebase_auth/firebase_auth.dart';
//import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:driver_rnd_app/AllScreens/loginScreen.dart';
import 'package:driver_rnd_app/AllScreens/mainscreen.dart';
import 'package:driver_rnd_app/AllScreens/registerationScreen.dart';

import 'DataHandler/appData.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  currentfirebaseUser = FirebaseAuth.instance.currentUser;

  runApp(MyApp());
}

DatabaseReference databaseReference =
    FirebaseDatabase.instance.reference().child("users");
DatabaseReference driverRef =
    FirebaseDatabase.instance.reference().child("drivers");
DatabaseReference newRequestRef = FirebaseDatabase.instance.reference().child("Ride Request");
DatabaseReference rideRequestRef =
FirebaseDatabase.instance.reference().child("drivers").child(currentfirebaseUser.uid).child("newRide");


class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AppData(),
      child: MaterialApp(
        title: 'RnD Driver App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: FirebaseAuth.instance.currentUser == null ? LoginScreen.idScreen : MainScreen.idScreen,
        routes: {
          RegisterationScreen.idScreen: (context) => RegisterationScreen(),
          LoginScreen.idScreen: (context) => LoginScreen(),
          MainScreen.idScreen: (context) => MainScreen(),
          CarInfoScreen.idScreen: (context) => CarInfoScreen(),
        },
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
