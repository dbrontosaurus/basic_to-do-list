class TodoItem {
  String? id; // Tambahkan field untuk document ID
  String task;
  bool isCompleted;
  DateTime createdAt;

  TodoItem({
    this.id,
    required this.task, 
    this.isCompleted = false, 
    DateTime? createdAt
  }) : createdAt = createdAt ?? DateTime.now();
  
  // Convert to Map untuk Firestore
  Map<String, dynamic> toMap() {
    return {
      'task': task,
      'isCompleted': isCompleted,
      'createdAt': createdAt.millisecondsSinceEpoch,
    };
  }
  
  // Create from Map (dari Firestore)
  factory TodoItem.fromMap(Map<String, dynamic> map, String id) {
    return TodoItem(
      id: id,
      task: map['task'] ?? '',
      isCompleted: map['isCompleted'] ?? false,
      createdAt: DateTime.fromMillisecondsSinceEpoch(map['createdAt'] ?? 0),
    );
  }
}