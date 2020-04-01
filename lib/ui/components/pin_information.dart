import 'package:cinema/ui/components/google_maps.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PinInformation {
  String pinPath;
  String avatarPath;
  LatLng location;
  String locationName;
  Color labelColor;
  PinInformation({
    this.pinPath,
    this.avatarPath,
    this.location,
    this.locationName,
    this.labelColor});
}

class MapPinPillComponent extends StatefulWidget {
  double pinPillPosition;
  PinInformation currentlySelectedPin;
  MapPinPillComponent({
    this.pinPillPosition,
    this.currentlySelectedPin
  });
  @override
  State<StatefulWidget> createState() =>
      MapPinPillComponentState();
}
class MapPinPillComponentState extends State<MapPinPillComponent> {
  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
        bottom: widget.pinPillPosition,
      right: 0,
      left: 0,
      duration: Duration(milliseconds: 400),
      child: Align(
          alignment: Alignment.bottomCenter,
          child: Container(
              margin: EdgeInsets.all(20),
              height: 70,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                        blurRadius: 20,
                        offset: Offset.zero,
                        color: Colors.grey.withOpacity(0.5))
                  ]),
              child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(left: 10),
                      width: 50,
                      height: 50,
                      child: ClipOval(
                          child: Image.asset(
                              currentlySelectedPin.avatarPath,
                              fit: BoxFit.cover)),
                    ), // first widget
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(left: 20),
                        child: Column(
                          crossAxisAlignment:
                          CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(currentlySelectedPin.locationName,
                                style: TextStyle(
                                    color: currentlySelectedPin
                                        .labelColor)),
                            Text(
                                'Latitude: ${currentlySelectedPin.location.latitude.toString()}',
                                style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey)),
                            Text(
                                'Longitude: ${currentlySelectedPin.location.longitude.toString()}',
                                style: TextStyle(
                                    fontSize: 12, color: Colors.grey))
                          ], // end of Column Widgets
                        ), // end of Column
                      ), // end of Container
                    ), // end of Expanded
                    Padding(
                        padding: EdgeInsets.all(15),
                        child: Image.asset(
                            currentlySelectedPin.pinPath,
                            width: 50,
                            height: 50)) // end of Padding
                  ]))),
    );
  }
}
