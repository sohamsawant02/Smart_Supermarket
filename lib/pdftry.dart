import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pdf/pdf.dart';
import 'package:flutter/services.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:flutter/cupertino.dart';
import 'package:dynamiclist/Tabtry.dart';
buildprintabledata(image,tot)=>pw.Padding(
    padding: const pw.EdgeInsets.all(25.00),
    child: pw.Column(
    children: [
      pw.SizedBox(
      height: 70,
      ),
      pw.Text("Fast supermarket checkout",style: pw.TextStyle(
            fontSize: 30,
            fontWeight: pw.FontWeight.bold,
            color: PdfColors.black,
      ),),
      pw.Divider(
        color: PdfColors.black,
        thickness: 3,
      ),
          // pw.Image(image:'assets/images/payment_success_icon.png'),
      pw.Image(
            image,
            width: 200,
            height: 200,
      ),
      pw.Text("Payment Successful",style: pw.TextStyle(
      fontSize: 30,
      fontWeight: pw.FontWeight.bold,
      color: PdfColors.green,
      ),),
      pw.SizedBox(
            height: 10
      ),
      pw.Text("Paid:Rs.${tot}",style: pw.TextStyle(
      fontSize: 30,
      fontWeight: pw.FontWeight.bold,
      ),),
          pw.SizedBox(
              height: 10
          ),
      pw.Text("Thank you for shopping with us",style: pw.TextStyle(
      fontSize: 25,
      fontWeight: pw.FontWeight.bold,
      ),),
      pw.Divider(
      color: PdfColors.black,
      thickness: 3,
      ),
  ]
    )
);