import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:Notify.It_flutter/model/NotifierItem.dart';
import 'package:Notify.It_flutter/notifierList/NotifierListItem.dart';

class NotifierList extends StatelessWidget {
  @override
  Widget build (BuildContext contect) {
    return new StoreConnector<List<NotifierItem>, List<NotifierItem>> (
      converter: (store) => store.state,
      builder: (context, list) {
        return new ListView.builder(
          itemCount: list.length,
          itemBuilder: (context, position) => new NotifierListItem(list[position])
        );
      }
    );
  }
}
