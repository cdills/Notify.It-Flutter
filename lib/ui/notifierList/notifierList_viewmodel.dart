import 'package:redux/redux.dart';
import 'package:Notify.It_flutter/redux/app/app_state.dart';
import 'package:Notify.It_flutter/redux/notifier/notifier_actions.dart';
import 'package:Notify.It_flutter/model/Notifier.dart';

class NotifierListViewModel {
  final List<Notifier> notifiers;

  final Function(Notifier) addNotifier;

  NotifierListViewModel({this.notifiers, this.addNotifier});

  static NotifierListViewModel fromStore(Store<AppState> store) {
    return NotifierListViewModel(
      notifiers: store.state.notifierState.notifiers,
      addNotifier: (notifiers) => store.dispatch(new AddNotifierAction(notifiers))
    );
  }
}