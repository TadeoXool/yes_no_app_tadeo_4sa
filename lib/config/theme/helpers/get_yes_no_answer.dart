import 'package:dio/dio.dart';
import 'package:proyectoapi/domain/entities/message.dart';
import 'package:proyectoapi/infrastructure/models/yes_no_model.dart';

class GetYesNoAnswer {
  //Se crea objeto de la clase Dio
  //para manejar las peticiones HTTP
  final _dio = Dio();

  //Obtener la respuesta
  Future<Message> getAnswer() async {
    //Almacenar la peticion GET en una variable
    final response = await _dio.get('https://yesno.wtf/api');

    //Almacenar la data de la respuesta en una variable
    final yesNoModel = YesNoModel.fromJsonMap(response.data);

    //Devolver la instancia de "Message" creada en el modelo
    return yesNoModel.toMessageEntity();
  }
}
