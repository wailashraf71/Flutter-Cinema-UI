import 'package:cinema/ui/components/pin_information.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';
import 'package:flutter/material.dart';

const double CAMERA_ZOOM = 13;
const double CAMERA_TILT = 0;
const double CAMERA_BEARING = 30;
const LatLng SOURCE_LOCATION = LatLng(36.3523821, 43.1586923);
const LatLng DEST_LOCATION = LatLng(36.377747, 43.144942);

double pinPillPosition = -100;

PinInformation currentlySelectedPin = PinInformation(
    pinPath: '',
    avatarPath: '',
    location: LatLng(0, 0),
    locationName: '',
    labelColor: Colors.grey);
PinInformation sourcePinInfo;
PinInformation destinationPinInfo;

class GoogleMaps extends StatefulWidget {
  GoogleMaps({@required Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => GoogleMapsState();
}

class GoogleMapsState extends State<GoogleMaps> {
  Completer<GoogleMapController> _controller = Completer();
  Set<Marker> _markers = {};
  Set<Polyline> _polylines = {};
  List<LatLng> polylineCoordinates = [];
  PolylinePoints polylinePoints = PolylinePoints();
  String googleAPIKey = 'AIzaSyCz3UD7kkPhBtspTyczrpVuecs7TerSRgQ';

  BitmapDescriptor sourceIcon;
  BitmapDescriptor destinationIcon;

  @override
  void initState() {
    super.initState();
    setSourceAndDestinationIcons();
  }

  void setSourceAndDestinationIcons() async {
    sourceIcon = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(devicePixelRatio: 2.5),
        'assets/images/driving_pin.png');
    destinationIcon = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(devicePixelRatio: 2.5),
        'assets/images/tower.png');
  }

  @override
  Widget build(BuildContext context) {
    CameraPosition initialLocation = CameraPosition(
        zoom: CAMERA_ZOOM,
        bearing: CAMERA_BEARING,
        tilt: CAMERA_TILT,
        target: SOURCE_LOCATION);
    return GoogleMap(
      myLocationEnabled: true,
      compassEnabled: true,
      tiltGesturesEnabled: false,
      markers: _markers,
      polylines: _polylines,
      mapType: MapType.normal,
      initialCameraPosition: initialLocation,
      onMapCreated: onMapCreated,
      onTap: (LatLng location) {
        setState(() {
          pinPillPosition = -100;
        });
      },
    );
  }

  setPolylines() async {
    List<PointLatLng> result = await polylinePoints?.getRouteBetweenCoordinates(
        googleAPIKey,
        SOURCE_LOCATION.latitude,
        SOURCE_LOCATION.longitude,
        DEST_LOCATION.latitude,
        DEST_LOCATION.longitude);
    if (result.isNotEmpty) {
      // loop through all PointLatLng points and convert them
      // to a list of LatLng, required by the Polyline
      result.forEach((PointLatLng point) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      });
    }
    setState(() {
      // create a Polyline instance
      // with an id, an RGB color and the list of LatLng pairs
      Polyline polyline = Polyline(
          polylineId: PolylineId('poly'),
          color: Color.fromARGB(255, 40, 122, 198),
          points: polylineCoordinates);

      // add the constructed polyline as a set of points
      // to the polyline set, which will eventually
      // end up showing up on the map
      _polylines.add(polyline);
    });
  }

  void onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
    setMapPins();
  }

  void setMapPins() {
    // add the source marker to the list of markers
    _markers.add(Marker(
        markerId: MarkerId('sourcePin'),
        position: SOURCE_LOCATION,
        onTap: () {
          setState(() {
            currentlySelectedPin = sourcePinInfo;
            pinPillPosition = 0;
          });
        },
        icon: sourceIcon));
    // populate the sourcePinInfo object
    sourcePinInfo = PinInformation(
        locationName: 'Start Location',
        location: SOURCE_LOCATION,
        pinPath: 'assets/driving_pin.png',
        avatarPath: 'assets/friend1.jpg',
        labelColor: Colors.blueAccent);
    // add the destination marker to the list of markers
    _markers.add(Marker(
        markerId: MarkerId('destPin'),
        position: DEST_LOCATION,
        onTap: () {
          setState(() {
            _showDialog();
            currentlySelectedPin = destinationPinInfo;
            pinPillPosition = 0;
          });
        },
        icon: destinationIcon));
    destinationPinInfo = PinInformation(
        locationName: 'End Location',
        location: DEST_LOCATION,
        pinPath: 'assets/destination_map_marker.png',
        avatarPath: 'assets/friend2.jpg',
        labelColor: Colors.purple);
  }

  void _showDialog() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          backgroundColor: Colors.transparent,
          content: Container(
            color: Theme.of(context).scaffoldBackgroundColor,
            width: MediaQuery.of(context).size.width * 0.7,
            height: 200,
            child: Stack(
              children: <Widget>[
                new SizedBox(
                    width: 60.0,
                    height: 50.0,
                    child: FlatButton(
                      onPressed: () {
                        Get.back();
                      },
                      child: Icon(
                        Icons.close,
                        color: Theme.of(context).textTheme.title.color,
                      ),
                    )),
                Center(
                    child: Padding(
                        padding: EdgeInsets.only(bottom: 30),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Text('50 Km away',  style: TextStyle(color: Theme.of(context).textTheme.title.color, fontWeight: FontWeight.bold)),
                              Text('Name: blah blah', style: TextStyle(color: Theme.of(context).textTheme.title.color)),
                            ]))),
              ],
            ),
          ),
        );
      },
    );
  }

}
