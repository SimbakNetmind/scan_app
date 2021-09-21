import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:scan_app/src/models/scan_model.dart';
//import 'package:flutter_map/flutter_map.dart';
class MapaPage extends StatefulWidget {
  MapaPage();

  @override
  _MapaPageState createState() {
    return _MapaPageState();
  }
}

class _MapaPageState extends State<MapaPage> {
  final map = new MapController();

  @override
  Widget build(BuildContext context) {
    //final Object? scan = ModalRoute.of(context)!.settings.arguments;
    final  scan = ModalRoute.of(context)!.settings.arguments as ScanModel;

    return Scaffold(
      appBar: AppBar(
        title: Text('Coordenadas QR'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.my_location),
            onPressed: (){
              map.move(scan.getLatLng(), 15);
            },
          )
        ],
      ),
      body: _crearFlutterMap(scan),
    );
  }


  Widget _crearFlutterMap( ScanModel scan ) {

    print("CORDENADAS ${scan.getLatLng()}");
    return FlutterMap(
      mapController: map,
      options: MapOptions(
          center: scan.getLatLng(),
          zoom: 15
      ),
      layers: [
        _crearMapa(),
        _crearMarcadores(scan)
      ],
    );

  }

  _crearMapa() {

    return TileLayerOptions(
        urlTemplate: 'https://api.mapbox.com/styles/v1/simbaknetmind/cktui1jyo169j17mhefgey2qr/tiles/256/{z}/{x}/{y}@2x?access_token={accessToken}'
       ,
        additionalOptions: {
          'accessToken': 'pk.eyJ1Ijoic2ltYmFrbmV0bWluZCIsImEiOiJja3R1ZGIweTUxcDh2Mm5vMWV4eHFmdm9zIn0.T1cTufvs0UWIAlkSh8bkZg',
          'id': 'mapbox.mapbox-streets-v8'
          // streets, dark, light, outdoors, satellite
        }
    );
  }


  _crearMarcadores( ScanModel scan ) {

    return MarkerLayerOptions(
        markers: <Marker>[
          Marker(
              width: 100.0,
              height: 100.0,
              point: scan.getLatLng(),
              builder: ( context ) => Container(
                child: Icon(
                  Icons.location_on,
                  size: 70.0,
                  color: Theme.of(context).primaryColor,
                ),
              )
          )
        ]
    );

  }

}