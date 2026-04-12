import 'package:flutter/material.dart';
import 'package:lista_tareas_avanzada/views/mi_lista_avanzada_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MiListaAvanzada());
  }
}
