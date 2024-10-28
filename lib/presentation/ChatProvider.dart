import 'package:flutter/material.dart';
import 'package:proyectoapi/damin/entities/message.dart';

//Punots para luis, Ader, Palbo

class Chatprovider extends ChangeNotifier {
  List<Message> messagetList = [
    Message(text: 'Hola Ader', fromWho: FromWho.me),
    Message(text: '¿Lloraste porque reprobaste topicos?', fromWho: FromWho.me)
  ];
  //controlador para manejar la poscion del scroll
  final ScrollController chatScrollController = ScrollController();

  //enviar un mensaje

  Future<void> sendMessage(String text) async {
    //El mesaje va ser propio ("me")
    final newMesagge = Message(text: text, fromWho: FromWho.me);
    //agrega un nuevo elemento a la lista
    messagetList.add(newMesagge);
    //Notifica el provider cambió para que se guarde en el estado
    notifyListeners();
    //para mover el scroll
    moveScrollToBottom();
  }

  //mover el scroll al ultimo menesaje

  Future<void> moveScrollToBottom() async {
    //un pequeño retraso en la animacion para garanizar que simepre
    //se verá cuando se envien mensajes cortos y rápidos
    await Future.delayed(const Duration(seconds: 1));

    //Ofset: posicion de la animacion
    //maxScrolExtend determina a lo maximo de el scroll puede dar
    chatScrollController.animateTo(
        chatScrollController.position.maxScrollExtent,
        //duracion de la animación
        duration: const Duration(milliseconds: 300),
        //"Rebte" al final de la animación
        curve: Curves.easeOut);
  }
}
