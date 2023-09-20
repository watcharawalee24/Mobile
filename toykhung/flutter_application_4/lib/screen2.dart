import 'package:flutter/material.dart';

import 'models/todo_model.dart';

class Screen2 extends StatelessWidget {
  const Screen2({super.key});

  @override
  Widget build(BuildContext context) {

    final todo = ModalRoute.of(context)!.settings.arguments as ToDo;
    
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Screen2',style: TextStyle(fontSize: 25.00,color: Colors.white
        ),),backgroundColor: Colors.deepPurple,
      ),
      body: 
        Center(
          child: Column(
            children: [
              Text(todo.title),
              Text(todo.description),
              ElevatedButton(
                onPressed:(){
                Navigator.pop(context,DateTime.now());
        
        
                
              }, child: Text('Close'))
              ],
          
          ),
        ),
    );
  }
}
