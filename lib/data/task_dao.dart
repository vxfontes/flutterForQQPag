import 'package:primeiroprojeto/components/tasks.dart';

class TaskDao {
  static const String tableSQL = 'CREATE TABLE $_tablename('
      '$_name TEXT, '
      '$_difficulty INTERGER, '
      '$_image TEXT)';

  static const String _tablename = 'taskTable';
  static const String _name = 'nome';
  static const String _image = 'imagem';
  static const String _difficulty = 'difficulty';

  save(Tasks tarefa) async {

  }

  Future<List<Tasks>> findAll() async {

  }

  Future<List<Tasks>> find(String nomeTarefa) async {

  }

  delete(String nomeTarefa) async {
    
  }

}