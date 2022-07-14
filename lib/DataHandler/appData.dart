import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:untitled/Models/address.dart';

class AppData extends ChangeNotifier{

    Address pickUpLocation = Address(placeName: '');

void updatePickUpLocationAddress(Address pickUpAddress)
{
  pickUpLocation = pickUpAddress;
  notifyListeners();
}

}