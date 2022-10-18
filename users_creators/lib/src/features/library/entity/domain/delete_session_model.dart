class DeleteSession{
  String status;
  DeleteSession({
    required this.status
  });

  factory DeleteSession.fromJson(Map<String,dynamic> json){
    return DeleteSession(
      status: json['status']
    );
  }
}