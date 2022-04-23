import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pdf_templet_creator/app/modules/home/providers/pdf_api.dart';

import '../models/attendace_month_group.dart';
import '../models/attendance_monthly_model.dart';
import '../models/invoice.dart';
import '../providers/home_provider.dart';
import '../providers/pdf_invoice_api.dart';
import '../providers/pdf_monthly_data_api.dart';
import 'package:intl/intl.dart';


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


  var monthlyAttendanceGrouped = MonthlyAttendanceGrouped().obs;
  var attendanceList = List<MonthlyAttendanceGrouped>.empty(growable: true).obs;

  Future<void> getMonthlyAttendance() async {
    try{

      var attendance = await HomeProvider().fetchMonthlyAttendance();
      // print("ki ailo? "+attendance!.data.toString());
      if (attendance != null) {
        // print("hellooww:: "+attendance.toString());
        monthlyAttendanceGrouped.value = attendance;
        attendanceList.add(attendance);
        // print("===>"+attendanceList.toString());
      }
    }
    finally{

      //print(""+monthlyAttendanceGrouped.value.toString());

      final pdfFile = await PdfMonthlyDataApi.generate(monthlyAttendanceGrouped.value);


      PdfApi.openFile(pdfFile);

      // print( DateFormat('EEEE').format(DateTime.parse("2022-01-01 18:19:07")));
      // print( DateFormat('dd-MM-yyyy').format(DateTime.parse("2022-01-01 18:19:07")));
      // print( DateFormat('H:m').format(DateTime.parse("2022-01-01 18:19:07")));

    }

  }

  chooseDate() async{




    DateTime? pickedDate = await showDatePicker(
        context: Get.context!,
        initialDate: DateTime.now(),
        firstDate: DateTime(2010),
        lastDate: DateTime(2025),
        builder: (context,widget) => Theme(
          data: ThemeData().copyWith(
              colorScheme: ColorScheme.dark(
                  surface: Colors.purple
              ),
              dialogBackgroundColor: Colors.deepPurpleAccent
          ),
          child: widget!,
        )
    );

    if(pickedDate!=null && pickedDate != DateTime.now()){
      // print("selectedDate 2 "+selectedDate.value.toString());
      final selectedDate = pickedDate;
      // print("selectedDate 3 "+selectedDate.value.toString());
    }
  }
}
