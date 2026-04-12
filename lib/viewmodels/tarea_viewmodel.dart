import 'package:flutter/material.dart';

import '../models/tarea.dart';

class TareaViewmodel extends ChangeNotifier {
  //variable privadas
  List<Tarea> _tareas = [];
  String _mensaje = "";

  //acceso a solo la lectura de la variables privadas
  List<Tarea> get tareas => _tareas;
  String get mensaje => _mensaje;
  //Logica para Marcar/Desmarcar todas segun estado checbox
  bool get estanTodasMarcadas {
    if (_tareas.isEmpty) return false;
    for (var tarea in _tareas) {
      if (!tarea.isCheck) {
        return false;
      }
    }
    return true;
  }

  //añadir una tarea
  void agregarTareas(String texto) {
    texto = texto.trim();
    //Si el campo esta vacio muestra msg dinámico
    if (texto.isEmpty) {
      _mensaje = "Añade una tarea, campos vacios";
    } else {
      bool duplicado = false;

      for (var tarea in tareas) {
        //Sino esta vacio, recorre lista y busca si hay duplicados
        if (tarea.descripcion == texto) {
          duplicado = true;
          break;
        }
      }
      //Si hay duplicado muestra msg dinamico y no lo añade
      if (duplicado) {
        _mensaje = "Tarea duplicada, no es posible añadir";
      } else {
        _mensaje = "";
        _tareas.add(Tarea(descripcion: texto));
      }
    }
    notifyListeners();
  }

  //marcar/desmarcar
  void marcarDesmarcarTodas() {
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
    notifyListeners();
  }

  //camiar el check de una tarea
  void cambiarCheck(int index) {
    _tareas[index].isCheck = !_tareas[index].isCheck;
    notifyListeners();
  }

  //Eliminar tarea
  void eliminarTarea(int index) {
    _tareas.removeAt(index);
    notifyListeners();
  }
}
