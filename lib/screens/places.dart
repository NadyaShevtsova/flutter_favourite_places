import 'package:flutter/material.dart';
import 'package:favourite_places/widgets/places_list.dart';

class PlacesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Your places'),
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.add)),
          ],
      ),
      body: PlacesList(
          places: [],
        )
    );
  }
}
