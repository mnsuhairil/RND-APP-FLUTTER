//import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:driver_rnd_app/Models/rideDetails.dart';
import 'package:driver_rnd_app/Notification/notificationDialog.dart';
import 'package:driver_rnd_app/configMaps.dart';
import 'package:driver_rnd_app/main.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'dart:io' show Platform;

import 'package:google_maps_flutter/google_maps_flutter.dart';

class PushNotificationService {
  final FirebaseMessaging firebaseMessaging = FirebaseMessaging();

  Future initialize(context) async {
    firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) async {
        retrieveRideRequestInfo(getRideRequestId(message), context);
      },
      onLaunch: (Map<String, dynamic> message) async {
        retrieveRideRequestInfo(getRideRequestId(message), context);
      },
      onResume: (Map<String, dynamic> message) async {
        retrieveRideRequestInfo(getRideRequestId(message), context);
      },
    );
  }

  Future<String> getToken() async {
    String token = await firebaseMessaging.getToken();
    driverRef.child(currentfirebaseUser.uid).child("token").set(token);
    print("This is token : " + token.toString());

    firebaseMessaging.subscribeToTopic("alldrivers");
    firebaseMessaging.subscribeToTopic("allusers");
  }

  String rideRequestId = "";
  String getRideRequestId(Map<String, dynamic>message)
  {
    if(Platform.isAndroid){
      rideRequestId = message['data']['ride_request_id'];
    }
    else{
      rideRequestId = message['ride_request_id'];
    }

    return rideRequestId;
  }

  void retrieveRideRequestInfo(String rideRequestId, BuildContext context)
  {
    print("testrider"+rideRequestId);
    newRequestRef.child(rideRequestId).once().then((DataSnapshot dataSnapshot){
      print("IM HERE : "+dataSnapshot.value.toString());
      if(dataSnapshot.value != null)
        {
          //assetsAudioPlayer.open(Audio("sounds/alert.mp3"));
          //assetsAudioPlayer.play();

          double pickUpLocationLat = double.parse(dataSnapshot.value['pickup']['latitude'].toString());
          double pickUpLocationLng = double.parse(dataSnapshot.value['pickup']['longitude'].toString());
          String pickUpAddress = dataSnapshot.value['pickup_address'].toString();

          double dropOffLocationLat = double.parse(dataSnapshot.value['dropOff']['latitude'].toString());
          double dropOffLocationLng = double.parse(dataSnapshot.value['dropOff']['longitude'].toString());
          String dropOffAddress = dataSnapshot.value['dropOff_address'].toString();

          String paymentMethod = dataSnapshot.value['payment_method'].toString();

          String rider_name = dataSnapshot.value["rider_name"];
          String rider_phone = dataSnapshot.value["rider_phone"];

          RideDetails rideDetails = RideDetails();
          rideDetails.ride_request_id = rideRequestId;
          rideDetails.pickup_address = pickUpAddress;
          rideDetails.dropOff_address = dropOffAddress;
          rideDetails.pickup = LatLng(pickUpLocationLat, pickUpLocationLng);
          rideDetails.dropOff = LatLng(dropOffLocationLat, dropOffLocationLng);
          rideDetails.payment_method = paymentMethod;
          rideDetails.rider_name = rider_name;
          rideDetails.rider_phone = rider_phone;

          print("Information :: ");
          print(rideDetails.pickup_address);
          print(rideDetails.dropOff_address);

          showDialog(
              context: context,
              barrierDismissible: false,
              builder: (BuildContext context) => NotificationDialog(rideDetails: rideDetails,),
          );
        }
    }
    );
  }
}
