import 'package:Notify.It_flutter/redux/notification/notification_reducer.dart';
import 'package:Notify.It_flutter/redux/notifier/notifier_reducer.dart';
import 'app_state.dart';

AppState appReducer(AppState state, dynamic action) =>
  new AppState(
    notifierState: notifierReducer(state.notifierState, action),
    notificationState: notificationReducer(state.notificationState, action)
  );