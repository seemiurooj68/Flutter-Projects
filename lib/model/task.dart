import 'package:flutter/material.dart';

class Task {
  final String id;
  final String taskText;
  bool isDone;

  Task({
    required this.id,
    required this.taskText,
    this.isDone = false,
  });
}
