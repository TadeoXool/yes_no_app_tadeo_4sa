import 'package:dio/dio.dart';
import 'package:proyectoapi/damin/entities/message.dart';
import 'package:proyectoapi/infrastructure/models/yes_no_model.dart';

class GetYesNoAnswer {
  //Se crea objeto de la clase Dio
  //Para manejar las peticiones HTTP
  final _dio = Dio();

  //Obtener la respuesta
  Future<Message> getAnswer() async {
    //Almacebar la petición GET en una variable
    final response = await _dio.get("https://yesno.wtf/api");

    //Almacenar la data la respuesta en una variable
    final yesNoModel = YesNoModel.fromJsonMap(response.data);

    //devolver la instancia del "Message" creada en el modelo
    return yesNoModel.toMessageEntity();
  }
}
