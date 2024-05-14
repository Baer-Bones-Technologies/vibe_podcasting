class CompletionStatus{
  const CompletionStatus({
    required this.completed,
    this.currentPosition,
});
  final bool completed;
  final int? currentPosition;

  factory CompletionStatus.completed(){
    return const CompletionStatus(completed: true, currentPosition: null);
  }

  factory CompletionStatus.incomplete({required int currentPosition}){
    return CompletionStatus(completed: false, currentPosition: currentPosition);
  }

  factory CompletionStatus.fromJson(
    Map<String, dynamic> json,
  ) {
    return CompletionStatus(
      completed: json['completed'],
      currentPosition: json['currentPosition'],
    );
  }

  Map<String, dynamic> toJson() => {
    'completed': completed,
    'currentPosition': currentPosition,
  };
}