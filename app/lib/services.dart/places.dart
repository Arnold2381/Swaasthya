import 'package:flutter/cupertino.dart';
import 'package:hack/models/places.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class PlacesService with ChangeNotifier {
  final key = 'YOUR_PLACES_API_KEY';

  Future<List<Place>> getPlaces(
    double lat,
    double lng,
  ) async {
    var response = await http.get(
        'https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=$lat,$lng&type=hospital&rankby=distance&key=$key');
    var json = convert.jsonDecode(response.body);
    var jsonResults = json['results'] as List;
    return jsonResults.map((place) => Place.fromJson(place)).toList();
  }
}
