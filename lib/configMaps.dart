import 'dart:async';
//import 'package:assets_audio_player/assets_audio_player.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:geolocator/geolocator.dart';

import 'Models/allUsers.dart';
import 'Models/drivers.dart';

String mapKey = "AIzaSyCcKqLkO8na_BrQw3sPDfVGEGLPwUdvr-0";

User firebaseUser;

Users userCurrentInfo;

User currentfirebaseUser;

StreamSubscription<Position> homeTabPageStreamSubscription;

StreamSubscription<Position> rideStreamSubscription;

//final assetsAudioPlayer = AssetsAudioPlayer();

Position currentPosition;

Drivers driversInformation;

String title = "";

double starCounter = 0.0;

String rideType = "";
