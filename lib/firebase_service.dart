import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:todolist/models/todo_item.dart';
// ignore: unused_import
import 'package:todolist/todo_item.dart';

class FirebaseService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Get reference to user's todos collection
  CollectionReference _getUserTodosCollection() {
    final userId = FirebaseAuth.instance.currentUser?.uid;
    if (userId == null) throw Exception('User not authenticated');
    return _firestore.collection('users').doc(userId).collection('todos');
  }

  // Add new todo
  Future<void> addTodo(TodoItem todo) async {
    await _getUserTodosCollection().add(todo.toMap());
  }

  // Update todo
  Future<void> updateTodo(String docId, TodoItem todo) async {
    await _getUserTodosCollection().doc(docId).update(todo.toMap());
  }

  // Delete todo
  Future<void> deleteTodo(String docId) async {
    await _getUserTodosCollection().doc(docId).delete();
  }

  // Stream of todos for real-time updates
  Stream<List<TodoItem>> getTodosStream() {
    return _getUserTodosCollection()
        .orderBy('createdAt', descending: true)
        .snapshots()
        .map((snapshot) => snapshot.docs.map((doc) {
              return TodoItem.fromMap(
                doc.data() as Map<String, dynamic>,
                doc.id,
              );
            }).toList());
  }
}