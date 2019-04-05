import 'package:redux/redux.dart' show TypedReducer, combineReducers;
import 'package:Notify.It_flutter/redux/notification/notification_actions.dart';
import 'package:Notify.It_flutter/redux/notification/notification_state.dart';


final notificationReducer = combineReducers<NotificationState> ([
  TypedReducer<NotificationState, AddNotificationAction>(_addNotification)
]);

NotificationState _addNotification (NotificationState state, AddNotificationAction action) =>
  state.copyWith(notifications:
    List.from(state.notifications)..add(action.notification)
  );