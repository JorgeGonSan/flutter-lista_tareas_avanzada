/*
clase que representa los elementos de una tarea, con parametros nombrados ({})
campo descripcion obligatoria por defecto toda tarea nueva estara desmarcada.
*/
class Tarea {
  String descripcion;
  bool isCheck;

  Tarea({required this.descripcion, this.isCheck = false});
}
