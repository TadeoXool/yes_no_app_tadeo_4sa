//el modelo define que datso debe
// tener la aplciacion. Investigar MVC
//MVC: Modelo = informacion
//vista : loque vemos , controlador: logica
//mvc: patron de diseño de software

// To parse this JSON data, do
//
//     final yesNoModel = yesNoModelFromJson(jsonString);

import 'package:proyectoapi/damin/entities/message.dart';

class YesNoModel {
  final String answer;
  final bool forced;
  final String image;

  YesNoModel({
    required this.answer,
    required this.forced,
    required this.image,
  });

  factory YesNoModel.fromJsonMap(Map<String, dynamic> json) => YesNoModel(
        answer: json["answer"],
        forced: json["forced"],
        image: json["image"],
      );
  Message toMessageEntity() => Message(
      //Condicional ternario para darle valor a los mensajes
      text: answer == 'yes'
          ? 'si'
          : answer == 'no'
              ? 'No'
              : 'Quizás',
      fromWho: FromWho.hers,
      imageUrl: image);
}
