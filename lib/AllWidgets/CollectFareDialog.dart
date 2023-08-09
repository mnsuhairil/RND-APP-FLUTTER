import 'package:driver_rnd_app/Assistants/assistantMethod.dart';
import 'package:driver_rnd_app/configMaps.dart';
import 'package:flutter/material.dart';

class CollectFareDialog extends StatelessWidget {

  final String paymentMethod;
  final double fareAmount;

  CollectFareDialog({this.paymentMethod,this.fareAmount});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(

        borderRadius: BorderRadius.circular(12.0),
      ), // RoundedRectangleBorder
      backgroundColor: Colors.transparent,
      child: Container(
        margin: EdgeInsets.all(5.0),
        width: double.infinity,

        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5.0),
        ), // BoxDecoration

        child: Column(
          mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 22.0,),

              Text("Trip Fare ("+rideType+")"),

              SizedBox(height: 22.0,),

              Divider(),

              SizedBox(height: 16.0,),

              Text("\R\M$fareAmount",style: TextStyle(fontSize: 55.0,fontFamily: "Brand-Bold"),),

              SizedBox(height: 16.0,),

              Padding(padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: RaisedButton(
                  onPressed: () async
                  {
                    Navigator.pop(context);
                    Navigator.pop(context);

                    AssistantMethods.enableHomeTabLiveLocationUpdates();
                  },
                  color: Colors.deepPurpleAccent,
                  child: Padding(
                    padding: EdgeInsets.all(17.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Collect Cash",style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold,color: Colors.white),),
                        Icon(Icons.attach_money,color: Colors.white,size: 26.0,),
                      ],
                    ),
                  ),
                ),
              ),

              SizedBox(height: 30.0,),
            ],
        ), // Column
      ), // Container
    );
  }
}