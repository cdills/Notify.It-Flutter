import 'package:Notify.It_flutter/model/NotifierItem.dart';
import 'actions.dart';

List<NotifierItem> notifierItemsReducer( List<NotifierItem> notifiers, dynamic action) {
  if (action is AddNotifierAction) {
    return addNotifier(notifiers, action);
  } else if (action is ToggleNotifierStateAction) {
    return toggleNotifierState(notifiers, action);
  }

  return notifiers;
}

List<NotifierItem> addNotifier (List<NotifierItem> notifiers, AddNotifierAction action) {
  return List.from(notifiers)..add(action.notifier);
}

List<NotifierItem> toggleNotifierState (
  List<NotifierItem> notifiers, ToggleNotifierStateAction action) {
    return notifiers.map((notifier) => notifier.subreddit == action.notifier.subreddit ? 
      action.notifier : notifier).toList();
}