import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app_using_provider/todomodel.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ChangeNotifierProvider(
          create: (context) => TodoModel(), child: const HomePage()),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          'Todo App',
          style: TextStyle(color: Colors.blue),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Center(
            child: Container(
              height: 150,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                      'https://cdn1.iconfinder.com/data/icons/business-set-18/32/2.business-icons-final-16-512.png'),
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(25),
                      topLeft: Radius.circular(25))),
              child: Consumer<TodoModel>(builder: (context, todo, child) {
                return ListView.builder(
                  itemCount: todo.taskList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      child: ListTile(
                        contentPadding: EdgeInsets.only(
                            left: 32, right: 32, top: 8, bottom: 8),
                        title: Text(
                          todo.taskList[index].title,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                        subtitle: Text(
                          todo.taskList[index].detail,
                          style: TextStyle(
                            color: Colors.white70,
                          ),
                        ),
                        trailing: Icon(Icons.check_circle, color: Colors.white),
                      ),
                      margin: EdgeInsets.only(bottom: 8, left: 16, right: 16),
                    );
                  },
                );
              }),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Provider.of<TodoModel>(context, listen: false).addTaskInList();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
