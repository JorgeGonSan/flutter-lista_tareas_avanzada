import 'package:flutter/material.dart';

void main() {
  runApp(const MyListaAvanzada());
}
//clase que representa los elementos de una tarea.
class Tarea {
  String descripcion = "";
  bool isCheck = false;

  Tarea(this.descripcion, this.isCheck);
}

class MyListaAvanzada extends StatefulWidget {
  const MyListaAvanzada({super.key});

  @override
  State<MyListaAvanzada> createState() => _MyListaAvanzadaState();
}

class _MyListaAvanzadaState extends State<MyListaAvanzada> {
  TextEditingController myController = TextEditingController();
  List<Tarea> tareas = [];
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
                      //Si el campo esta vacio muestra msg dinámico
                      if (myController.text.isEmpty) {
                        mensaje = "Añade una tarea, campos vacios";
                      } else {
                        bool duplicado = false;

                        for (var tarea in tareas) {
                          //Sino esta vacio, recorre lista y busca si hay ducplicados
                          if (tarea.descripcion == myController.text) {
                            duplicado = true;
                            break;
                          }
                        }
                        //Si hay duplicado muestra msg dinamico y no lo añade
                        if (duplicado) {
                          //Si no esta duplicado añade a la lista de tareas
                        } else {
                          mensaje = "";
                          tareas.add(Tarea(myController.text, false));
                          myController.clear();
                        }
                      }
                    });
                  },
                  child: Text("Añadir"),
                ),

                Expanded(
                  child: ListView.builder(
                    itemCount: tareas.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(tareas[index].descripcion),
                        leading: Checkbox(
                          value: tareas[index].isCheck,
                          onChanged: (value) {
                            setState(() {
                              tareas[index].isCheck = value!;
                            });
                          },
                        ),
                      );
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
