import 'package:flutter/material.dart';
import 'package:proyectoapi/config/theme/helpers/get_yes_no_answer.dart';
import 'package:proyectoapi/damin/entities/message.dart';
import 'dart:developer' as developer;

import 'package:proyectoapi/presentation/widgets/chat/her_message_bubble.dart';

class ChatProvider extends ChangeNotifier {
  List<Message> messageList = [
    Message(text: 'Hola iridian', fromWho: FromWho.me),
    Message(text: '¿Lloras porque reprobaste topicos?', fromWho: FromWho.me)
  ];

// Controlador para manejar la posicion del scroll
  final ScrollController chatScrollController = ScrollController();

//Instancia de la clase GetYesNoAnswer
  final getYesNoAnswer = GetYesNoAnswer();

  //Enviar un mensaje
  Future<void> sendMessage(String text) async {
    // No envia el mensaje si esta vacio
    if (text.isEmpty) {
      return;
    }
    // El mensaje siempre va aser "me" por que yo lo envio
    final newMessage = Message(text: text, fromWho: FromWho.me);
    //Agrega un elemento a la lista ""messageList"
    messageList.add(newMessage);

    if (text.endsWith('?')) {
      herReply();
    }

    print("Cantidad de mensajes en la lista: ${messageList.length}");
    //Notifica si algo de provider cambio para que se guarde en el estado
    notifyListeners();

    //Mueve el scroll

    moveScrollToBottom();
  }
  // Mover el scroll al ultimo mensaje

  Future<void> moveScrollToBottom() async {
    if (chatScrollController.hasClients) {
      // un pequeño atraso en la animacion para garantizar que siempre
      // se vera aun cuando se envien mensajes cortos y rapidos
      await Future.delayed(const Duration(seconds: 1));
      chatScrollController.animateTo(
          //offset: Posicion de la animacion
          //maxScrollExtent determina a lo maximo que scroll puede dar
          chatScrollController.position.maxScrollExtent,
          //duracion en la animacion
          duration: const Duration(milliseconds: 300),

          //"rebote" al final de la animacion
          curve: Curves.easeOut);
    }
  }

  Future<void> herReply() async {
    //Obtener el mensaje de la peticion
    final HerMessage = await getYesNoAnswer.getAnswer();
    //Añadir el mensaje de mi crush a la lista
    messageList.add(HerMessage);
    //Notifica si algo de provider cambio para el estado
    notifyListeners();
    //Mueve el scroll hasta el ultimo mensaje recibido
    moveScrollToBottom();
  }
}
