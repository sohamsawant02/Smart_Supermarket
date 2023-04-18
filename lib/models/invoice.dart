import 'package:dynamiclist/Tabtry.dart';
import 'package:dynamiclist/savebutton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Invoice extends StatefulWidget {
  Invoice({required this.total});
  int total=0;
  @override
  State<Invoice> createState() => _InvoiceState();
}

class _InvoiceState extends State<Invoice> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('FSAP',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
          centerTitle: true,
          backgroundColor: Colors.deepPurple,
        ),
        backgroundColor: Colors.grey[300],
        body: Center(
              child: Container(
                padding: EdgeInsets.all(20),
                  height: 600,
                  width: 370,
                  decoration: BoxDecoration(
                      color: Colors.grey[300],
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.shade500,
                            offset: Offset(4.0,4.0),
                            blurRadius: 15.0,
                            spreadRadius: 1.0
                        ),
                        BoxShadow(
                            color: Colors.white,
                            offset: Offset(-4.0,-4.0),
                            blurRadius: 15.0,
                            spreadRadius: 1.0
                        ),

                      ]

                  ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 70,
                    ),
                    Divider(
                      color: Colors.black,
                      thickness: 2,
                    ),
                    Image(image: ResizeImage(AssetImage('assets/images/payment_success_icon.png'), width: 150, height: 150)),
                    Text("Payment Successful",style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),),
                    Text("Paid:Rs.${widget.total}",style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),),
                    Text("Thank you for shopping with us",style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),),
                    Divider(
                      color: Colors.black,
                      thickness: 2,
                    ),
                    SaveButton(total: widget.total),
                    ElevatedButton(
                        onPressed: (){
                          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>TabTry()));
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          foregroundColor: Colors.black
                        ),
                        child: Text("Shop more",style: const TextStyle(fontSize: 20,fontFamily: 'Poppins-reg'),)
                    )


                  ],
                )



              ),
            ),
      ),
    );
  }
}
