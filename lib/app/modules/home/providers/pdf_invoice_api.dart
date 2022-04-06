import 'dart:io';

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
        ],
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
      data: data

    );
  }

}