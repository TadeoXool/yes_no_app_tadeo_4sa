import 'package:dio/dio.dart';
import 'package:proyectoapi/damin/entities/message.dart';

class GetYesNoAnswer {
//se crea intanscia de la clase Dio
//Para manejar las peticiones HTTP
  final _dio = Dio();

//obtener la respuesta
  Future<Message> getAnswer() async {
    //Almacenar la petición GET en una variable
    final response = await _dio.get('https://yesno:wtf/api');

    //Generar
    throw UnimplementedError();
  }
}
