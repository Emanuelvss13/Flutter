import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// void main() {
//   runApp(MaterialApp(
//       theme: ThemeData(primarySwatch: Colors.pink),
//       home: HomePage()
//   )
// }

void main() {
  runApp(MaterialApp(
      theme: ThemeData(primarySwatch: Colors.pink), home: HomePage()));
}

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var count = 0;

  void increment() {
    count++;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Meu Primerio App'),
        ),
        body: Container(
          child: Center(
            child: Text(
              "Contador\n$count",
              textAlign: TextAlign.center,
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            increment();
          },
        ));
  }
}
