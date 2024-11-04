import 'package:flutter/material.dart';
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
                'https://yesno.wtf/assets/no/32-b62f1f8058c1d7f06c528319faccfb38.gif'),
          ),
        ),
        title: const Text('Mi amor'),
        centerTitle: false,
      ),
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
                child: ListView.builder(
              itemCount: 100,
              itemBuilder: (context, index) {
                return index % 2 == 0
                    ? const HerMessageBubble()
                    : const MyMessageBubble();
              },
            )),

            /// Caja de texto de mensajes
            const MessageFieldBox()
          ],
        ),
      ),
    );
  }
}
