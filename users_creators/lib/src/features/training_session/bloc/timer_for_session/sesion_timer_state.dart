abstract class SessionTimerState {
  int minutes;
  SessionTimerState(this.minutes);
}

class StartedSessionTimerState extends SessionTimerState {
  StartedSessionTimerState(super.seconds);
}

class NotStartedSessionTimerState extends SessionTimerState {
  NotStartedSessionTimerState(super.seconds);
}
