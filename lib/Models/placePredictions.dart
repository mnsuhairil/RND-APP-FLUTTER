//import 'package:driver_rnd_app/main.dart';

class PlacePrediction {
  String secondary_text, main_text, place_id;

  PlacePrediction({this.secondary_text, this.main_text, this.place_id});

  PlacePrediction.formJson(Map<String, dynamic> json) {
    //print("jsonText "+ json.toString());
    place_id = json["place_id"];
    main_text = json["structured_formatting"]["main_text"];
    secondary_text = json["structured_formatting"]["secondary_text"];
    print("here" + secondary_text.toString());
    print("here" + main_text.toString());

    print("testPLaceID " + place_id.toString());
  }
}
