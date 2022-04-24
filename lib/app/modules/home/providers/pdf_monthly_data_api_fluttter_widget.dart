

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:pdf_templet_creator/app/modules/home/providers/pdf_api.dart';





import '../controllers/home_controller.dart';
import '../models/monthly_attendance_3.dart';

class LeftSideDesktopView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    

    return Obx(()=>ListView.builder(
      // shrinkWrap: true,

        itemCount: controller.attendanceModel.value.data!.length,
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
                  itemCount: controller.attendanceModel.value.data![index1]!.length,
                  itemBuilder: (context, index2){
                    return Container(
                        child: ListView.builder(
                          itemCount: controller.attendanceModel.value.data![index1]![index2]!.length,
                          itemBuilder: (context, index3){

                            return Container(
                                child: Text(""+
                                    controller.attendanceModel.value.data![index1]![index2]![index3].employeeId.toString())
                            );
                          }, )
                    );
                  },
                )
            ),

          );
        }));
  }
}
