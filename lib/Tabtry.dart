import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:collection/collection.dart';
import 'Cartfile.dart';
import 'models/invoice.dart';

class TabTry extends StatefulWidget {
  // const TabTry({Key? key}) : super(key: key);

  @override
  State<TabTry> createState() => _TabTryState();
}

class _TabTryState extends State<TabTry> with TickerProviderStateMixin{
  String test='';
  List<int> itemprice=[];
  List<int> totalprice=[];
  List<String> item=[];
  void initState() {
    super.initState();
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

  Widget build(BuildContext context) {
    // var test=scanBarcode.split(' ');
    // int b=int.parse(test[1]);
    TabController _tabcontroller=TabController(length: 2, vsync: this);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
              appBar: AppBar(
                title: Text('FSAP',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                centerTitle: true,
                backgroundColor: Colors.deepPurple,
              ),
          body: Center(
                  child: Flex(
                    direction: Axis.vertical,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                    IconButton(
                      icon: Icon(Icons.qr_code_scanner,size: 50,),
                      onPressed: () => scanQR(),
                    ),
                      SizedBox(
                        height: 10,
                      ),
                    Text('Scanned Item : $test',style: const TextStyle(fontSize: 20,fontFamily: 'Poppins-reg'),),
                      SizedBox(
                        height: 30 ,
                      ),

                      Expanded(
                        child: Scaffold(
                          body: ListView.builder(
                            itemCount:item.length,
                            itemBuilder: (BuildContext context,int index){
                              return Card(
                                child: ListTile(
                                  title: Text(item[index],style: const TextStyle(fontSize: 20,fontFamily: 'Poppins-reg'),),
                                  // leading: Text("${itemprice[index]}",style: const TextStyle(fontSize: 20,fontFamily: 'Poppins-reg'),),
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

                                      Text("${totalprice.length}",style: const TextStyle(fontSize: 20,fontFamily: 'Poppins-reg'),)



                                    ] ,
                                  ),

                                ),
                              );


                            },
                          ),


                          bottomSheet: InkWell(
                            splashColor: Colors.green.withOpacity(0.5),
                            onLongPress: (){
                              if(totalprice.sum==0){
                                Text("first add items to cart");
                              }
                              else {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) =>
                                        Invoice(total: totalprice.sum)));
                              }
                              },
                            child: Container(
                              alignment: Alignment.center,
                              height: 50,
                              child:
                              Text("Total : ₹${totalprice.sum}",style:TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontFamily: 'Poppins-Black',
                              ),),


                              decoration: BoxDecoration(
                                color: Colors.deepPurple,
                                borderRadius: BorderRadius.circular(30)
                              ),
                              padding: EdgeInsets.all(10),
                              // margin: EdgeInsets.all(10),


                            ),
                          ),
                          // bottomNavigationBar: Text("${totalprice.length}",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                          // // bottomNavigationBar: Text("Total:${total})}",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                          // // FloatingActionButton(onPressed: () {
                          // //   Navigator.of(context).pop(
                          // //       MaterialPageRoute(builder: (context) => MyApp()));
                          // // }),

                        ),
                      ),

                  ],
                  ),

                  ),


          ),
    );
  }
}
// ElevatedButton(
// //
// //     onPressed: () => _tabcontroller.animateTo((_tabcontroller.index + 1) % 2),
// //   // setState(() {
// //   //   item.add(temp);
// //   //
// //   //   // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>CartPage(items: item, temps: temp)));
// //   // });
// // // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>TrailPage(scanBarcode: _scanBarcode)));
// //  child: Text("Go to cart"))