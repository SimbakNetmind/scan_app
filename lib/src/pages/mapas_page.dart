import 'package:flutter/material.dart';
import 'package:scan_app/src/bloc/scan_bloc.dart';
import 'package:scan_app/src/models/scan_model.dart';


class MapasPage extends StatefulWidget {
  MapasPage();

  @override
  _MapasPageState createState() {
    return _MapasPageState();
  }
}

class _MapasPageState extends State<MapasPage> {

  final scansBloc = new ScansBloc();
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    scansBloc.obtenerScans();
    return StreamBuilder<List<ScanModel>>(
       stream: scansBloc.scansStream,
        builder: (BuildContext context, AsyncSnapshot<List<ScanModel>> snapshot){

          if ( !snapshot.hasData ) {
            return Center(child: CircularProgressIndicator());
          }

          final scans = snapshot.data;

          if ( scans!.length == 0 ) {
            return Center(
              child: Text('No hay información'),
            );
          }
          return ListView.builder(
              itemCount: scans.length,
              itemBuilder: (context, i ) => Dismissible(
                  key: UniqueKey(),
                  background: Container( color: Colors.red ),
                  onDismissed: ( direction ) => scansBloc.borrarScan(scans[i].id!),
                  child: ListTile(
                    leading: Icon( Icons.map, color: Theme.of(context).primaryColor ),
                    title: Text(scans[i].valor! ),
                    subtitle: Text('ID: ${ scans[i].id }'),
                    trailing: Icon( Icons.keyboard_arrow_right, color: Colors.grey ),
                    onTap: () => {},
                  )
              )
          );

        });
  }
}