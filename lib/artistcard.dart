
import 'package:flutter/material.dart';

class ArtistCard extends StatelessWidget {
  final String name;
  final String listeners;
  final String imageUrl;

  ArtistCard({required this.name, required this.listeners, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Image.network(imageUrl, width: 50, height: 50, fit: BoxFit.cover),
        title: Text(name),
        subtitle: Text(listeners),
        trailing: Icon(Icons.play_circle_fill),
      ),
    );
  }
}