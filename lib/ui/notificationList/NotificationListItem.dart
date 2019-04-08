import 'package:flutter/material.dart';
import 'package:Notify.It_flutter/model/Notification.dart';

class NotificationListItem extends StatelessWidget {
  final NotificationItem notification;

  NotificationListItem(this.notification);

  @override
  Widget build(BuildContext context ) {
    return new Card (
      child: Column (
        children: [
            new ListTile (
            title: new Text(notification.title),
            leading: Icon(Icons.notifications),
            subtitle: new Text(notification.body),
          ),
          ButtonTheme.bar( // make buttons use the appropriate styles for cards
          child: ButtonBar(
            children: <Widget>[
              FlatButton(
                child: const Text('DISMISS'),
                onPressed: () { /* ... */ },
              ),
              FlatButton(
                child: const Text('VIEW'),
                onPressed: () { /* ... */ },
              ),
            ],
          )
        ),
        ] 
      )
    );
  }
}