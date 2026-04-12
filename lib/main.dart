import 'package:flutter/material.dart';
import 'package:lista_tareas_avanzada/viewmodels/tarea_viewmodel.dart';

void main() {
  runApp(const MyListaAvanzada());
}

class MyListaAvanzada extends StatefulWidget {
  const MyListaAvanzada({super.key});

  @override
  State<MyListaAvanzada> createState() => _MyListaAvanzadaState();
}

class _MyListaAvanzadaState extends State<MyListaAvanzada> {
  final TareaViewmodel viewmodel = TareaViewmodel();
  TextEditingController myController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ListenableBuilder(
        listenable: viewmodel,
        builder: (context, child) {
          return Scaffold(
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
                      child: Text(viewmodel.mensaje),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            viewmodel.agregarTareas(myController.text);
                            myController.clear();
                          },
                          child: Text("Añadir"),
                        ),

                        //Boton marcar/desmarcar
                        ElevatedButton(
                          onPressed: () {
                            viewmodel.marcarDesmarcarTodas();
                          },

                          child: Text(
                            viewmodel.estanTodasMarcadas
                                ? "Desmarcar todas"
                                : "Marcar todas",
                          ),
                        ),
                      ],
                    ),

                    Expanded(
                      child: ListView.builder(
                        itemCount: viewmodel.tareas.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(viewmodel.tareas[index].descripcion),
                            leading: Checkbox(
                              value: viewmodel.tareas[index].isCheck,
                              onChanged: (value) {
                                viewmodel.cambiarCheck(index);
                              },
                            ),
                            trailing: IconButton(
                              onPressed: () {
                                viewmodel.eliminarTarea(index);
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
          );
        },
      ),
    );
  }
}
