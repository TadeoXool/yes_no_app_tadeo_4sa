import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyectoapi/damin/entities/message.dart';
import 'package:proyectoapi/presentation/ChatProvider.dart';
import 'package:proyectoapi/presentation/widgets/chat/her_message_bubble.dart';
import 'package:proyectoapi/presentation/widgets/chat/my_message_bubble.dart';
import 'package:proyectoapi/presentation/widgets/chat/shared/message_field_box.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(4.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
                "https://cdn.prod.www.spiegel.de/images/3f9aaec2-735c-4bbf-8919-ee2d219e1188_w256_r1_fpx55.32_fpy44.98.jpg"),
          ),
        ),
        title: const Text("MI amor"),
      ),
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Pedirle al widget que esté pendiente de todos los cambios
    final chatProvider = context.watch<ChatProvider>();
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
                child: ListView.builder(
              itemCount: chatProvider.messageList.length,
              itemBuilder: (context, index) {
                //Instancia del message que sabrá de quién es el mensaje
                final message = chatProvider.messageList[index];
                return (message.fromWho == FromWho.hers)
                    ? HerMessageBubble(message: message)
                    : MyMessageBubble(message: message);
              },
            )),

            /// Caja de texto de mensajes
            MessageFieldBox(
              //Una vez que tenga el valor cambiado, enviap
              onValue: (value) => chatProvider.sendMessage(value),
            ),
          ],
        ),
      ),
    );
  }
}
