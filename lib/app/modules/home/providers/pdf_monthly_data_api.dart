

import 'dart:convert';
import 'dart:io';

import 'package:pdf_templet_creator/app/modules/home/providers/pdf_api.dart';



import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';

import '../constant.dart';
import '../models/monthly_attendance_3.dart';

import 'package:http/http.dart' as http;

class PdfMonthlyDataApi{
  static Future<File> generate (List AllDataList) async {

    final pdf = Document();

    // List AllDataList =[];
    //
    //
    // Future getData(String url,String date) async {
    //
    //   var apiUrl = Uri.parse(url);
    //   var response = await http.post(apiUrl, headers: {
    //     'Authorization': 'Bearer ${Constants.API_KEY}'},
    //       body: {"date": date});
    //   if (response.statusCode == 200) {
    //
    //     List DataList = json.decode(response.body)['data'][0];
    //
    //
    //       AllDataList = DataList.expand((x) => x).toList();
    //   ;
    //
    //   } else {
    //     print('error');
    //   }
    // };
    //
    //  await getData(Constants.API_URL, "01-01-2022");


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

        ListView.builder(
          itemCount: AllDataList.length,
          itemBuilder: (context,index){
            return Container(


              child: Row(
                mainAxisAlignment:
                MainAxisAlignment
                    .spaceEvenly,
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(child: Text(""+AllDataList[index]["date"].toString(),)),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(child: Text(""+AllDataList[index]["day"].toString(),)),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(child: Text(""+AllDataList[index]["in_time"].toString())),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(child: Text(""+AllDataList[index]["out_time"].toString())),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(child: Text(""+AllDataList[index]["is_present"].toString())),
                  ),
                ],
              ),

              // child: Text(
              //     "employee_id : ${AllDataList[index]["employee_id"]}"+"\n"+
              //         "in_time : ${AllDataList[index]["in_time"]}"+"\n"+
              //         "is_late : ${AllDataList[index]["is_late"]}"+"\n"+
              //         "is_present : ${AllDataList[index]["is_present"]}"+"\n"+
              //         "out_time : ${AllDataList[index]["out_time"]}"+"\n"+
              //         "date : ${AllDataList[index]["date"]}"+"\n"+
              //         "day : ${AllDataList[index]["day"]}"+"\n"+
              //         "isHoliday : ${AllDataList[index]["isHoliday"]}"
              //
              // ),

            );
          },

        ),


        // Container(
        //   width: double.infinity,
        //   //color: backgroundColor2,
        //   padding: EdgeInsets.all(10),
        //   child: Row(
        //     mainAxisAlignment:
        //     MainAxisAlignment
        //         .spaceEvenly,
        //     children: [
        //       Expanded(
        //         flex: 1,
        //         child: Container(child: Text("Date",)),
        //       ),
        //       Expanded(
        //         flex: 1,
        //         child: Container(child: Text("Day",)),
        //       ),
        //       Expanded(
        //         flex: 1,
        //         child: Container(child: Text("In Time")),
        //       ),
        //       Expanded(
        //         flex: 1,
        //         child: Container(child: Text("Out Time")),
        //       ),
        //       Expanded(
        //         flex: 1,
        //         child: Container(child: Text("Status")),
        //       ),
        //     ],
        //   ),
        // ),
        // // Text(""+monthlyAttendance.data![0]![1]![1].employeeId.toString()), ///working line
        //
        // ListView.builder(
        //   // shrinkWrap: true,
        //
        //     itemCount: monthlyAttendance.data!.length,
        //     itemBuilder: (context, index1) {
        //       return Padding(
        //           padding: const EdgeInsets.all(2.0),
        //           child: Container(
        //             // color: monthlyAttendance
        //             //     .data![index]
        //             //     .isPresent
        //             //     .toString() ==
        //             //     "1"?PdfColors.white:PdfColors.red,
        //             child:
        //             ListView.builder(
        //               itemCount: monthlyAttendance.data![index1]!.length,
        //                 itemBuilder: (context, index2){
        //                 return Container(
        //                   child: ListView.builder(
        //                     itemCount: monthlyAttendance.data![index1]![index2]!.length,
        //                       itemBuilder: (context, index3){
        //
        //                       return Container(
        //                         child: Text(""+
        //                             monthlyAttendance.data![index1]![index2]![index3].employeeId.toString())
        //                       );
        //                 }, )
        //                 );
        //                 },
        //                 )
        //           ),
        //
        //       );
        //     }),
      ],
      //footer: (context)=> buildFooter(invoice),
    ));


    return PdfApi.saveDocument(name: 'my_invoice.pdf', pdf: pdf);

  }
}

