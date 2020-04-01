import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Play extends StatefulWidget {
  final int id;
  Play({Key key, this.id}) : super(key: key);

  @override
  _PlayState createState() => _PlayState();
}

class _PlayState extends State<Play>{
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
      ),
    );
  }
}
