import 'package:firebase_database/firebase_database.dart';

class Historys
{
  String paymentMethod;
  String createAt;
  String status;
  String fares;
  String dropOff;
  String pickup;

  Historys({this.paymentMethod, this.createAt, this.status, this.fares,
      this.dropOff, this.pickup});

  Historys.fromSnapshot(DataSnapshot snapshot)
  {
    paymentMethod = snapshot.value["payment_method"];
    createAt = snapshot.value["created_at"];
    status = snapshot.value["status"];
    fares = snapshot.value["fares"];
    dropOff = snapshot.value["dropOff_address"];
    pickup = snapshot.value["pickup_address"];
  }
}