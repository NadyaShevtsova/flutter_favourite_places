import 'package:favourite_places/screens/add_place.dart';
import 'package:flutter/material.dart';
import 'package:favourite_places/widgets/places_list.dart';

class PlacesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Your places'),
          actions: [
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (ctx) => const AddPlaceScreen(),
                  ),
                );
              },
            ),
          ],
        ),
        body: PlacesList(
          places: [],
        ));
  }
}
