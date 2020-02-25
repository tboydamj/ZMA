import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';

class MapPage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MapPage> {

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
            options: new MapOptions(
                center: new LatLng(4.0225, 9.1954), minZoom: 5.0),
            layers: [
              new TileLayerOptions(
                  urlTemplate:
                  "https://api.mapbox.com/styles/v1/tabibrian/ck32qnzxs0hec1cnyq997no4x/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoidGFiaWJyaWFuIiwiYSI6ImNrMzA4OHIwZDBuOTczZ3A4bDUzam1yeXEifQ.xFB-ysp9TsMiJwD-CVCUCg",
                  additionalOptions: {
                    'accessToken':
                    'pk.eyJ1IjoidGFiaWJyaWFuIiwiYSI6ImNrMzA4OHIwZDBuOTczZ3A4bDUzam1yeXEifQ.xFB-ysp9TsMiJwD-CVCUCg',
                    'id': 'mapbox.mapbox-streets-v7'
                  }),
              new MarkerLayerOptions(markers: [
                new Marker(
                    width: 45.0,
                    height: 45.0,
                    point: new LatLng(4.015300, 9.207634),
                    builder: (context) => new Container(
                      child: IconButton(
                        icon: Icon(Icons.location_on),
                        color: Colors.blue,
                        iconSize: 45.0,
                        onPressed: () {
                          print('Marker tapped');
                        },
                      ),
                    ))
              ])
            ]);
  }
}