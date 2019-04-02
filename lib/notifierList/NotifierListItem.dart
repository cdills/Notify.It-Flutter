import 'package:flutter/material.dart';
import 'package:Notify.It_flutter/model/NotifierItem.dart';

class NotifierListItem extends StatelessWidget {
  final NotifierItem notifier;

  NotifierListItem(this.notifier);

  @override
  Widget build(BuildContext context ) {
    return new ListTile (
      title: new Text(notifier.subreddit),
    );
  }
}