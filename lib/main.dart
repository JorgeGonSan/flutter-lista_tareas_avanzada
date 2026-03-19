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
  TextEditingController myController = TextEditingController();
  List<String> tareas = [];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Mi Lista de Tareas Avanzado"),
          backgroundColor: Colors.grey,
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                TextField(
                  controller: myController,
                  decoration: InputDecoration(border: OutlineInputBorder()),
                ),
                SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    if (myController.text.isNotEmpty) {
                      setState(() {
                        tareas.add(myController.text);
                        myController.clear();
                      });
                    }
                  },
                  child: Text("Añadir"),
                ),

                Expanded(
                  child: ListView.builder(
                    itemCount: tareas.length,
                    itemBuilder: (context, index) {
                      return ListTile(title: Text(tareas[index]));
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
