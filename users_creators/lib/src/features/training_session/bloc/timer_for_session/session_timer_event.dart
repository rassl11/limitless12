abstract class SessionTimerEvent{}

class StartSessionTimerEvent extends SessionTimerEvent{}

class StopSessionTimerEvent extends SessionTimerEvent{}

class IncrementTimerEvent extends SessionTimerEvent{}

class DecrementTimerEvent  extends SessionTimerEvent{}