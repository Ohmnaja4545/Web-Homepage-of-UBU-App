import 'dart:math';
import 'package:flutter/material.dart';
import 'mockup/data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Classroom'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  List<dynamic> courses = [];

  void _incrementCounter() {
    setState(() {
      _counter++;
      courses.add(randomCourse());
      //print(courses);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            ...courses.map((course) => Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.0, vertical: 1.0),
                  height: MediaQuery.of(context).size.height * 0.3,
                  child: Card(
                    child: Stack(
                      children: [
                        Image.network('${course[3]}',
                        fit: BoxFit.fill,
                        ),                   
                        ListTile(
                          title: Text(
                            '${course[0].toString()} ${course[1].toString()}',
                            style: TextStyle(color: Colors.black, fontSize: 18),
                          ),
                          subtitle: Text(
                            '${course[2].toString()}',
                            style: TextStyle(color: Colors.black, fontSize: 12, height: 25),
                          ),
                        ),
                      ],
                    ),
                  ),
                ))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
