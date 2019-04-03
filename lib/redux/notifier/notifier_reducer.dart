import 'package:meta/meta.dart';
import 'package:redux/redux.dart';
import 'package:Notify.It_flutter/model/Notifier.dart';
import 'package:Notify.It_flutter/redux/notifier/notifier_state.dart';
import 'package:Notify.It_flutter/redux/notifier/notifier_actions.dart';

final notifierReducer = combineReducers<NotifierState>([
  TypedReducer<NotifierState, AddNotifierAction>(_addNotifier)
]);

NotifierState _addNotifier (NotifierState state, AddNotifierAction action) =>
  state.copyWith(notifiers: action.notifiers);