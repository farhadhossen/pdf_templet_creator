

import 'dart:io';

import 'package:intl/intl.dart';
import 'package:pdf_templet_creator/app/modules/home/providers/pdf_api.dart';

import '../models/attendace_month_group.dart';
import '../models/attendance_monthly_model.dart';

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';

class PdfMonthlyDataApi{
  static Future<File> generate (MonthlyAttendanceGrouped monthlyAttendance) async {

    final pdf = Document();


    pdf.addPage(MultiPage(
      maxPages: 10000,
      pageFormat: PdfPageFormat.a4,
      build: (context) => [

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

                        Expanded(child:
                        Column(
                          children: [



                            ((index-1) == -1? NameAndTitle(""+monthlyAttendance.data![index].userFullName.toString())
                                :monthlyAttendance.data![index].userFullName
                                != monthlyAttendance.data![(
                                    (index-1)
                                )].userFullName ?
                            NameAndTitle(""+monthlyAttendance.data![index].userFullName.toString())
                                : Container()),

                            Row(
                              children: [

                                Expanded(
                                  flex: 1,
                                  child: Container(
                                      child: Text(""+

                                          DateFormat('dd-MM-yyyy').format(DateTime.parse(
                                              monthlyAttendance
                                              .data![index]
                                              .inTime
                                              .toString()))



                                        ,
                                        )),

                                ),
                                Expanded(
                                  flex: 1,
                                  child: Container(

                                      child: Text(""+
                                          DateFormat('EEEE').format(DateTime.parse(""+
                                              monthlyAttendance
                                                  .data![index]
                                                  .inTime
                                                  .toString())),
                                        )),

                                ),
                                Expanded(
                                  flex: 1,
                                  child: Container(

                                      child: monthlyAttendance
                                          .data![index]
                                          .inTime
                                          .toString() ==
                                          'N/A'?
                                      Text('N/A',
                                      ):
                                      Text(""+
                                          DateFormat('H:m').format(DateTime.parse(""+monthlyAttendance
                                              .data![index]
                                              .inTime
                                              .toString() )



                                        ,

                                        )
                                  ),

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
                                      Text('N/A',):
                                      Text(""+
                                          DateFormat('H:m').format(DateTime.parse(""+ monthlyAttendance
                                              .data![index]
                                              .outTime
                                              .toString())


                                        ,
                                        )
                                  ),



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
                                        ):
                                      Text("Absent",
                                        )),

                                ),
                              ]
                            )
                          ]
                        ),


                        )




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

Widget NameAndTitle(String name){


  return
  Container(
    width: double.infinity,
    color: PdfColors.white,
    child: Column(
        children: [

          Text("Radisson Digital Technologies Limited",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight:FontWeight
                      .bold
              )),


          Text(""+name),

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
                  child:  Text("Date",
                    style: TextStyle(
                        color: PdfColors.black,
                        fontWeight:
                        FontWeight
                            .bold),)
                ),
                Expanded(
                  flex: 1,
                  child: Text("Day",
                    style: TextStyle(
                        color: PdfColors.black,
                        fontWeight:
                        FontWeight
                            .bold),)
                ),
                Expanded(
                  flex: 1,
                  child:  Text("In Time",
                    style: TextStyle(
                        color: PdfColors.black,
                        fontWeight:
                        FontWeight
                            .bold),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Text("Out Time",
                    style: TextStyle(
                        color: PdfColors.black,
                        fontWeight:
                        FontWeight
                            .bold),)

                ),
                Expanded(
                  flex: 1,
                  child: Text("Status"),
                ),
              ],
            ),
          ),
        ]

    )
  );
}