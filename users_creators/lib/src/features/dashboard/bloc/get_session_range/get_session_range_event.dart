abstract class GetSessionRangeEvent{
  static int lastRequestRange = 0;
  static String lastRequestDate = 'Last 10 Sessions';
}

class GotSessionRangeEvent extends GetSessionRangeEvent{
  final String? requestDate;
  final int requestRange;
  GotSessionRangeEvent({
    required this.requestRange,
     this.requestDate
  });
  
  
}

class UpdateSessionRangeEvent extends GetSessionRangeEvent{
    final String requestDate;
  final int requestRange;
  UpdateSessionRangeEvent({
    required this.requestDate,
    required this.requestRange
  });
}
