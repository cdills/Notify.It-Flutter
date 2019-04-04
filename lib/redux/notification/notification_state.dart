import 'package:meta/meta.dart';
import 'package:Notify.It_flutter/model/Notification.dart';

@immutable
class NotificationState {
  final List<Notification> notifications;

  NotificationState({this.notifications});

  NotificationState copyWith ({
    List<Notification> notifications
    }) {
      return new NotificationState(
        notifications: notifications ?? this.notifications
      );
    }
  
  factory NotificationState.initial () {
    return new NotificationState(
      notifications: null
    );
  }
}