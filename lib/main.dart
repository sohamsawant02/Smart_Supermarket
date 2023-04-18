import 'package:dynamiclist/Cartfile.dart';
import 'package:dynamiclist/copycart.dart';
import 'package:dynamiclist/models/invoice.dart';
import 'package:dynamiclist/sign_in_scr.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'Tabtry.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:collection/collection.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(home: SignIn(),
  debugShowCheckedModeBanner: false,));
}

class MyApp extends StatefulWidget {


  @override
  _MyAppState createState() => _MyAppState();

}

class _MyAppState extends State<MyApp> {
  // String scanBarcode = '';
  String temp='';
  List<String> item=[];
  String test='';
  List<int> itemprice=[];
  List<int> totalprice=[];

  void initState() {

  }

  Future<void> startBarcodeScanStream() async {
    FlutterBarcodeScanner.getBarcodeStreamReceiver(
        '#ff6666', 'Cancel', true, ScanMode.BARCODE)!
        .listen((barcode) =>
        print(barcode)
    );
  }
  int price=0;
  String scanBarcode = '';
  Future<void> scanQR() async {
    String barcodeScanRes;
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.QR);
      // print(barcodeScanRes);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }
//barcode scanner flutter ant
    setState(() {
      scanBarcode=barcodeScanRes;
      item.add(scanBarcode);
      test=item.last;

      final parts = scanBarcode.split(' ');
      String split=parts.last;
      price=int.tryParse(split)!;
      itemprice.add(price);
      // test=item[item.length-1];
      // String test = item.last;
      // var last = int.parse(test);
    });
  }

  Future<void> scanBarcodeNormal() async {
    String barcodeScanRes;
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.BARCODE);
      // print(barcodeScanRes);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }

    if (!mounted) return;
    setState(() {
      scanBarcode = barcodeScanRes;
    });
  }
//barcode scanner flutter ant

  @override

  Widget build(BuildContext context) {
    var total;
    var addcount;
    var mincount;
    var countcart;
    // countitem+=countitem.add(count?.toInt()??0);
    var value;
    // var sum.toList;
    // var test=_scanBarcode.split(' ');
    // var trrr=test[-1];
    // int tot=int.parse(trrr);
    // int tot=int.parse(_scanBarcode.replaceAll(RegExp(r'[^0-9]'),''));
    // print(item);


    return MaterialApp(

      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(title: const Text('Barcode Scanner')),
          body: Builder(builder: (BuildContext context) {
            int totalprice1;
            return Container(
                alignment: Alignment.center,
                child: Flex(
                    direction: Axis.vertical,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[

                      // ElevatedButton(
                      //     onPressed: () => scanBarcodeNormal(),
                      //     child: const Text('Barcode scan')),
                      // ElevatedButton(
                      //     onPressed: () => scanQR(),
                      //     child: const Text('QR scan')),
                      IconButton(
                        icon: Icon(Icons.shopping_cart_rounded),
                        onPressed: () => scanBarcodeNormal(),
                      ),
                      Text('Barcode Scan'),
                      IconButton(
                        icon: Icon(Icons.shopping_cart_rounded),
                          onPressed: () => scanQR(),
                      ),
                      Text('Qr Scan'),
                      IconButton(
                        icon: Icon(Icons.shopping_cart_rounded),
                        onPressed: () => scanBarcodeNormal(),
                      ),
                      Text('Barcode scan'),


                      // IconButton(
                      //   icon: Icon(Icons.shopping_cart,size: 50),
                      //     onPressed: () => startBarcodeScanStream(),
                      //     ),
                      // SizedBox(
                      //   height: 10,
                      // ),
                      // Text('Barcode scan stream'),

                      // Text('${b}'),
                      Text('Scan result : $itemprice \n',
                          style: const TextStyle(fontSize: 20)),
                      ElevatedButton(onPressed: (){
                        setState(() {
                          item.add(scanBarcode);
                          // String test=item[item.length-1];
                          // print(test);
                          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Cart(items: item,removescanBar: scanBarcode,countcart: price,)));
                        });
                        // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>TrailPage(scanBarcode: _scanBarcode)));
                      }, child: Text("Go to cart")),
                      Expanded(
                        child: Scaffold(
                          body: ListView.builder(
                            itemCount:item.length,
                            itemBuilder: (BuildContext context,int index){
                              return Card(
                                child: ListTile(
                                  title: Text(item[index]),
                                  leading: Text("${itemprice[index]}"),
                                  trailing: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children:[
                                      IconButton(
                                        onPressed: (){
                                          setState(() {
                                            item.remove(item[index]);
                                            print(item);
                                          });
                                        },icon: Icon(Icons.delete),
                                      ),
                                      IconButton(
                                        onPressed:() {
                                          setState(() {
                                            totalprice.add(itemprice[index]);
                                            print("$totalprice");
                                          });
                                        },icon: Icon(Icons.add),
                                      ),
                                      IconButton(
                                        onPressed:() {
                                          setState(() {
                                            if(itemprice[index]!=null) {
                                              totalprice.remove(itemprice[index]);
                                              print("$totalprice");
                                            }
                                          });
                                        },icon: Icon(Icons.minimize),
                                      ),

                                      Text("${totalprice.length}"),

                                    ] ,
                                  ),

                                ),
                              );

                            },
                          ),

                          // bottomNavigationBar: Text("Total:${total})}",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                          // FloatingActionButton(onPressed: () {
                          //   Navigator.of(context).pop(
                          //       MaterialPageRoute(builder: (context) => MyApp()));
                          // }),
                        ),
                        ),
                      if(item.length==null)
                        Text("total:0")
                      else
                        Text("Total:${totalprice.sum}",style: TextStyle(fontStyle: FontStyle.italic,fontWeight: FontWeight.w900),),


                      // userSearchItems.add(_scanBarcode);
                      // ElevatedButton(
                      //     onPressed: Navigator.of(context).push(MaterialPageRoute(builder: (context) => TabBarPage())))
                    ]));
          })),
      initialRoute: "/",
      routes: {
        "/login":(context)=>Cart(items: item,removescanBar: scanBarcode,countcart: price,)
      },
    ); }
}

