
import 'package:flutter/material.dart';
import 'package:sqlite_with_flutter/services/database_services.dart';

import 'models/task.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final DatabaseServices _databaseServices = DatabaseServices.instance;

  String? _task = null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: _addTaskButton(),
      appBar: AppBar(
        title: const Text("SQLite Flutter"),
      ),
      body: _tasksList(),
    );
  }

  Widget _addTaskButton() {
    return FloatingActionButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (_) => AlertDialog(
            title: const Text("Add Task"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  onChanged: (value) {
                    setState(() {
                      _task = value;
                    });
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "I have to submit notes..."
                  ),
                ),
                MaterialButton(
                  color: Theme.of(context).colorScheme.primary,
                  onPressed: () {
                    if (_task == null || _task == "") return;
                    _databaseServices.addTask(_task!);
                    setState(() {
                      _task = null;
                    });
                    Navigator.pop(
                        context,
                    );
                  },
                  child: const Text(
                    "Done",
                    style: TextStyle(
                      color: Colors.white
                    ),
                  ),
                 ),
              ],
            ),
          ),
        );
      },
      child: const Icon(
        Icons.add,
      ),
    );
  }

  Widget _tasksList() {
    return FutureBuilder(
        future: _databaseServices.getTask(),
        builder: (context, snapshot){
          return ListView.builder(
            itemCount: snapshot.data?.length ?? 0,
            itemBuilder: (context, index){
              Task task = snapshot.data![index];
              return ListTile(
                onLongPress: (){
                  _databaseServices.deleteTask(task.id);
                  setState(() {
                  });
                },
                title: Text(
                  task.content,
                ),
                trailing: Checkbox(
                    value: task.status == 1,
                    onChanged: (value) {
                      _databaseServices.updateTaskStatus(task.id, value == true ? 1 : 0);
                      setState(() {
                      });
                    }
                ),
              );
            },
          );
        },
    );
  }
}
