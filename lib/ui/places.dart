import 'package:cinema/ui/components/google_maps.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Places extends StatefulWidget {
  final Key _mapKey = UniqueKey();
  @override
  _PlacesState createState() => _PlacesState();
}

class _PlacesState extends State<Places> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Places',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          centerTitle: true,
          elevation: 0.3,
          iconTheme: new IconThemeData(color: Colors.black),
        ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: <Widget>[
              GoogleMaps(key: widget._mapKey),
            ],
          ),
        ));
  }


}
