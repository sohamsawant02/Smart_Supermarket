// import 'package:dynamiclist/Cartfile.dart';
// import 'package:dynamiclist/copycart.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
// // import 'Tabtry.dart';
//
// void main() => runApp(MyApp());
//
// class MyApp extends StatefulWidget {
//
//
//   @override
//   _MyAppState createState() => _MyAppState();
//
// }
//
// class _MyAppState extends State<MyApp> {
//   // String scanBarcode = '';
//   String temp='';
//   List<String> item=[];
//   String test='';
//
//
//   @override
//   void initState() {
//     super.initState();
//   }
//
//   Future<void> startBarcodeScanStream() async {
//     FlutterBarcodeScanner.getBarcodeStreamReceiver(
//         '#ff6666', 'Cancel', true, ScanMode.BARCODE)!
//         .listen((barcode) => print(barcode));
//   }
//   String scanBarcode = '';
//   Future<void> scanQR() async {
//     String barcodeScanRes;
//     try {
//       barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
//           '#ff6666', 'Cancel', true, ScanMode.QR);
//       print(barcodeScanRes);
//     } on PlatformException {
//       barcodeScanRes = 'Failed to get platform version.';
//     }
// //barcode scanner flutter ant
//     setState(() {
//       scanBarcode=barcodeScanRes;
//       item.add(scanBarcode);
//       test=item.last;
//       // test=item[item.length-1];
//       // String test = item.last;
//       // var last = int.parse(test);
//     });
//   }
//
//   Future<void> scanBarcodeNormal() async {
//     String barcodeScanRes;
//     try {
//       barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
//           '#ff6666', 'Cancel', true, ScanMode.BARCODE);
//       print(barcodeScanRes);
//     } on PlatformException {
//       barcodeScanRes = 'Failed to get platform version.';
//     }
//
//     if (!mounted) return;
//     setState(() {
//       scanBarcode = barcodeScanRes;
//     });
//   }
// //barcode scanner flutter ant
//   @override
//   Widget build(BuildContext context) {
//     final parts = scanBarcode.split(' ');
//     String split=parts.last;
//     var count=int.tryParse(split);
//
//     // var test=_scanBarcode.split(' ');
//     // var trrr=test[-1];
//     // int tot=int.parse(trrr);
//     // int tot=int.parse(_scanBarcode.replaceAll(RegExp(r'[^0-9]'),''));
//     print(item);
//
//
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//           appBar: AppBar(title: const Text('Barcode Scanner')),
//           body: Builder(builder: (BuildContext context) {
//             return Container(
//                 alignment: Alignment.center,
//                 child: Flex(
//                     direction: Axis.vertical,
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: <Widget>[
//
//                       // ElevatedButton(
//                       //     onPressed: () => scanBarcodeNormal(),
//                       //     child: const Text('Barcode scan')),
//                       // ElevatedButton(
//                       //     onPressed: () => scanQR(),
//                       //     child: const Text('QR scan')),
//                       IconButton(
//                         icon: Icon(Icons.shopping_cart_rounded),
//                         onPressed: () => scanBarcodeNormal(),
//                       ),
//                       Text('Barcode Scan'),
//                       IconButton(
//                         icon: Icon(Icons.shopping_cart_rounded),
//                         onPressed: () => scanQR(),
//                       ),
//                       Text('Qr Scan'),
//                       IconButton(
//                         icon: Icon(Icons.shopping_cart_rounded),
//                         onPressed: () => scanBarcodeNormal(),
//                       ),
//                       Text('Barcode scan'),
//
//
//                       // IconButton(
//                       //   icon: Icon(Icons.shopping_cart,size: 50),
//                       //     onPressed: () => startBarcodeScanStream(),
//                       //     ),
//                       // SizedBox(
//                       //   height: 10,
//                       // ),
//                       // Text('Barcode scan stream'),
//
//                       // Text('${b}'),
//                       Text('Scan result : $count \n',
//                           style: const TextStyle(fontSize: 20)),
//                       ElevatedButton(onPressed: (){
//                         setState(() {
//                           item.add(scanBarcode);
//                           // String test=item[item.length-1];
//                           // print(test);
//                           Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Cart(items: item,removescanBar: scanBarcode,)));
//                         });
//                         // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>TrailPage(scanBarcode: _scanBarcode)));
//                       }, child: Text("Go to cart")),
//                       Expanded(
//                         child: ListView(
//                           shrinkWrap: true,
//                           children: item.map((e){
//                             return Card(
//                               child: ListTile(
//                                 title:Text(e),
//                                 trailing: Container(
//                                   child: Row(
//                                     children: [
//                                       Expanded(
//                                         child:IconButton(
//                                             onPressed: () {
//                                               setState(() {
//                                                 item.remove(scanBarcode);
//                                               });
//                                             }, icon: Icon(Icons.delete)),
//                                       )
//                                     ],
//                                   ),
//                                 ),
//
//                               ),
//                             );
//                           }).toList(),
//
//                         ),
//
//
//                       ),
//
//
//
//                       // userSearchItems.add(_scanBarcode);
//                       // ElevatedButton(
//                       //     onPressed: Navigator.of(context).push(MaterialPageRoute(builder: (context) => TabBarPage())))
//                     ]));
//           })),
//       initialRoute: "/",
//       routes: {
//         "/login":(context)=>Cart(items: item,removescanBar: scanBarcode,)
//       },
//     ); }
// }
//
// //barcode scanner flutter ant
//
//
//
//
//
// // Container(
// // height: 500,
// // width: 30,
// // child: Row(
// // children: [
// // Expanded(child: IconButton(onPressed: (){
// // setState(() {
// // item.remove(scanBarcode);
// // });
// // }, icon: Icon(Icons.delete)))
// // ],
// // ),
// // ),
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
// // import 'package:dynamiclist/main.dart';
// // import 'package:flutter/material.dart';
// // import 'package:provider/provider.dart';
// // void main() {
// //   runApp(const MyApp());
// // }
// //
// // class MyApp extends StatelessWidget {
// //   const MyApp({super.key});
// //
// //   // This widget is the root of your application.
// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       title: 'Flutter Demo',
// //       theme: ThemeData(
// //         // This is the theme of your application.
// //         //
// //         // Try running your application with "flutter run". You'll see the
// //         // application has a blue toolbar. Then, without quitting the app, try
// //         // changing the primarySwatch below to Colors.green and then invoke
// //         // "hot reload" (press "r" in the console where you ran "flutter run",
// //         // or simply save your changes to "hot reload" in a Flutter IDE).
// //         // Notice that the counter didn't reset back to zero; the application
// //         // is not restarted.
// //         primarySwatch: Colors.blue,
// //       ),
// //       home: const Example(),
// //     );
// //   }
// // }
// //
// // class Example extends StatefulWidget {
// //   const Example({Key? key}) : super(key: key);
// //
// //   @override
// //   State<Example> createState() => _ExampleState();
// // }
// //
// // class _ExampleState extends State<Example> {
// //   List<String> item = [];
// //   late String temp;
// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       home: Scaffold(
// //         appBar: AppBar(
// //           title: Text("Demo app"),
// //         ),
// //         body: Column(
// //           children: [
// //             TextField(onChanged: (str){
// //               temp=str;
// //             },),
// //             ElevatedButton(onPressed: (){
// //               setState(() {
// //                 item.add(temp);
// //               });
// //             }, child: Text("Submit")),
// //             Expanded(
// //               child : ListView.builder(
// //                 itemBuilder: (context, int index)=>getRow(),
// //                   itemCount: 1,
// //                   // return Container(
// //                   //   color: Colors.white,
// //                   //   child: ListTile(
// //                   //     trailing: Icon(Icons.access_alarms_rounded),
// //                   //     children: getList(),
// //                   //   ),
// //                   // );
// //                 // shrinkWrap: true,
// //                 ),
// //             )
// //           ],
// //         ),
// //       ),
// //
// //     );
// //
// //   }
// //   Widget getRow(){
// //     return Card(
// //       child: ListTile(
// //           title: Column(
// //               children:
// //                  item.map((element)=>Text(element)).toList(),
// //             ),
// //
// //           trailing:SizedBox(
// //               width: 70,
// //             child: Row(
// //               children: [
// //                 InkWell(
// //                     child: Icon(Icons.delete)),
// //               ],
// //             ),
// //           ),
// //         ),
// //     );
// //
// //   }
// //
// // }
// //
