import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:favourite_places/models/place.dart';

class UserPlacesNotifier extends StateNotifier<List<Place>> {
  UserPlacesNotifier() : super(const []);

  void addPlace(String title) { //here could be (Place place)
    final newPlace = Place(title: title);
    state = [newPlace, ...state];
  }
}

final UserPlacesProvider = StateNotifierProvider<UserPlacesNotifier, List<Place>>(
  (ref) => UserPlacesNotifier(),
);
