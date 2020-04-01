import 'package:flutter/material.dart';

class CategoryButton extends StatelessWidget {
  final String name;
  final Color color;
  final Function onPressed;

  const CategoryButton({Key key, this.name, this.color, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GestureDetector(
          onTap: onPressed,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7),
              color:color?? Colors.black38,
            ),
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 20),
            child: Text(name?? '', style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold, )),
          ),
        ),
      ),
    );
  }
}
