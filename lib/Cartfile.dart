// import 'package:dynamiclist/main.dart';
// import 'package:flutter/material.dart';
//
// class CartPage extends StatefulWidget {
//   CartPage({required this.items,required this.temps});
//   int count=0;
//   List<String> items=[];
//   String temps;
//   @override
//   State<CartPage> createState() => _CartPageState();
// }
//
// class _CartPageState extends State<CartPage> {
//   // List<String> storeditem=[];
//   int total = 90;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Column(
//           children: [
//             Expanded(
//               child: ListView(
//                 shrinkWrap: true,
//                 children: items.map((e) {
//                   return Card(
//                     child: ListTile(
//                       title: Text(e),
//                         trailing: Container(
//                           width: 30,
//                           child: Row(
//                             children: [
//                              Expanded(child: IconButton(onPressed: () {
//                                 setState(() {
//                                     items.remove(widget.temps);
//                               });
//                             },
//                                 icon: Icon(Icons.delete)))
//                           ],
//                         ),
//                       ),
//                     ),
//
//
//                   );
//                 }),
//               ),
//
//             ),
//             Text(''),
//             FloatingActionButton(onPressed: () {
//               Navigator.of(context).pop(
//                   MaterialPageRoute(builder: (context) => MyApp()));
//             })
//           ],
//
//         ),
//       ),
//     );
//   }
// }
// //
// //
// //     //     // appBar: AppBar(
// //     //     //   title:Text("Cart") ,
// //     //     body: ListView.builder(
// //     //       itemCount: widget.items.length,
// //     //       shrinkWrap: true,
// //     //       itemBuilder: (context, index) {
// //     //         return Card(
// //     //               child: ListTile(
// //     //                 title: Text("${widget.items[index]}"),
// //     //                 subtitle: Text("${total}"),
// //     //                 trailing: Container(
// //     //                     child: Row(
// //     //                         children: [
// //     //                           Expanded(
// //     //                             child: IconButton(onPressed: () {
// //     //                               setState(() {
// //     //                                 widget.items.remove(widget.temp);
// //     //                               });
// //     //                             },
// //     //                                 icon: Icon(Icons.delete)),
// //     //                           )
// //     //                         ]
// //     //                     ),
// //     //                   ),
// //     //               ),
// //     //         );
// //     //       }
// //     //   // ?.toList()
// //     //     ),
// //     //   );
// //     // }
// //     // }
// //
// //
// //     //
// //     //   body: Center(
// //     //   child:Column(
// //     //     children: [
// //     //
// //     //       //
// //     //       Expanded(
// //     //         child: ListView(
// //     //           shrinkWrap: true,
// //     //           children: widget.items.map((e){
// //     //             return Card(
// //     //               child: ListTile(
// //     //                 title:Text(e),
// //     //                 trailing: Container(
// //     //                   width: 30,
// //     //                   child: Row(
// //     //                     children: [
// //     //                       Expanded(child: IconButton(onPressed: (){
// //     //                         setState(() {
// //     //                           widget.items.remove(widget.temps);
// //     //                         });
// //     //
// //     //                       },
// //     //                           icon: Icon(Icons.delete)))
// //     //                     ],
// //     //                   ),
// //     //                 ),
// //     //               ),
// //     //
// //     //
// //     //             );
// //     //           })?.toList()  ??[],
// //     //         ),
// //     //
// //     //       ),
// //     //       Text(''),
// //     //       FloatingActionButton(onPressed: (){
// //     //         Navigator.of(context).pop(MaterialPageRoute(builder: (context)=>MyApp()));
// //     //       })
// //     //     ],
// //     //
// //     //   ),
// //     // ),
// //     // );
// //



// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
// import 'package:collection/collection.dart';
// import 'Cartfile.dart';
//
// class TabTry extends StatefulWidget {
//   // const TabTry({Key? key}) : super(key: key);
//
//   @override
//   State<TabTry> createState() => _TabTryState();
// }
//
// class _TabTryState extends State<TabTry> with TickerProviderStateMixin{
//   String test='';
//   List<int> itemprice=[];
//   List<int> totalprice=[];
//   List<String> item=[];
//   void initState() {
//     super.initState();
//   }
//   int price=0;
//   String scanBarcode = '';
//   Future<void> scanQR() async {
//     String barcodeScanRes;
//     try {
//       barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
//           '#ff6666', 'Cancel', true, ScanMode.QR);
//       // print(barcodeScanRes);
//     } on PlatformException {
//       barcodeScanRes = 'Failed to get platform version.';
//     }
// //barcode scanner flutter ant
//     setState(() {
//       scanBarcode=barcodeScanRes;
//       item.add(scanBarcode);
//       test=item.last;
//
//       final parts = scanBarcode.split(' ');
//       String split=parts.last;
//       price=int.tryParse(split)!;
//       itemprice.add(price);
//       // test=item[item.length-1];
//       // String test = item.last;
//       // var last = int.parse(test);
//     });
//   }
//
//   Widget build(BuildContext context) {
//     // var test=scanBarcode.split(' ');
//     // int b=int.parse(test[1]);
//     TabController _tabcontroller=TabController(length: 2, vsync: this);
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('FSAP',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
//           centerTitle: true,
//           backgroundColor: Colors.deepPurple,
//           bottom: TabBar(
//             controller: _tabcontroller,
//             isScrollable: true,
//             indicatorColor: Colors.black,
//             // padding: EdgeInsets.symmetric(horizontal: 30),
//             tabs: [
//               Tab(
//                 icon: Text("Buy products",style: const TextStyle(fontSize: 20,fontFamily: 'Poppins-reg',color: Colors.white70),),
//                 iconMargin: EdgeInsets.only(bottom: 5.0),
//               ),
//               Tab(
//                 icon: Text("Cart Page",style: const TextStyle(fontSize: 20,fontFamily: 'Poppins-reg',color: Colors.white70),),
//               ),
//
//             ],
//           ),
//         ),
//         body: TabBarView(
//           controller: _tabcontroller,
//           children: [
//             Center(
//               child: Flex(
//                 direction: Axis.vertical,
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   SizedBox(
//                     height: 20,
//                   ),
//                   IconButton(
//                     icon: Icon(Icons.qr_code_scanner,size: 50,),
//                     onPressed: () => scanQR(),
//                   ),
//                   SizedBox(
//                     height: 10,
//                   ),
//                   Text('Scanned Item : $test',style: const TextStyle(fontSize: 20,fontFamily: 'Poppins-reg'),),
//                   SizedBox(
//                     height: 30 ,
//                   ),
//
//                   Expanded(
//                     child: Scaffold(
//                       body: ListView.builder(
//                         itemCount:item.length,
//                         itemBuilder: (BuildContext context,int index){
//                           return Card(
//                             child: ListTile(
//                               title: Text(item[index],style: const TextStyle(fontSize: 20,fontFamily: 'Poppins-reg'),),
//                               leading: Text("${itemprice[index]}",style: const TextStyle(fontSize: 20,fontFamily: 'Poppins-reg'),),
//                               trailing: Row(
//                                 mainAxisSize: MainAxisSize.min,
//                                 children:[
//                                   IconButton(
//                                     onPressed: (){
//                                       setState(() {
//                                         item.remove(item[index]);
//                                         print(item);
//                                       });
//                                     },icon: Icon(Icons.delete),
//                                   ),
//                                   IconButton(
//                                     onPressed:() {
//                                       setState(() {
//                                         totalprice.add(itemprice[index]);
//                                         print("$totalprice");
//                                       });
//                                     },icon: Icon(Icons.add),
//                                   ),
//                                   IconButton(
//                                     onPressed:() {
//                                       setState(() {
//                                         if(itemprice[index]!=null) {
//                                           totalprice.remove(itemprice[index]);
//                                           print("$totalprice");
//                                         }
//                                       });
//                                     },icon: Icon(Icons.minimize),
//                                   ),
//                                   Text("${totalprice.length}",style: const TextStyle(fontSize: 20,fontFamily: 'Poppins-reg'),)
//
//
//
//                                 ] ,
//                               ),
//
//                             ),
//                           );
//
//
//                         },
//                       ),
//
//
//                       bottomSheet: InkWell(
//                         onLongPress: ()=>_tabcontroller.animateTo((_tabcontroller.index + 1) % 2),
//                         child: Container(
//                           alignment: Alignment.center,
//                           height: 50,
//                           child:
//                           Text("Total : ₹${totalprice.sum}",style:TextStyle(
//                             fontSize: 20,
//                             color: Colors.white,
//                             fontFamily: 'Poppins-Black',
//                           ),),
//
//
//                           decoration: BoxDecoration(
//                               color: Colors.deepPurple,
//                               borderRadius: BorderRadius.circular(30)
//                           ),
//                           padding: EdgeInsets.all(10),
//                           // margin: EdgeInsets.all(10),
//
//
//                         ),
//                       ),
//                       // bottomNavigationBar: Text("${totalprice.length}",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
//                       // // bottomNavigationBar: Text("Total:${total})}",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
//                       // // FloatingActionButton(onPressed: () {
//                       // //   Navigator.of(context).pop(
//                       // //       MaterialPageRoute(builder: (context) => MyApp()));
//                       // // }),
//
//                     ),
//                   ),
//
//                 ],
//               ),
//
//             ),
//
//             Center(
//               child: Text("BarcodeScanner"),
//             )
//
//           ],
//         ),
//       ),
//     );
//   }
// }
// // ElevatedButton(
// // //
// // //     onPressed: () => _tabcontroller.animateTo((_tabcontroller.index + 1) % 2),
// // //   // setState(() {
// // //   //   item.add(temp);
// // //   //
// // //   //   // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>CartPage(items: item, temps: temp)));
// // //   // });
// // // // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>TrailPage(scanBarcode: _scanBarcode)));
// // //  child: Text("Go to cart"))