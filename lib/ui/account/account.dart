import 'package:cinema/ui/components/bill_card.dart';
import 'package:cinema/ui/components/widget_header.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
class Account extends StatefulWidget {
  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Account',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20),
        ).tr(context:context),
        centerTitle: true,
        elevation: 0.3,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(height: 10),
            WidgetHeader(
              title: 'Profile',
              button: Container(),
              child: Container(
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
                height: 200,
                child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('John Doe', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)).tr(context: context),
                    SizedBox(height: 5),
                    Text('email@domain.com', style: TextStyle(fontSize: 15, color: Colors.blueAccent)),
                    SizedBox(height: 5),
                    OutlineButton(
                      onPressed: (){},
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: Text('Logout').tr(context: context),
                    )
                  ],
                )),
              ),
            ),
            SizedBox(height: 30),
            WidgetHeader(
              title: 'Subscription',
              button: Container(),
              child: Container(
                child: Center(
                  child: new BillCard(
                    month: 'February',
                    type: 'Standard',
                    startedAt: '29 March 2020',
                    endingDate: '29 April 2020',
                    status: 'Payed',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

