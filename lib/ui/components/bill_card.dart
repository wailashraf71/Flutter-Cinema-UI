import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
class BillCard extends StatelessWidget {
  final String month, type, startedAt, endingDate, status;
  const BillCard({
    Key key, @required this.month, @required this.type, @required this.startedAt, @required this.endingDate, @required this.status,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(25),

          boxShadow: [
          BoxShadow(
            color: Colors.black12.withOpacity(0.04),
            blurRadius: 20,
            offset: Offset(5, 5)
          )
        ]
      ),
      width: MediaQuery.of(context).size.width * 0.85,
      padding: EdgeInsets.all(30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(month, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, )).tr(context: context),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30),
            child: Row(
              children: <Widget>[
                DefaultTextStyle(
                  style: TextStyle(fontSize: 14, color: Theme.of(context).textTheme.title.color.withOpacity(0.5)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('Type').tr(context: context),
                      Text('Started at').tr(context: context),
                      Text('Ending date').tr(context: context)
                    ],
                  ),
                ),
                Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(type, style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)).tr(context: context),
                    Text(startedAt, style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)).tr(context: context),
                    Text(endingDate, style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)).tr(context: context),
                  ],
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            height: 47,
            child: FlatButton(
              child: Text(status, style: TextStyle(color: Colors.white),),
              onPressed: (){},
              padding: EdgeInsets.symmetric(horizontal: 20),
              color: status == 'Payed' ? Colors.green : Colors.grey,
              shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(10.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
