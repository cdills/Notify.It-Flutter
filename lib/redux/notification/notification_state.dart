import 'package:meta/meta.dart';
import 'package:Notify.It_flutter/model/Notification.dart';

@immutable
class NotificationState {
  final List<NotificationItem> notifications;

  NotificationState({this.notifications});

  NotificationState copyWith ({
    List<NotificationItem> notifications
    }) {
      return new NotificationState(
        notifications: notifications ?? this.notifications
      );
    }
  
  factory NotificationState.initial () {
    return new NotificationState(
      notifications: List()
    );
  }
}