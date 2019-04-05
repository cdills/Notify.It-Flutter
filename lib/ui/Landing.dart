import 'package:flutter/material.dart';

class LandingScreen extends StatelessWidget {
  @override
  Widget build( BuildContext context ) {
    return Center (
      child: Column (
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("you don't have any notifiers",
            style: TextStyle(fontWeight: FontWeight.bold)),
          Text("try creating one",
            style: TextStyle(fontWeight: FontWeight.bold)),
          Icon(Icons.add_alert,
            size: 60,
            color: Colors.orange),
        ]
      )
    );
  }
}