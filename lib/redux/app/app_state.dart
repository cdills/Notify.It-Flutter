import 'package:meta/meta.dart';
import 'package:Notify.It_flutter/redux/notifier/notifier_state.dart';
import 'package:Notify.It_flutter/redux/notification/notification_state.dart';


@immutable
class AppState {

  final NotifierState notifierState;
  final NotificationState notificationState;

  AppState({
    @required this.notifierState,
    @required this.notificationState
  });

  factory AppState.initial(){
    return AppState(
      notifierState: NotifierState.initial(),
      notificationState: NotificationState.initial()
    );
  }

  AppState copyWith ({
    NotifierState notifierState,
    NotificationState notificationState
  }) {
    return AppState(
      notifierState: notifierState ?? this.notifierState,
      notificationState: notificationState ?? this.notificationState
    );
  }
}