import 'package:flutter/material.dart';
import '../model/task.dart';
import '../widgets/task_item.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}


class _HomeState extends State<Home> {
  List<Task> taskList = [
  Task(id: '1', taskText: 'Research Flutter UI libraries'),
  Task(id: '2', taskText: 'Team stand-up meeting'),
  Task(id: '3', taskText: 'Implement Firebase authentication'),
  Task(id: '4', taskText: 'Refactor code for performance'),
  Task(id: '5', taskText: 'Document API endpoints'),
  Task(id: '6', taskText: 'Update project documentation'),
];


  TextEditingController _taskController = TextEditingController();

  void _addTask(String taskText) {
    setState(() {
      taskList.add(Task(id: DateTime.now().millisecondsSinceEpoch.toString(), taskText: taskText));
    });
    _taskController.clear();
  }

  void _toggleTaskStatus(Task task) {
    setState(() {
      task.isDone = !task.isDone;
    });
  }

  void _deleteTask(String taskId) {
    setState(() {
      taskList.removeWhere((task) => task.id == taskId);
    });
  }

  void _filterTasks(String enteredKeyword) {
    List<Task> filteredTasks = [];
    if (enteredKeyword.isEmpty) {
      filteredTasks = taskList;
    } else {
      filteredTasks = taskList
          .where((task) => task.taskText.toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
    }
    setState(() {
      taskList = filteredTasks;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent, // Make scaffold background transparent
      appBar: AppBar(
        backgroundColor: Colors.blueGrey.withOpacity(0.5),
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: Icon(
                Icons.menu,
                color: Colors.blue,
                size: 30,
              ),
              onPressed: () {
                // Add functionality for menu button if needed
              },
            ),
            CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage('assets/images/avatar.png'),
            ),
          ],
        ),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/images/background_image.jpg',
            fit: BoxFit.cover,
          ),
          Container(
            color: Colors.black.withOpacity(0.3), // Adjust the overlay color and opacity as needed
          ),
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: TextField(
                    controller: _taskController,
                    onChanged: _filterTasks,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                      fillColor: Colors.white.withOpacity(0.8),
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide.none,
                      ),
                      hintText: 'Search',
                      prefixIcon: Icon(Icons.search, color: Colors.black38),
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: taskList.length,
                    itemBuilder: (context, index) {
                      return TaskItem(
                        task: taskList[index],
                        onTaskChanged: _toggleTaskStatus,
                        onDeleteItem: _deleteTask,
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _taskController,
                          decoration: InputDecoration(
                            hintText: 'Add a new task',
                            contentPadding: EdgeInsets.symmetric(horizontal: 20),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide.none,
                            ),
                            filled: true,
                            fillColor: Colors.white.withOpacity(0.8),
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      FloatingActionButton(
                        onPressed: () {
                          _addTask(_taskController.text);
                        },
                        child: Icon(Icons.add, size: 36),
                        backgroundColor: Colors.blue,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
