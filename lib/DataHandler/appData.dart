import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:driver_rnd_app/Models/address.dart';

import '../Models/history.dart';

class AppData extends ChangeNotifier {
  String earnings = "0";
  int tripCount = 0;
  List<String> tripHistoryKeys=[];
  List<Historys> tripHistoryDataList=[];

  void updateEarnings(String updatedEarnings)
  {
    earnings = updatedEarnings;
    notifyListeners();
  }

  void updateTripCounter(int tripCounter)
  {
    tripCount = tripCounter;
    notifyListeners();
  }

  void updateTripKeys(List<String> newKeys)
  {
    tripHistoryKeys = newKeys;
    notifyListeners();
  }

  void updateTripHistoryData(Historys eachHistory)
  {
    tripHistoryDataList.add(eachHistory);
    notifyListeners();
  }

}
