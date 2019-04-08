import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'notificationList_viewmodel.dart';
import 'NotificationListItem.dart';
import 'package:Notify.It_flutter/redux/app/app_state.dart';

class NotificationList extends StatelessWidget {
  @override
  Widget build (BuildContext contect) {
    return new StoreConnector<AppState, NotificationListViewModel> (
      converter: (store) => NotificationListViewModel.fromStore(store),
      builder: (context, viewModel) {
        return new ListView.separated(
          itemCount: viewModel.notifications.length,
          itemBuilder: (context, position) => new NotificationListItem(viewModel.notifications[position]),
          separatorBuilder: (context, position) => Divider(),
        );
      }
    );
  }
}
