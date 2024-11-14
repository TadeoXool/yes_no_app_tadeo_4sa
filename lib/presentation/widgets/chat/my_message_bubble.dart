import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:proyectoapi/domain/entities/message.dart';

class MyMessageBubble extends StatelessWidget {
  final Message message;

  const MyMessageBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    // Formatear la hora de envío
    final formattedTime = DateFormat('hh:mm a').format(message.timeSent);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        // Burbuja de texto
        Container(
          decoration: BoxDecoration(
            color: colors.primary,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Stack(
              children: [
                // Columna para el texto y la fila con hora + palomitas
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    // Mensaje de texto
                    Text(
                      message.text,
                      style: const TextStyle(color: Colors.white),
                    ),
                    // Fila con la hora y las palomitas
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Hora
                        Text(
                          formattedTime,
                          style: TextStyle(
                            fontSize: 8, // Reducido el tamaño de fuente
                            color: Colors.white.withOpacity(0.7),
                          ),
                        ),
                        const SizedBox(width: 4),
                        // Palomitas azules
                        const Icon(
                          Icons.check_circle, // Ícono de palomita
                          color: Colors.blue, // Color azul para las palomitas
                          size: 12, // Tamaño pequeño para las palomitas
                        ),
                        const Icon(
                          Icons.check_circle, // Ícono de palomita
                          color: Colors.blue, // Color azul para las palomitas
                          size: 12, // Tamaño pequeño para las palomitas
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 5),
      ],
    );
  }
}
