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
  String mensaje = "";

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

                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  child: Text(mensaje),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      if (myController.text.isEmpty) {
                        mensaje = "Añade una tarea, campos vacios";
                      } else if (tareas.contains(myController.text)) {
                        mensaje = "Esa tarea ya esta en la lista";
                      } else {
                        mensaje = "";
                        tareas.add(myController.text);
                        myController.clear();
                      }
                    });
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
