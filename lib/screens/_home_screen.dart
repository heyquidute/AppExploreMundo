import 'package:app_flutter/screens/about_us_screen.dart';
import 'package:app_flutter/screens/contact_screen.dart';
import 'package:app_flutter/screens/list_destinations_screen.dart';
import 'package:app_flutter/screens/travel_packages_screen.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'destination_screen.dart';

class HomeScreen extends StatefulWidget {
  //Lista de destinos com detalhes
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

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String searchQuery = '';

  List<Map<String, dynamic>> get filteredDestinations {
    if (searchQuery.isEmpty) {
      return HomeScreen.destinations;
    } else {
      return HomeScreen.destinations.where((destination) {
        return destination['name']
            .toLowerCase()
            .contains(searchQuery.toLowerCase());
      }).toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> topRatedDestinations = HomeScreen
        .destinations
        .where((destination) => destination['rating'] == 4.9)
        .toList();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Explore Mundo',
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.orange,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.orange,
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.location_on_outlined),
              title: const Text('Destinos'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ListDestinationsScreen()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.card_travel),
              title: const Text('Pacotes de viagem'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const TravelPackagesScreen()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.call_outlined),
              title: const Text('Contato'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ContactScreen()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.info_outline),
              title: const Text('Sobre nós'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const AboutUsScreen()),
                );
              },
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 16),
          const Text(
            "Descubra novos destinos!!!",
            style: TextStyle(fontSize: 20),
          ),
          const SizedBox(height: 16),
          CarouselSlider(
            options: CarouselOptions(
              height: 200.0,
              autoPlay: true,
            ),
            items: topRatedDestinations.map((destination) {
              return Builder(
                builder: (BuildContext context) {
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
                    child: Container(
                      margin: const EdgeInsets.all(5.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          image: DecorationImage(
                            image: AssetImage(destination['image']),
                            fit: BoxFit.cover,
                          )),
                    ),
                  );
                },
              );
            }).toList(),
          ),
          const SizedBox(
            height: 16.0,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: "Pra onde você quer ir?",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(30.0),
                  ),
                ),
              ),
              onChanged: (value) {
                setState(() {
                  searchQuery = value;
                });
              },
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: ListView.builder(
              itemCount: filteredDestinations.length,
              itemBuilder: (context, index) {
                final destination = filteredDestinations[index];
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
                            destination['name'],
                            style: const TextStyle(fontSize: 18),
                          ),
                          Text(
                            destination['location'],
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
