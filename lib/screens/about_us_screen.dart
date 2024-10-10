import 'package:flutter/material.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Sobre nós",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.orange,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              "Um pouquinho sobre nós...",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              "Aqui, acreditamos que cada viagem é uma oportunidade única de descobrir novas culturas, sabores e paisagens. "
              "Nossa missão é facilitar que você embarque nessa jornada de exploração, permitindo que você viva experiências que vão além do comum.\n\n"
              "Queremos que você sinta a emoção de desbravar lugares incríveis, fazer novas amizades e criar memórias que durarão para sempre. "
              "Viajar não é apenas visitar novos destinos; é sentir que você realmente viveu.\n\n"
              "Vamos juntos nessa aventura de \n EXPLORAR O MUNDO!!!",
              style: TextStyle(fontSize: 16, height: 1.5),
            ),
          ),
        ],
      ),
    );
  }
}
