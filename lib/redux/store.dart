import 'package:Notify.It_flutter/redux/app/app_state.dart';
import 'package:Notify.It_flutter/redux/app/app_reducer.dart';
import 'package:redux/redux.dart';

Store<AppState> createStore() {
  return Store(
    appReducer,
    initialState: AppState.initial(),
  );
}