import 'package:app_flutter/screens/contact_screen.dart';
import 'package:flutter/material.dart';

class DestinationScreen extends StatelessWidget {
  final String name;
  final String location;
  final String summary;
  final double rating;
  final String image;

  const DestinationScreen({
    super.key,
    required this.name,
    required this.location,
    required this.summary,
    required this.rating,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          name,
          style: const TextStyle(color: Colors.white, fontSize: 22),
        ),
        backgroundColor: Colors.orange,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  image,
                  fit: BoxFit.cover,
                ),
                const SizedBox(
                  height: 16.0,
                ),
                Text(
                  name,
                  style: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 8.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      location,
                      style: const TextStyle(fontSize: 20, color: Colors.grey),
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    Text(
                      "⭐$rating",
                      style:
                          const TextStyle(fontSize: 20, color: Colors.orange),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 16.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton.icon(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ContactScreen()),
                        );
                      },
                      icon: const Icon(
                        Icons.event_available,
                        color: Colors.white,
                      ),
                      label: const Text(
                        "Agendar data",
                        style: TextStyle(color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 16.0,
                ),
                Text(
                  summary,
                  style: const TextStyle(fontSize: 18),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
