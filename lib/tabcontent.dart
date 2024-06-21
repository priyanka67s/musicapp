import 'package:flutter/cupertino.dart';
import 'package:project/releasecard.dart';
import 'package:provider/provider.dart';
import 'artistcard.dart';
import 'musicstate.dart';

class TabContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final artists = context.watch<MusicState>().artists;
    final releases = context.watch<MusicState>().releases;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Artists for you',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            ...artists.map((artist) => ArtistCard(
              name: artist.name,
              listeners: artist.listeners,
              imageUrl: artist.imageUrl,
            )),
            SizedBox(height: 16),
            Text(
              'New releases',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              children: releases.map((release) => ReleaseCard(
                title: release.title,
                artist: release.artist,
                imageUrl: release.imageUrl,
              )).toList(),
            ),
          ],
        ),
      ),
    );
  }
}