import 'package:flutter/material.dart';
import 'package:flutter_application_4/screen2.dart';

import 'models/todo_model.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false, home: MainScreen());
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Screen',
          style: TextStyle(
              fontSize: 25.00,
              fontWeight: FontWeight.bold,
              color: Colors.white),
        ),
        backgroundColor: Colors.deepPurple,
        actions: [
          IconButton(
            onPressed: ()async {
          var result = await Navigator.push(
            context,
            MaterialPageRoute(
              builder:(context){
              return Screen2();
          },
          settings: RouteSettings(
            arguments: ToDo('Watcharawalee',' Junapong'))));
        }, icon: Icon(Icons.add))],
      ),
      body: Center(
        child: Text('Hello World!'),
      ),
    );
  }
}
