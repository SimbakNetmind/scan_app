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

            },
          )
        ],
      ),
      body: _crearFlutterMap(scan),
    );
  }

  // Widget  _mymap(){
  //  return FlutterMap(
  //     options: new MapOptions(
  //       center: new LatLng(51.5, -0.09),
  //       zoom: 13.0,
  //     ),
  //     layers: [
  //       new TileLayerOptions(
  //         urlTemplate: "https://atlas.microsoft.com/map/tile/png?api-version=1&layer=basic&style=main&tileSize=256&view=Auto&zoom={z}&x={x}&y={y}&subscription-key={subscriptionKey}",
  //         additionalOptions: {
  //           'subscriptionKey': '<YOUR_AZURE_MAPS_SUBSCRIPTON_KEY>'
  //         },
  //       ),
  //       new MarkerLayerOptions(
  //         markers: [
  //           new Marker(
  //             width: 80.0,
  //             height: 80.0,
  //             point: new LatLng(51.5, -0.09),
  //             builder: (ctx) =>
  //             new Container(
  //               child: Text("Sometind"),
  //             ),
  //           ),
  //         ],
  //       ),
  //     ],
  //   );
  // }


  Widget _crearFlutterMap( ScanModel scan ) {

    print("CORDENADAS ${scan.getLatLng()}");
    return FlutterMap(
      options: MapOptions(
          center: scan.getLatLng(),
          zoom: 15
      ),
      layers: [
        _crearMapa(),
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

}