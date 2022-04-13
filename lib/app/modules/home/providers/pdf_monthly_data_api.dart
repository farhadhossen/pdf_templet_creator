

import 'dart:io';

import 'package:pdf_templet_creator/app/modules/home/providers/pdf_api.dart';

import '../models/attendance_monthly_model.dart';

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';

class PdfMonthlyDataApi{
  static Future<File> generate (MonthlyAttendance monthlyAttendance) async {

    final pdf = Document();


    pdf.addPage(MultiPage(
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
        ListView.builder(
          // shrinkWrap: true,

            itemCount: monthlyAttendance.data!.length,
            itemBuilder: (context, index) {
              return Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Container(
                    color: monthlyAttendance
                        .data![index]
                        .isPresent
                        .toString() ==
                        "1"?PdfColors.white:PdfColors.red,
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(
                              child: Text(""+
                              monthlyAttendance
                                  .data![index]
                                  .date
                                  .toString()
                                  .substring(2, 10),
                            style: TextStyle(
                                color: PdfColors.black,
                                fontWeight:
                                FontWeight
                                    .bold),)),

                        ),
                        Expanded(
                          flex: 1,
                          child: Container(

                              child: Text(""+
                                  monthlyAttendance
                                      .data![index]
                                      .day
                                      .toString(),
                                style: TextStyle(
                                    color: PdfColors.black,
                                    fontWeight:
                                    FontWeight
                                        .bold),)),

                        ),
                        Expanded(
                          flex: 1,
                          child: Container(

                              child: monthlyAttendance
                                  .data![index]
                                  .inTime
                                  .toString() ==
                                  'N/A'?
                              Text('N/A',style: TextStyle(
                                  color: PdfColors.black,
                                  fontWeight:
                                  FontWeight
                                      .bold),):
                              Text(""+
                                  monthlyAttendance
                                      .data![index]
                                      .inTime
                                      .toString()
                                      .substring(
                                      0, 5),
                                style: TextStyle(
                                    color: PdfColors.black,
                                    fontWeight:
                                    FontWeight
                                        .bold),)
                          ),

                        ),
                        Expanded(
                          flex: 1,
                          child: Container(

                              child: monthlyAttendance
                                  .data![index]
                                  .outTime
                                  .toString() ==
                                  'N/A'?
                              Text('N/A',style: TextStyle(
                                  color: PdfColors.black,
                                  fontWeight:
                                  FontWeight
                                      .bold),):
                              Text(""+
                                  monthlyAttendance
                                      .data![index]
                                      .outTime
                                      .toString()
                                      .substring(
                                      0, 5),
                                style: TextStyle(
                                    color: PdfColors.black,
                                    fontWeight:
                                    FontWeight
                                        .bold),)
                          ),



                        ),
                        Expanded(
                          flex: 1,
                          child: Container(

                              child:
                              monthlyAttendance
                                  .data![index]
                                  .isPresent
                                  .toString() ==
                                  "1"?
                              Text("Present",
                                style: TextStyle(
                                    color: PdfColors.black,
                                    fontWeight:
                                    FontWeight
                                        .bold),):
                              Text("Absent",
                                style: TextStyle(
                                    color: PdfColors.black,
                                    fontWeight:
                                    FontWeight
                                        .bold),)),

                        ),
                      ],
                    ),
                  ),

              );
            }),
      ],
      //footer: (context)=> buildFooter(invoice),
    ));


    return PdfApi.saveDocument(name: 'my_invoice.pdf', pdf: pdf);

  }
}