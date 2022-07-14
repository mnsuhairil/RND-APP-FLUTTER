
import 'dart:convert';

import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';
import 'package:untitled/Assistants/requestAssistant.dart';
import 'package:untitled/DataHandler/appData.dart';
import 'package:untitled/Models/address.dart';
import 'package:untitled/configMaps.dart';

class AssistantMethods{
  static Future<String> searchCoordinateAddress(Position position,context) async
  {
    String placeAddress = "";
    String st1="",st2,st3,st4;
    String url = "https://maps.googleapis.com/maps/api/geocode/json?latlng=${position.latitude},${position.longitude}&key=$mapKey";

    var response = await RequestAssistant.getRequest(url);

    if(response != "Failed")
      {
        String TEST = response.toString();
        print("test"+TEST);
        placeAddress = response["results"][0]["formatted_address"];
        st1 = response["results"][0]["address_components"][0]["long_name"];
        st2 = response["results"][0]["address_components"][1]["long_name"];
        //st3 = response["results"][0]["address_components"][2]["long_name"];
        /*st4 = response["results"][0]["address_components"][6]["long_name"];*/
        //placeAddress = st1+", "+st2;
        Address userPickUpAddress = new Address(placeName: placeAddress);
        userPickUpAddress.longitude=position.longitude;
        userPickUpAddress.latitude=position.latitude;


        Provider.of<AppData>(context, listen: false).updatePickUpLocationAddress(userPickUpAddress);

      }
    return placeAddress;
  }
}
