class TodoPriority {
  int id;
  String todoPriorityName;
  int todoPrioritySort;
  DateTime syncDT;

  TodoPriority(
      {this.id, this.todoPriorityName, this.todoPrioritySort, this.syncDT});

  factory TodoPriority.fromJson(Map<String, dynamic> json) {
    return TodoPriority(
      id: json['id'],
      todoPriorityName: json['todoPriorityName'],
      todoPrioritySort: json['todoPrioritySort'],
      syncDT: DateTime.parse(json['syncDT']),
    );
  }

  Map<String, dynamic> toPostJson(TodoPriority object) => {
        // 'id': id,
        'todoPriorityName': todoPriorityName,
        'todoPrioritySort': todoPrioritySort,
        // 'syncDT': syncDT
      };
}
