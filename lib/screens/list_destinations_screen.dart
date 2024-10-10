import 'package:app_flutter/screens/destination_screen.dart';
import 'package:flutter/material.dart';

class ListDestinationsScreen extends StatelessWidget {
  static const List<Map<String, dynamic>> destinations = [
    {
      "id": 1,
      "name": "Machu Picchu",
      "location": "Peru",
      "summary":
          "Uma antiga cidade inca localizada no topo de montanhas dos Andes, famosa por sua arquitetura e vistas deslumbrantes.",
      "rating": 4.8,
      "image": "lib/src/assets/machu_picchu.jpg"
    },
    {
      "id": 2,
      "name": "Ilhas Maldivas",
      "location": "Maldivas",
      "summary":
          "Um arquipélago tropical no Oceano Índico conhecido por suas praias de areia branca e águas cristalinas.",
      "rating": 4.9,
      "image": "lib/src/assets/maldivas.jpg"
    },
    {
      "id": 3,
      "name": "Angkor Wat",
      "location": "Camboja",
      "summary":
          "O maior templo religioso do mundo, construído no século 12, é um dos marcos mais impressionantes do sudeste asiático.",
      "rating": 4.9,
      "image": "lib/src/assets/angkor_wat.jpg"
    },
    {
      "id": 4,
      "name": "Taj Mahal",
      "location": "Índia",
      "summary":
          "Um mausoléu icônico de mármore branco construído pelo imperador Shah Jahan em memória de sua esposa Mumtaz Mahal.",
      "rating": 4.8,
      "image": "lib/src/assets/taj_mahal.jpg"
    },
    {
      "id": 5,
      "name": "A Grande Muralha",
      "location": "China",
      "summary":
          "Uma estrutura gigantesca e contínua construída para proteger a China de invasores, com mais de 21 mil quilômetros de extensão.",
      "rating": 4.9,
      "image": "lib/src/assets/grande_muralha.jpg"
    },
    {
      "id": 6,
      "name": "Tikal",
      "location": "Guatemala",
      "summary":
          "Ruínas de uma antiga cidade maia, localizada no coração da selva guatemalteca.",
      "rating": 4.8,
      "image": "lib/src/assets/tikal.jpg"
    },
    {
      "id": 7,
      "name": "Yellowstone",
      "location": "EUA",
      "summary":
          "O primeiro parque nacional do mundo, conhecido por suas paisagens deslumbrantes e vida selvagem diversificada.",
      "rating": 4.7,
      "image": "lib/src/assets/yellowstone.jpg"
    },
    {
      "id": 8,
      "name": "Abu Simbel",
      "location": "Egito",
      "summary":
          "Dois templos monumentais construídos pelo faraó Ramsés II, esculpidos nas rochas do sul do Egito.",
      "rating": 4.9,
      "image": "lib/src/assets/abu_simbel.jpg"
    },
    {
      "id": 9,
      "name": "Arashiyama",
      "location": "Kyoto, Japão",
      "summary":
          "Uma famosa floresta de bambu localizada nos arredores de Kyoto, oferecendo uma atmosfera serena e encantadora.",
      "rating": 4.7,
      "image": "lib/src/assets/arashiyama.jpg"
    }
  ];

  const ListDestinationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Destinos",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.orange,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Column(
        children: [
          const SizedBox(height: 16),
          Expanded(
            child: ListView.builder(
              itemCount: destinations.length,
              itemBuilder: (context, index) {
                final destination = destinations[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DestinationScreen(
                          name: destination['name'],
                          location: destination['location'],
                          summary: destination['summary'],
                          rating: destination['rating'],
                          image: destination['image'],
                        ),
                      ),
                    );
                  },
                  child: Card(
                    margin: const EdgeInsets.symmetric(
                      vertical: 8.0,
                      horizontal: 20.0,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 16.0, horizontal: 16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            destination['location'],
                            style: const TextStyle(fontSize: 24),
                          ),
                          Text(
                            destination['name'],
                            style: const TextStyle(color: Colors.grey),
                          ),
                          Text(
                            '⭐ ${destination['rating']}',
                            style: const TextStyle(color: Colors.orange),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
