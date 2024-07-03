import 'package:flutter/material.dart';
import '../model/task.dart';

class TaskItem extends StatelessWidget {
  final Task task;
  final Function(Task) onTaskChanged;
  final Function(String) onDeleteItem;

  const TaskItem({
    Key? key,
    required this.task,
    required this.onTaskChanged,
    required this.onDeleteItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.8),
        borderRadius: BorderRadius.circular(20),
      ),
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        onTap: () => onTaskChanged(task),
        leading: Checkbox(
          value: task.isDone,
          onChanged: (value) => onTaskChanged(task),
        ),
        title: Text(
          task.taskText,
          style: TextStyle(
            fontSize: 16,
            decoration: task.isDone ? TextDecoration.lineThrough : null,
          ),
        ),
        trailing: IconButton(
          icon: Icon(Icons.delete, color: Colors.red),
          onPressed: () => onDeleteItem(task.id),
        ),
      ),
    );
  }
}
