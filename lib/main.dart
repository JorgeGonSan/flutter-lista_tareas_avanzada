import 'package:flutter/material.dart';
import 'package:lista_tareas_avanzada/models/tarea.dart';

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
  List<Tarea> tareas = [];
  String mensaje = "";

  @override
  Widget build(BuildContext context) {
    //Logica para Marcar/Desmarcar todas segun estado checbox
    bool marcadas = true;
    for (var tarea in tareas) {
      if (!tarea.isCheck) {
        marcadas = false;
        break;
      }
    }

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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
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
                              mensaje = "Tarea duplicada, no es posible añadir";
                              //Si no esta duplicado añade a la lista de tareas
                            } else {
                              mensaje = "";
                              tareas.add(Tarea(descripcion: myController.text));
                              myController.clear();
                            }
                          }
                        });
                      },
                      child: Text("Añadir"),
                    ),

                    //Boton marcar/desmarcar
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          bool todasMarcadas = true;
                          for (var tarea in tareas) {
                            if (!tarea.isCheck) {
                              todasMarcadas = false;
                              break;
                            }
                          }
                          if (todasMarcadas) {
                            for (var tarea in tareas) {
                              tarea.isCheck = false;
                            }
                          } else {
                            for (var tarea in tareas) {
                              tarea.isCheck = true;
                            }
                          }
                        });
                      },

                      child: Text(
                        marcadas ? "Desmarcar todas" : "Marcar todas",
                      ),
                    ),
                  ],
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
                        trailing: IconButton(
                          onPressed: () {
                            setState(() {
                              tareas.removeAt(index);
                            });
                          },
                          icon: Icon(Icons.delete),
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
