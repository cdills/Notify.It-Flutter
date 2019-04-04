import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'notifierList_viewmodel.dart';
import 'NotifierListItem.dart';
import 'package:Notify.It_flutter/redux/app/app_state.dart';

class NotifierList extends StatelessWidget {
  @override
  Widget build (BuildContext contect) {
    return new StoreConnector<AppState, NotifierListViewModel> (
      converter: (store) => NotifierListViewModel.fromStore(store),
      builder: (context, viewModel) {
        return new ListView.builder(
          itemCount: viewModel.notifiers.length,
          itemBuilder: (context, position) => new NotifierListItem(viewModel.notifiers[position])
        );
      }
    );
  }
}
