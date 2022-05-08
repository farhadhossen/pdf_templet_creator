

import 'dart:io';

import 'package:intl/intl.dart';
import 'package:pdf_templet_creator/app/modules/home/models/monthly_attendance_3.dart';
import 'package:pdf_templet_creator/app/modules/home/providers/pdf_api.dart';



import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';

class PdfMonthlyDataApi{
  static Future<File> generate (MonthlyGroup3 listData) async {

    final pdf = Document();


    pdf.addPage(MultiPage(
      maxPages: 10000,
      pageFormat: PdfPageFormat.a4,
      build: (context) => [

        ListView.builder(

        itemCount: listData.data![0]!.length,
        itemBuilder:(context1, index1){{
          return

        ListView.builder(
          // shrinkWrap: true,

            itemCount: listData.data![0]![index1]!.length,

            itemBuilder: (context2, index2) {
              return Padding(
                padding: const EdgeInsets.all(2.0),
                child: Container(
                  color: listData.data![0]![index1]![index2]!.isPresent
                      .toString() ==
                      "1"?PdfColors.white:PdfColors.red,
                  child: Row(
                    children: [

                      Expanded(child:
                      Column(
                          children: [



                            ((index2-1) == -1? NameAndTitle(""+listData.data![0]![index1]![index2]!.userFullName.toString())
                                :listData.data![0]![index1]![index2]!.userFullName
                                != listData.data![0]![index1]![index2-1]!.userFullName ?
                            NameAndTitle(""+listData.data![0]![index1]![index2]!.userFullName.toString())
                                : Container()),

                            Row(
                                children: [

                                  Expanded(
                                    flex: 1,
                                    child: Container(
                                        child: Text(""+


                                                listData.data![0]![index1]![index2]!
                                                    .date
                                                    .toString()



                                          ,
                                        )),

                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Container(

                                        child: Text(""+

                                                listData.data![0]![index1]![index2]!
                                                    .day
                                                    .toString(),
                                        )),

                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Container(

                                      child: listData.data![0]![index1]![index2]!
                                          .inTime
                                          ==
                                          null?
                                      Text('N/A',
                                      ):
                                      Text(""+

                                              listData.data![0]![index1]![index2]!
                                                  .inTime
                                                  .toString(),

                                      ),

                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Container(

                                      child: listData.data![0]![index1]![index2]!
                                          .outTime
                                          ==
                                          null?
                                      Text('N/A',):
                                      Text(""+

                                              listData.data![0]![index1]![index2]!
                                                  .outTime
                                                  .toString()),



                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Container(

                                        child:
                                        listData.data![0]![index1]![index2]!
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
            });

        }
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