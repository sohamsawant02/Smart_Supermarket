import 'package:dynamiclist/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Cart extends StatefulWidget {
  Cart({required this.items,required this.removescanBar,required this.countcart});
  String removescanBar;
  List items=[];
  var countcart;
  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  var total;
  var addcount;
  var mincount;
  List<int> allvalues=[];
  @override
  void initState() {
    allvalues.add(widget.countcart);
    for(var item in allvalues)
      print(item);
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: ListView.builder(
          itemCount:widget.items.length,
          itemBuilder: (BuildContext context,int index){
            return Card(
              child: ListTile(
                title: Text(widget.items[index]),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children:[
                    for(var item in allvalues)
                        Text("$item"),
                    IconButton(
                      onPressed: (){
                        setState(() {
                          widget.items.remove(widget.removescanBar);
                        });
                      },icon: Icon(Icons.delete),
                    ),
                    IconButton(
                        onPressed:() {
                          setState(() {
                                addcount = widget.countcart +  widget.countcart;
                          });
                        },icon: Icon(Icons.add),
                        ),
                    IconButton(
                      onPressed:() {
                        setState(() {
                          if(widget.countcart!=null) {
                            mincount = widget.countcart - widget.countcart;
                          }
                        });
                      },icon: Icon(Icons.minimize),
                    ),
                    Text("${addcount}"),
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

    );

  }
  // void getTotal(a){
  //   // print(total);
  //   total=0;
  //   total+=widget.countcart*1;
  //   return total;
  // }
}
