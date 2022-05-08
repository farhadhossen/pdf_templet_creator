import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';
import '../providers/pdf_monthly_data_api_fluttter_widget.dart';
import 'components/nameAndTitleWidget_flutter.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title: Text('HomeView'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                controller.getMonthlyAttendance();
                // controller.chooseDate();
              }, child: Text("Click Me"),

            ),

            // Obx(()=>Text(""+controller.listData.value.data![0]![2]![0].employeeId.toString())),
            //Text(""+controller.attendanceModel.value.data!.length.toString()),

            //LeftSideDesktopView(),

            Obx(()=>
              controller.listData.value.success.isNull?Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(top: 20),
                  child: const CircularProgressIndicator()
              ):
                  // Text(""+controller.listData.value.data!.length.toString())
              Expanded(
                flex: 1,
                child: controller.listData.value.data![0]!.length <=0
                    ?Text("empty"):

                     SingleChildScrollView(

                       child: Container(


                           child: SingleChildScrollView(
                             child: ListView.builder(
                               shrinkWrap: true,
                               itemCount: controller.listData.value.data![0]!.length,
                                 itemBuilder:(context1, index1){{
                                   return
                                     // Text("hi"+index1.toString());
                                     // Text("hi"+(controller.listData.value.data![0]![0]!).toString());
                                   ///ei porjonto thik ache
                                   // ListView.builder(
                                   //   shrinkWrap: true,
                                   //     itemCount: controller.listData.value.data![0]![index1]!.length,
                                   //     itemBuilder: (context2, index2){
                                   //       return
                                   //         // Text("Hi "+index1.toString()+" - "+index2.toString()
                                   //         Text("Hi "+controller.listData.value.data![0]![index1]![index2]!.employeeId.toString()
                                   //
                                   //         );
                                   //     });
                                   ///ei tuk o thik che
                                     ListView.builder(
                                       shrinkWrap: true,

                                         itemCount: controller.listData.value.data![0]![index1]!.length,

                                         itemBuilder: (context2, index2) {
                                           return Padding(
                                             padding: const EdgeInsets.all(2.0),
                                             child: Container(
                                               color:

                                               controller.listData.value.data![0]![index1]![index2]!.isPresent
                                                   .toString() ==
                                                   "1"?
                                               (controller.listData.value.data![0]![index1]![index2]!.isLate == "N/A"?
                                               ((controller.listData.value.data![0]![index1]![index2]!.day == "Friday"?
                                               Colors.lightBlueAccent:
                                               Colors.white)):Colors.orangeAccent)
                                                   :
                                               (controller.listData.value.data![0]![index1]![index2]!.day == "Friday"?
                                               Colors.white:
                                               Colors.red),
                                               child: Row(
                                                 children: [

                                                   Expanded(child:
                                                   Column(
                                                       children: [



                                                         ((index2-1) == -1? NameAndTitle(""+controller.listData.value.data![0]![index1]![index2]!.userFullName.toString()
                                                             +"\n"+
                                                             "Employee Id : "+controller.listData.value.data![0]![index1]![index2]!.employeeId.toString())
                                                             :controller.listData.value.data![0]![index1]![index2]!.userFullName
                                                             != controller.listData.value.data![0]![index1]![index2-1]!.userFullName ?
                                                         NameAndTitle(""+controller.listData.value.data![0]![index1]![index2]!.userFullName.toString()+"\n"+
                                                             "Employee Id : "+controller.listData.value.data![0]![index1]![index2]!.employeeId.toString())
                                                             : Container()),

                                                         Row(
                                                             children: [

                                                               Expanded(
                                                                 flex: 1,
                                                                 child: Container(
                                                                     child: Text(""+


                                                                         controller.listData.value.data![0]![index1]![index2]!
                                                                             .date
                                                                             .toString()



                                                                       ,
                                                                     )),

                                                               ),
                                                               Expanded(
                                                                 flex: 1,
                                                                 child: Container(

                                                                     child: Text(""+

                                                                         controller.listData.value.data![0]![index1]![index2]!
                                                                             .day
                                                                             .toString(),
                                                                     )),

                                                               ),
                                                               Expanded(
                                                                 flex: 1,
                                                                 child: Container(

                                                                   child: controller.listData.value.data![0]![index1]![index2]!
                                                                       .inTime
                                                                       ==
                                                                       null?
                                                                   Text('N/A',
                                                                   ):
                                                                   Text(""+

                                                                       controller.listData.value.data![0]![index1]![index2]!
                                                                           .inTime
                                                                           .toString(),

                                                                   ),

                                                                 ),
                                                               ),
                                                               Expanded(
                                                                 flex: 1,
                                                                 child: Container(

                                                                   child: controller.listData.value.data![0]![index1]![index2]!
                                                                       .outTime
                                                                       ==
                                                                       null?
                                                                   Text('N/A',):
                                                                   Text(""+

                                                                       controller.listData.value.data![0]![index1]![index2]!
                                                                           .outTime
                                                                           .toString()),



                                                                 ),
                                                               ),
                                                               Expanded(
                                                                 flex: 1,
                                                                 child: Container(

                                                                     child:
                                                                     controller.listData.value.data![0]![index1]![index2]!
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
                           ),
                       ),
                     )

              )

            )


          ],
        ),
      ),
    );
  }
}
