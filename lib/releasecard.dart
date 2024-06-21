import 'package:flutter/material.dart';
class ReleaseCard extends StatelessWidget {
  final String title;
  final String artist;
  final String imageUrl;

  ReleaseCard({required this.title, required this.artist, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(imageUrl, width: double.infinity, height: 100, fit: BoxFit.cover),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(artist, style: TextStyle(fontSize: 14)),
          ),
        ],
      ),
    );
  }
}