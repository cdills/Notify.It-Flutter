import 'package:Notify.It_flutter/model/NotifierItem.dart';

class AddNotifierAction {
  final NotifierItem notifier;

  AddNotifierAction(this.notifier);
}

class ToggleNotifierStateAction {
  final NotifierItem notifier;

  ToggleNotifierStateAction(this.notifier);
}