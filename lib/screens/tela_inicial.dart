import 'package:flutter/material.dart';
import 'package:primeiroprojeto/data/task_inherited.dart';
import 'package:primeiroprojeto/screens/form_screen.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({Key? key}) : super(key: key);

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  @override
  Widget build(BuildContext contextTask) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tarefas'),
        leading: const Icon(Icons.add_task),
      ),
      body: Container(
        color: const Color.fromARGB(255, 208, 221, 237),
        child: ListView(
          padding: const EdgeInsets.only(top: 8, bottom: 70),
          children: TaskInherited.of(contextTask).taskList,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(contextTask,
              MaterialPageRoute(builder: (contextNew) => FormScreen(taskContext: contextTask)),
          );
        },
        backgroundColor: Colors.blue[100],
        child: const Icon(Icons.add),
      ),
    );
  }
}