//barcode scanner flutter ant













































// import 'package:dynamiclist/main.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         // This is the theme of your application.
//         //
//         // Try running your application with "flutter run". You'll see the
//         // application has a blue toolbar. Then, without quitting the app, try
//         // changing the primarySwatch below to Colors.green and then invoke
//         // "hot reload" (press "r" in the console where you ran "flutter run",
//         // or simply save your changes to "hot reload" in a Flutter IDE).
//         // Notice that the counter didn't reset back to zero; the application
//         // is not restarted.
//         primarySwatch: Colors.blue,
//       ),
//       home: const Example(),
//     );
//   }
// }
//
// class Example extends StatefulWidget {
//   const Example({Key? key}) : super(key: key);
//
//   @override
//   State<Example> createState() => _ExampleState();
// }
//
// class _ExampleState extends State<Example> {
//   List<String> item = [];
//   late String temp;
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text("Demo app"),
//         ),
//         body: Column(
//           children: [
//             TextField(onChanged: (str){
//               temp=str;
//             },),
//             ElevatedButton(onPressed: (){
//               setState(() {
//                 item.add(temp);
//               });
//             }, child: Text("Submit")),
//             Expanded(
//               child : ListView.builder(
//                 itemBuilder: (context, int index)=>getRow(),
//                   itemCount: 1,
//                   // return Container(
//                   //   color: Colors.white,
//                   //   child: ListTile(
//                   //     trailing: Icon(Icons.access_alarms_rounded),
//                   //     children: getList(),
//                   //   ),
//                   // );
//                 // shrinkWrap: true,
//                 ),
//             )
//           ],
//         ),
//       ),
//
//     );
//
//   }
//   Widget getRow(){
//     return Card(
//       child: ListTile(
//           title: Column(
//               children:
//                  item.map((element)=>Text(element)).toList(),
//             ),
//
//           trailing:SizedBox(
//               width: 70,
//             child: Row(
//               children: [
//                 InkWell(
//                     child: Icon(Icons.delete)),
//               ],
//             ),
//           ),
//         ),
//     );
//
//   }
//
// }
//
