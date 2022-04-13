import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf_templet_creator/app/modules/home/providers/pdf_api.dart';

import '../models/invoice.dart';

class PdfInvoiceApi{


  static Future<File> generate (Invoice invoice) async {

    final pdf = pw.Document();


    pdf.addPage(pw.MultiPage(
      pageFormat: PdfPageFormat.a4,
        build: (context) => [
          buildTitle(invoice),
          buildInvoice(invoice),
          pw.Divider(),
          buildTotal(invoice),
        ],
      footer: (context)=> buildFooter(invoice),
    ));


    return PdfApi.saveDocument(name: 'my_invoice.pdf', pdf: pdf);

  }

  static pw.Widget buildTitle(Invoice invoice) {
    return pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.Text(
            'Invoice',
            style: pw.TextStyle(fontSize: 24, fontWeight: pw.FontWeight.bold),
          ),
          pw.SizedBox(height: 0.8 * PdfPageFormat.cm),
          pw.Text("invoice.info.description"),
        ]
    );
  }

  static pw.Widget buildInvoice(Invoice invoice){

    final header = [
      'Description',
      'date',
      'Quantity',
      'Vat',
      'Unit Price'
    ];

    final data = invoice.items.map((item) {
      final total = item.unitPrice * item.quantity * (1+item.vat);

      return [
        item.description,
        item.date,
        '${item.quantity}',
        '\$ ${item.unitPrice}',
        '${item.vat} %',
        '\$ ${total.toStringAsFixed(2)}',
      ];
    }).toList();

    return pw.Table.fromTextArray(
        headers: header,
      data: data,
      border: null,
      headerStyle: pw.TextStyle(fontWeight: pw.FontWeight.bold,),
      headerDecoration: pw.BoxDecoration(color: PdfColors.grey300),
      cellHeight: 30,
      cellAlignments: {
          0: pw.Alignment.centerLeft,
          1: pw.Alignment.centerRight,
          2: pw.Alignment.centerRight,
          3: pw.Alignment.centerRight,
          4: pw.Alignment.centerRight,
          5: pw.Alignment.centerRight,
      }


    );
  }

  static pw.Widget buildTotal(Invoice invoice){

    final netTotal = invoice.items
        .map((item) => item.unitPrice * item.quantity)
        .reduce((item1, item2) => item1 + item2);
    final vatPercent = invoice.items.first.vat;
    final vat = netTotal * vatPercent;
    final total = netTotal + vat;

    return pw.Container(
      alignment: pw.Alignment.centerRight,
      child: pw.Row(
        children:[
          pw.Spacer(flex:6),
          pw.Expanded(
              flex: 4,
              child: pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  buildText(
                      title: "Net total",
                      value: netTotal.toStringAsFixed(2),
                      unit: true
                  ),

                  buildText(
                      title: "Vat ${vatPercent}",
                      value: vat.toStringAsFixed(2),
                      unit: true
                  ),
                  pw.Divider(),
                  buildText(
                    title: "Total amount due",
                    value: (total).toStringAsFixed(2),
                    unit: true,
                    titleStyle: pw.TextStyle(
                      fontSize: 14,
                      fontWeight: pw.FontWeight.bold,
                    ),
                  ),
                  pw.SizedBox(height: 2*PdfPageFormat.mm),
                  pw.Container(height: 1, color: PdfColors.grey400),
                  pw.SizedBox(height: 0.5*PdfPageFormat.mm),
                  pw.Container(height: 1, color: PdfColors.grey400),
                ],
              ),
          ),

        ]
      )
    );

  }

  static buildText({
    required String title,
    required String value,
    double width = double.infinity,
    pw.TextStyle? titleStyle,
    bool unit = false,
}){
    final tstyle = titleStyle ?? pw.TextStyle(fontWeight: pw.FontWeight.bold);

    return pw.Container(
      width: width,
      child: pw.Row(
        // crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.Expanded(
              child: pw.Text(
                title, style: tstyle,
              ),
          ),
          pw.Text(value, style: unit? tstyle : null),
        ]
      ),
    );
  }

  static pw.Widget buildFooter(Invoice invoice)=>pw.Column(
    crossAxisAlignment: pw.CrossAxisAlignment.center,
    children: [
      pw.Divider(),
      pw.SizedBox(height: 2*PdfPageFormat.mm),
      buildSimpleText(title: "Address", value: invoice.supplier.address),
      pw.SizedBox(height: 1*PdfPageFormat.mm),
      buildSimpleText(title: "Paypal", value: invoice.supplier.address),
    ]
  );

  static buildSimpleText({required String title, required String value}) {
    final style = pw.TextStyle(fontWeight: pw.FontWeight.bold);

    return pw.Row(
      mainAxisSize: pw.MainAxisSize.min,
      crossAxisAlignment: pw.CrossAxisAlignment.end,
      children: [
        pw.Text(title, style: style,),
        pw.SizedBox(width: 2*PdfPageFormat.mm),
        pw.Text(value),
      ]
    );
  }

}