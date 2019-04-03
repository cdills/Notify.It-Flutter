AppState appReducer(AppState state, dynamic action) =>
  new AppState(
    notifierState: NotifierReducer(state.notifierState, action)
    notificationState: NotificationReducer(state.notificationState, action)
  );