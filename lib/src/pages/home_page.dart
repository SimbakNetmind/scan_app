import 'package:barcode_scan2/barcode_scan2.dart';
import 'package:flutter/material.dart';
import 'package:scan_app/src/models/scan_model.dart';
import 'package:scan_app/src/providers/db_provider.dart';
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

// _scanQR() async{
//     String futureString="";
//     try{
//       futureString =  (await BarcodeScanner.scan()) as String;
//     }catch(ex){
//       futureString = ex.toString();
//      print(ex);
//
//     }
//     print("Future String :$futureString");
//     if(!futureString.isNotEmpty){
//       print("Tenemos informacion");
//     }
// }

  _scanQR() async{
    try{

       String futureString="";
       futureString ="https://www.youtube.com/watch?v=JrQd2XVwMCM";

       if(futureString.isNotEmpty){
         final scan = ScanModel(valor:futureString);
         DBProvider.db.nuevoScan(scan);

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
          IconButton(onPressed: (){}, icon: Icon(Icons.delete_forever))
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

          _scanQR();
          // Navigator.push(
          //   context,
          //  // MaterialPageRoute(builder: (context) => Scanner()),
          // );
        },
        child: Icon( Icons.filter_center_focus ),
      ) ,
    );

  }
}