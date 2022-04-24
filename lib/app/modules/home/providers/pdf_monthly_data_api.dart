

import 'dart:io';

import 'package:pdf_templet_creator/app/modules/home/providers/pdf_api.dart';



import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';

import '../models/monthly_attendance_3.dart';

class PdfMonthlyDataApi{
  static Future<File> generate (MonthlyGroup3 monthlyAttendance) async {

    final pdf = Document();


    pdf.addPage(MultiPage(
      maxPages: 10000000,
      pageFormat: PdfPageFormat.a4,
      build: (context) => [
        Container(
          width: double.infinity,
          //color: backgroundColor2,
          padding: EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment:
            MainAxisAlignment
                .spaceEvenly,
            children: [
              Expanded(
                flex: 1,
                child: Container(child: Text("Date",)),
              ),
              Expanded(
                flex: 1,
                child: Container(child: Text("Day",)),
              ),
              Expanded(
                flex: 1,
                child: Container(child: Text("In Time")),
              ),
              Expanded(
                flex: 1,
                child: Container(child: Text("Out Time")),
              ),
              Expanded(
                flex: 1,
                child: Container(child: Text("Status")),
              ),
            ],
          ),
        ),
        // Text(""+monthlyAttendance.data![0]![1]![1].employeeId.toString()), ///working line

        ListView.builder(
          // shrinkWrap: true,

            itemCount: monthlyAttendance.data!.length,
            itemBuilder: (context, index1) {
              return Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Container(
                    // color: monthlyAttendance
                    //     .data![index]
                    //     .isPresent
                    //     .toString() ==
                    //     "1"?PdfColors.white:PdfColors.red,
                    child:
                    ListView.builder(
                      itemCount: monthlyAttendance.data![index1]!.length,
                        itemBuilder: (context, index2){
                        return Container(
                          child: ListView.builder(
                            itemCount: monthlyAttendance.data![index1]![index2]!.length,
                              itemBuilder: (context, index3){

                              return Container(
                                child: Text(""+
                                    monthlyAttendance.data![index1]![index2]![index3].employeeId.toString())
                              );
                        }, )
                        );
                        },
                        )
                  ),

              );
            }),
      ],
      //footer: (context)=> buildFooter(invoice),
    ));


    return PdfApi.saveDocument(name: 'my_invoice.pdf', pdf: pdf);

  }
}