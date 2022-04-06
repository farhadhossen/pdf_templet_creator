import 'package:get/get.dart';
import 'package:pdf_templet_creator/app/modules/home/providers/pdf_api.dart';

import '../models/invoice.dart';
import '../providers/pdf_invoice_api.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;

  invoiceFunction() async {

    final invoice = Invoice(
      supplier: Supplier(
        name: 'Farhad',
        address: 'Keraniganj',
        paymentInfo: "Paid"
      ),
      customer: Customer(
        name: 'Apple Inc.',
        address: "USA"
      ),
      info: InvoiceInfo(
        date: "12-12-12",
        dueDate: "13-13-13"
      ),
      items: [
        InvoiceItem(
            description: "description",
            date: "date",
            quantity: 5,
            vat: 0.99,
            unitPrice: 0.33),
        InvoiceItem(
            description: "description",
            date: "date",
            quantity: 5,
            vat: 0.99,
            unitPrice: 0.33),
        InvoiceItem(
            description: "description",
            date: "date",
            quantity: 5,
            vat: 0.99,
            unitPrice: 0.33),
        InvoiceItem(
            description: "description",
            date: "date",
            quantity: 5,
            vat: 0.99,
            unitPrice: 0.33),
      ]
    );
    final pdfFile = await PdfInvoiceApi.generate(invoice);

    PdfApi.openFile(pdfFile);

    // final invoice = Invoice(
    //
    // );

  }
}
