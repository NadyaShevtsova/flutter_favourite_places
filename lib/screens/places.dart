import 'package:favourite_places/providers/user_places.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:favourite_places/widgets/places_list.dart';
import 'package:favourite_places/screens/add_place.dart';

class PlacesScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    
    final userPlaces = ref.watch(UserPlacesProvider);

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
        body: Padding(
          padding: const EdgeInsets.all(8),
          child: PlacesList(
            places: userPlaces,
          ),
        ));
  }
}
