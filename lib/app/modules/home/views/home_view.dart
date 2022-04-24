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
            //Text(""+controller.attendanceModel.value.data!.length.toString()),

            Expanded(
              child: SingleChildScrollView(
                child: Expanded(child: LeftSideDesktopView()),
              ),
            )
          ],
        ),
      ),
    );
  }
}
