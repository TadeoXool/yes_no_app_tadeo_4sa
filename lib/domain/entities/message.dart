//Indentidad atomica: lo más pequeña de un sistema
enum FromWho { me, hers }

class Message {
  final String text;
  final String? imageUrl;
  final FromWho fromWho;
  //Almacenar la hora de envío
  final DateTime timeSent;

  Message({
    required this.text,
    this.imageUrl,
    required this.fromWho,
    DateTime? timeSent,
  }) : timeSent = timeSent ?? DateTime.now();
}
