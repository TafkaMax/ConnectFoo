class TodoTask {
  int id;
  String todoTaskName;
  int todoTaskSort;
  DateTime createdDT;
  DateTime dueDT;
  bool isCompleted;
  bool isArchived;
  int todoCategoryId;
  int todoPriorityId;
  DateTime syncDT;

  TodoTask({
    this.id,
    this.todoTaskName,
    this.todoTaskSort,
    this.syncDT,
    this.createdDT,
    this.dueDT,
    this.isCompleted,
    this.isArchived,
    this.todoCategoryId,
    this.todoPriorityId,
  });

  factory TodoTask.fromJson(Map<String, dynamic> json) {
    return TodoTask(
      id: json['id'],
      todoTaskName: json['todoTaskName'],
      todoTaskSort: json['todoTaskSort'],
      createdDT: DateTime.parse(json['createdDT']),
      dueDT: json['dueDT'] == null ? null : DateTime.tryParse(json['dueDT']),
      isCompleted: json['isCompleted'],
      isArchived: json['isArchived'],
      todoCategoryId: json['todoCategoryId'],
      todoPriorityId: json['todoPriorityId'],
      syncDT: DateTime.parse(json['syncDT']),
    );
  }

  Map<String, dynamic> toPostJson(TodoTask object) => {
        'todoTaskName': object.todoTaskName,
        'todoTaskSort': object.todoTaskSort,
        'createdDT': object.createdDT.toIso8601String(),
        'dueDT': object.dueDT == null ? null : object.dueDT.toIso8601String(),
        'isCompleted': object.isCompleted,
        'isArchived': object.isArchived,
        'todoCategoryId': object.todoCategoryId,
        'todoPriorityId': object.todoPriorityId,
        'id': object.id,
      };
}
