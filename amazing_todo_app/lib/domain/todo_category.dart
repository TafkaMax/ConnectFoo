class TodoCategory {
  int id;
  String todoCategoryName;
  int todoCategorySort;
  DateTime syncDT;

  TodoCategory(
      {this.id, this.todoCategoryName, this.todoCategorySort, this.syncDT});

  factory TodoCategory.fromJson(Map<String, dynamic> json) {
    return TodoCategory(
      id: json['id'],
      todoCategoryName: json['todoCategoryName'],
      todoCategorySort: json['todoCategorySort'],
      syncDT: DateTime.parse(json['syncDT']),
    );
  }

  Map<String, dynamic> toPostJson(TodoCategory object) => {
        // 'id': id,
        'todoCategoryName': todoCategoryName,
        'todoCategorySort': todoCategorySort,
        // 'syncDT': syncDT
      };
}
