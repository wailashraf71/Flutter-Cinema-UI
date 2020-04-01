import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:easy_localization/easy_localization.dart';

class WidgetHeader extends StatelessWidget {
  final String title;
  final Widget button;
  final Widget child;

  const WidgetHeader({Key key, this.title, this.button, this.child}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AnimationConfiguration.synchronized(
      duration: Duration(milliseconds: 375),
      child: FadeInAnimation(
        child: SlideAnimation(
          verticalOffset: 40,
          child: Container(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 7),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(title ?? '', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22)).tr(context: context),
                      button?? Container()
                    ],
                  ),
                ),
                child ?? Container()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
