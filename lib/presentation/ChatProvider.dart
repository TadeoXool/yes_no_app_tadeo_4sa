import 'package:flutter/material.dart';
import 'package:proyectoapi/config/theme/helpers/get_yes_no_answer.dart';
import 'package:proyectoapi/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  List<Message> messageList = [
    Message(text: 'Hola', fromWho: FromWho.me),
    Message(text: 'Que estas haciendo?', fromWho: FromWho.me)
  ];

  // Controlador para manejar la posición del scroll
  final ScrollController chatScrollController = ScrollController();
  final GetYesNoAnswer getYesNoAnswer = GetYesNoAnswer();

  // Enviar un mensaje
  Future<void> sendMessage(String text) async {
    // Verificar que el mensaje no esté vacío
    if (text.trim().isEmpty) return;

    // El mensaje siempre va a ser "me" porque yo lo envío
    final newMessage = Message(text: text, fromWho: FromWho.me);

    // Agrega un elemento a lista "messageList"
    messageList.add(newMessage);

    // Imprimir la cantidad de mensajes después de agregar
    print("Cantidad de mensajes: ${messageList.length}");

    if (text.endsWith('?')) {
      await herReply(); // Esperar la respuesta
    }

    // Notifica si algo de provider cambió para que se guarde en el estado
    notifyListeners();

    // Mueve el scroll
    await moveScrollToBottom();
  }

  //Obtener el mensaje de la petición
  Future<void> herReply() async {
    final herMessage = await getYesNoAnswer.getAnswer();

    // Agrega el mensaje de respuesta de "ella"
    messageList.add(herMessage);

    // Imprimir la cantidad de mensajes después de agregar
    print("Cantidad de mensajes: ${messageList.length}");

    //Notifica si algo de provider cambió para el estado
    notifyListeners();
    //Mueve el scroll hasta el último mensaje recibido
    await moveScrollToBottom();
  }

  // Mover el scroll al último mensaje
  Future<void> moveScrollToBottom() async {
    // Un pequeño atraso en la animación para garantizar que siempre se verá aun cuando se envíen
    // mensajes cortos y rápidos
    await Future.delayed(const Duration(seconds: 1));

    // offset: posición de la animación
    // maxScrollExtent determina a lo máximo que el scroll puede dar
    chatScrollController.animateTo(
        chatScrollController.position.maxScrollExtent,
        // Duración de la animación
        duration: const Duration(milliseconds: 300),
        // "Rebote" al final de la animación
        curve: Curves.easeOut);
  }
}
