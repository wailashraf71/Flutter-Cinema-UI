import 'package:cinema/ui/account/account.dart';
import 'package:cinema/ui/movies.dart';
import 'package:cinema/ui/notifications.dart';
import 'package:cinema/ui/places.dart';
import 'package:cinema/ui/tv.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class App extends StatefulWidget {
  @override
  _App createState() => new _App();
}

class _App extends State<App> {
  int currentTab;

  Widget homePage;
  Widget tv;
  Widget places;
  Widget notifications;
  Widget account;


  @override
  void didChangeDependencies() {
    currentTab = 0;

    homePage = new Movies();
    tv = new Tv();
    places = Places();
    notifications = Notifications();
    account = Account();
    super.didChangeDependencies();
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        body: IndexedStack(
        index: currentTab,
        children: _pages(),
      ),
        bottomNavigationBar: _buildNavigationBar(),
      ),
    );
  }

  List<Widget> _pages() {
    return <Widget>[
      stackedPage(0, homePage),
      stackedPage(1, tv),
      stackedPage(2, places),
      stackedPage(3, notifications),
      stackedPage(4, account),
    ];
  }

  Offstage stackedPage(int index, child) {
    return Offstage(
        offstage: currentTab != index,
        child: TickerMode(
            enabled: currentTab == index,
            child: child
        ));
  }

  _buildNavigationBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Theme.of(context).bottomAppBarColor,
      unselectedItemColor: Theme.of(context).unselectedWidgetColor,
      currentIndex: currentTab,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      onTap: (int index) {
        //This is for test
        setState(() {
          currentTab = index;
        });
      },
      items: [
        BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.film), title: Text('Movies')),
        BottomNavigationBarItem(
            icon: Icon(Icons.live_tv, size: 26,), title: Text('Tv')),
        BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.map), title: Text('Map')),
        BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.bell), title: Text('Notifications')),
        BottomNavigationBarItem(
          icon: FaIcon(FontAwesomeIcons.user), title: Text('Account'),),
      ],
    );
  }
}