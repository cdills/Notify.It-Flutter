import 'package:redux/redux.dart';
import 'package:Notify.It_flutter/redux/app/app_state.dart';
import 'package:Notify.It_flutter/redux/notification/notification_actions.dart';
import 'package:Notify.It_flutter/model/Notification.dart';

class NotificationListViewModel {
  final List<NotificationItem> notifications;

  final Function(NotificationItem) addNotification;

  NotificationListViewModel({this.notifications, this.addNotification});

  static NotificationListViewModel fromStore(Store<AppState> store) {
    return NotificationListViewModel(
      notifications: store.state.notificationState.notifications,
      addNotification: (notifications) => store.dispatch(new AddNotificationAction(notifications))
    );
  }
}