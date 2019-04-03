import 'package:meta/meta.dart';
import 'package:Notify.It_flutter/model/Notifier.dart';

@immutable 
class NotifierState{

  final List<Notifier> notifiers;
  
  NotifierState({this.notifiers});

  NotifierState copyWith({
    List<Notifier> notifiers
  }) {
    return new NotifierState(
      notifiers: notifiers ?? this.notifiers
    );
  }

  factory NotifierState.initial() {
    return new NotifierState(
      notifiers: null
    );
  }
}