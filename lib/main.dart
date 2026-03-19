import 'package:flutter/material.dart';

void main() {
  runApp(const MyListaAvanzada());
}

class MyListaAvanzada extends StatefulWidget {
  const MyListaAvanzada({super.key});

  @override
  State<MyListaAvanzada> createState() => _MyListaAvanzadaState();
}

class _MyListaAvanzadaState extends State<MyListaAvanzada> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Mi Lista de Tareas Avanzado"),
          backgroundColor: Colors.grey,
        ),
        body: Center(),
      ),
    );
  }
}
