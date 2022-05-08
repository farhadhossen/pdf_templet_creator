import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';
import '../providers/pdf_monthly_data_api_fluttter_widget.dart';

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
                         height: 900,
                         color: Colors.redAccent,
                           child: SingleChildScrollView(
                             child: ListView.builder(
                               shrinkWrap: true,
                               itemCount: controller.listData.value.data![0]!.length,
                                 itemBuilder:(context1, index1){{
                                   return
                                     // Text("hi"+index1.toString());
                                     // Text("hi"+(controller.listData.value.data![0]![0]!).toString());
                                   ///ei porjonto thik ache
                                   ListView.builder(
                                     shrinkWrap: true,
                                       itemCount: controller.listData.value.data![0]![index1]!.length,
                                       itemBuilder: (context2, index2){
                                         return
                                           // Text("Hi "+index1.toString()+" - "+index2.toString()
                                           Text("Hi "+controller.listData.value.data![0]![index1]![index2]!.employeeId.toString()

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
