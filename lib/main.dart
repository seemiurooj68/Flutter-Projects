import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_todo_app/screens/dashboard.dart';

void main() {
  runApp(const TodoApp());
}

class TodoApp extends StatelessWidget {
  const TodoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent),
    );
    return MaterialApp(
      title: 'My TODO App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.grey[200],
      ),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueGrey.withOpacity(0.5),
          elevation: 0,
          centerTitle: true, // Center aligns the title
          title: Text(
            'My TODO App',
            style: TextStyle(
              color: const Color.fromARGB(255, 48, 4, 124), // Adjust text color as needed
              fontWeight: FontWeight.bold, // Bold font weight
              shadows: [
                Shadow(
                  offset: Offset(1.0, 1.0),
                  blurRadius: 3.0,
                  color: const Color.fromARGB(255, 36, 14, 14).withOpacity(0.5),
                ),
              ],
            ),
          ),
          automaticallyImplyLeading: false, // Removes the default back buttonr
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/background_image.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: SizedBox(
              width: 400, // Adjust the width as needed
              height: 600, // Adjust the height as needed
              child: Home(),
            ),
          ),
        ),
      ),
    );
  }
}
