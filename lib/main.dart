import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:Notify.It_flutter/redux/store.dart';
import 'package:Notify.It_flutter/redux/app/app_state.dart';
import 'package:Notify.It_flutter/ui/notifierList/NotifierList.dart';
import 'package:Notify.It_flutter/ui/Landing.dart';
import 'package:Notify.It_flutter/ui/AddNotifierDialog.dart';

import 'package:redux/redux.dart';

void main() {
  final store = createStore();
  runApp(MyApp(store));
}

class MyApp extends StatelessWidget {
  final Store<AppState> store;

  MyApp(this.store);

  @override
  Widget build(BuildContext context) {
    return new StoreProvider<AppState>(
        store: store,
        child: MaterialApp(
          title: 'Notify.it',
          theme: ThemeData(
            primarySwatch: Colors.orange,
          ),
          home: MyHomePage(title: 'notify.it'),
        ));
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return new SplashScreen(
        seconds: 5,
        navigateAfterSeconds: AfterSplash(),
        title: new Text(
          'notify.it',
          style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
        ),
        backgroundColor: Colors.orange,
        styleTextUnderTheLoader: new TextStyle(),
        photoSize: 100.0,
        onClick: () => print("Flutter Egypt"),
        loaderColor: Colors.red);
  }
}

class AfterSplashState extends State<AfterSplash> {
  int _selectedIndex = 0;

  void _onItemTapped(index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("notify.it"),
        ),
        body: new Stack(children: [
          new Offstage(offstage: _selectedIndex != 0, child: LandingScreen()),
          new Offstage(offstage: _selectedIndex != 1, child: NotifierList()),
        ]),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(context: context, builder: (_) => AddNotifierDialog());
          },
          tooltip: 'Increment',
          child: Icon(Icons.add),
        ),
        bottomNavigationBar: FancyBottomNavigation(
          tabs: <TabData>[
            TabData(iconData: Icons.home, title: 'Notifiers'),
            TabData(iconData: Icons.today, title: 'Notifications'),
          ],
          onTabChangedListener: (position) => _onItemTapped(position),
        ));
  }
}

class AfterSplash extends StatefulWidget {
  @override
  AfterSplashState createState() => AfterSplashState();
}
