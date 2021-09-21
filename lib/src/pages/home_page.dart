import 'package:barcode_scan2/barcode_scan2.dart';
import 'package:flutter/material.dart';
import 'package:scan_app/src/bloc/scan_bloc.dart';
import 'package:scan_app/src/models/scan_model.dart';
import 'package:scan_app/src/widgets/bodyTaps.dart';
import 'package:scan_app/src/widgets/navigation_bar.dart';



class HomePage extends StatefulWidget {
  HomePage();

  @override
  _HomePageState createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  final scansBloc = new ScansBloc();
  String? _platformVersion = 'Unknown';

  int _index =0;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }



  _scanQR(BuildContext context) async{
    try{

       String futureString="";
      // futureString ="https://www.youtube.com/watch?v=JrQd2XVwMCM";
     futureString ="http://engranedigital.com/blogs-sobre-programacion-que-deberias-agregar-a-tus-marcadores-a-partir-de-hoy";
       if(futureString.isNotEmpty){
         final scan = ScanModel( valor: futureString );
         scansBloc.agregarScan(scan);

          String geo ="geo:40.724233047051705,-74.00731459101564";
         final scan2 = ScanModel( valor: geo);
         scansBloc.agregarScan(scan2);
       }

      // var result  = await BarcodeScanner.scan(options: ScanOptions(
      //   autoEnableFlash: true
      // ));
      //
      // futureString = result.rawContent;
      // print("THIS IS THE URL  $futureString");

    }catch(ex){

      print("ERROR SCANN $ex.toString()");
    }
  }


  @override
  Widget build(BuildContext context) {



    return Scaffold(
      appBar: AppBar(
        title:Text("QR Scanner"),
        actions: [
          IconButton(onPressed: scansBloc.borrarScanTODOS, icon: Icon(Icons.delete_forever))
        ],
      ),
     body: BodyTaps.getPage(_index),
      bottomNavigationBar: MyNavigationBar(tap:_index ,
        onTap: (index){
        setState(() {
          _index = index;
        });
        print(index);
      },),
      floatingActionButtonLocation:FloatingActionButtonLocation.centerDocked ,
      floatingActionButton:FloatingActionButton(
        onPressed:(){

          _scanQR(context);
        },
        child: Icon( Icons.filter_center_focus ),
      ) ,
    );

  }
}