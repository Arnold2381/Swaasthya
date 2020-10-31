import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hack/models/places.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MarkerService {

  List<Marker> getMarkers(List<Place> places){
    var markers = List<Marker>();

    places.forEach((place){
      Marker marker = Marker( 
        markerId: MarkerId(place.name),
        draggable: false,
        
        infoWindow: InfoWindow(title: place.name, snippet: place.vicinity),
        position: LatLng(place.geometry.location.lat, place.geometry.location.lng)
      );

      markers.add(marker);
    });

  return markers;
  }
}