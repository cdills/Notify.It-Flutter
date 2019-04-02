import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:splashscreen/splashscreen.dart';
import 'Landing.dart';
import 'AddNotifierDialog.dart';
import 'package:Notify.It_flutter/model/NotifierItem.dart';
import 'package:Notify.It_flutter/redux/reducers.dart';
import 'package:Notify.It_flutter/notifierList/NotifierList.dart';
import 'package:redux/redux.dart';

void main() {
 final store = new Store<List<NotifierItem>> (
   appReducers,
   initialState: new List()
   );
  runApp(MyApp(store));
}

class MyApp extends StatelessWidget {
  final Store<List<NotifierItem>> store;

  MyApp(this.store);

  @override
  Widget build(BuildContext context) {
    return new StoreProvider<List<NotifierItem>>(
      store: store,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.orange,
        ),
        home: MyHomePage(title: 'notify.it'),
      )
    );
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
      title: new Text('notify.it',
      style: new TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20.0
      ),),
      image: new Image.network('https://i.imgur.com/TyCSG9A.png'),
      backgroundColor: Colors.orange,
      styleTextUnderTheLoader: new TextStyle(),
      photoSize: 100.0,
      onClick: ()=>print("Flutter Egypt"),
      loaderColor: Colors.red
    );
  }
}

class AfterSplash extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("notify.it"),
      ),
      body: LandingScreen(), //Testwith NotifierList(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (_) => AddNotifierDialog()
            );
          },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), 
      bottomNavigationBar: new BottomNav() 
    );
  }
}

class BottomNav extends StatefulWidget {
  @override
  BottomNavState createState() => BottomNavState();
} 

class BottomNavState extends State<BottomNav> {
  int _selectedIndex = 1;

  void _onItemTapped (index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget build(BuildContext context) {
    return BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Home')),
          BottomNavigationBarItem(icon: Icon(Icons.today), title: Text('Today')),
          BottomNavigationBarItem(icon: Icon(Icons.access_alarm), title: Text('History')),
        ],
        currentIndex: _selectedIndex,
        fixedColor: Colors.orangeAccent,
        onTap: _onItemTapped,
    );
  }
}
