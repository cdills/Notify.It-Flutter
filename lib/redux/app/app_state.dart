import 'package:meta/meta.dart';

@immutable
class AppState {

  final NotifierState notifierState;
  final NotificationsState notificationState;

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