import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:easy_localization/easy_localization.dart';
class Notifications extends StatefulWidget {
  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Notifications',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20),
        ).tr(context: context),

        centerTitle: true,
        elevation: 0.3,
      ),
      body: AnimationLimiter(
        child: ListView.separated(
            separatorBuilder: (BuildContext context, int index) {
              return Divider();
            },
            itemCount: 6,
            itemBuilder: (BuildContext context, int index) {
              return AnimationConfiguration.staggeredList(
                position: index,
                duration: const Duration(milliseconds: 575),
                child: SlideAnimation(
                  horizontalOffset: 50.0,
                  child: FadeInAnimation(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 15),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: CircleAvatar(
                                    backgroundColor: Theme.of(context).secondaryHeaderColor,
                                    child: Icon(Icons.notifications, color: Theme.of(context).textTheme.title.color),

                                  ),
                                ),
                                Container(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment
                                        .start,
                                    children: <Widget>[
                                      Row(
                                        children: <Widget>[
                                          Text('Did you pay for your subscription?',
                                              style: TextStyle(fontSize: 15,
                                                  fontWeight: FontWeight
                                                      .bold)).tr(context: context),
                                        ],
                                      ),
                                      Container(
                                        padding: EdgeInsets.only(top: 5),
                                        width: MediaQuery
                                            .of(context)
                                            .size
                                            .width * 0.7,
                                        child: Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                                          style: TextStyle(fontSize: 12,
                                            color: Theme.of(context).textTheme.title.color.withOpacity(0.6),
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 2,
                                        ).tr(context: context),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
