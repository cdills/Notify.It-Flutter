import 'package:flutter/material.dart';
import 'package:Notify.It_flutter/model/Notifier.dart';

class NotifierListItem extends StatelessWidget {
  final Notifier notifier;

  NotifierListItem(this.notifier);

  @override
  Widget build(BuildContext context ) {
    return new ListTile (
      title: new Text(notifier.subreddit),
    );
  }
}