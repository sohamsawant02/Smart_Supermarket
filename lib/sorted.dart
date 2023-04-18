// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// class Cart extends StatefulWidget {
//   Cart({required this.items,required this.removescanBar});
//   String removescanBar;
//   List items=[];
//   @override
//   State<Cart> createState() => _CartState();
// }
//
// class _CartState extends State<Cart> {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         body: ListView.builder(
//           itemCount:widget.items.length,
//           itemBuilder: (BuildContext context,int index){
//             return Card(
//               child: ListTile(
//                 title: Text(widget.items[index]),
//                 trailing: IconButton(
//                   onPressed: (){
//                     setState(() {
//                       widget.items.remove(widget.removescanBar);
//                     });
//                   },icon: Icon(Icons.delete),
//                 ),
//
//               ),
//             );
//           },
//         ),
//         bottomNavigationBar: Text("Total",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
//       ),
//     );
//
//   }
// }
