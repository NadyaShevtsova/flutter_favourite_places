import 'dart:io';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart' as syspaths;
import 'package:path/path.dart' as path;
import 'package:sqflite/sqflite.dart' as sql;
import 'package:sqflite/sqlite_api.dart';

import 'package:favourite_places/models/place.dart';

class UserPlacesNotifier extends StateNotifier<List<Place>> {
  UserPlacesNotifier() : super(const []);

  void addPlace(String title, File image, PlaceLocation location) async {
    //here could be (Place place)
    final appDir = await syspaths.getApplicationCacheDirectory();
    final filename = path.basename(image.path);
    final copiedImage = await image.copy('${appDir.path}/$filename');

    final newPlace =
        Place(title: title, image: copiedImage, location: location);

    final dbPath = await sql.getDatabasesPath();
    final db = await sql.openDatabase(
      path.join(dbPath, 'places.db'),
      onCreate: (db, version) {
        return db.execute('CREATE TABLE user_places(id TEXT PRIMARY KEY, title TEXT, image TEXT, lat RAL, lng REAL, address TEXT)');
      },
      version: 1,
    );
    db.insert('user_place', {
      'id': newPlace.id,
      'title': newPlace.title,
      'image': newPlace.image.path,
      'lat': newPlace.location.latitude,
      'lng': newPlace.location.longtitude,
      'address': newPlace.location.address,
    });

    state = [newPlace, ...state];
  }
}

final UserPlacesProvider =
    StateNotifierProvider<UserPlacesNotifier, List<Place>>(
  (ref) => UserPlacesNotifier(),
);
