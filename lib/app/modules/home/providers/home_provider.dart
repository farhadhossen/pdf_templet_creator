import 'dart:io';

import 'package:get/get.dart';
import 'package:open_file/open_file.dart';

import '../models/attendance_monthly_model.dart';

class HomeProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = 'YOUR-API-URL';
  }


  final String BASE_URL = 'http://172.16.154.13/rdtl-hrm/api/';

  Future<MonthlyAttendance?> fetchMonthlyAttendance() async {

    // final prefs = await SharedPreferences.getInstance();
    // final String? logInToken = prefs.getString('token');
    // final int? employeeId = prefs.getInt("employee_id");

    final String? logInToken = "95|Dnl96dmTGkeAI98vnIuZmxl6fH54YJFOmZwboBxB";
    final int? employeeId = 310;

    // print("====>>>>login "+logInToken!+"===>login"+employeeId!.toString());

    DateTime date = DateTime.now();

    var userDataforMonthAttendance = new Map();
    userDataforMonthAttendance['employee_id'] = employeeId;
    userDataforMonthAttendance['date'] = date.toString();

    // final prefs = await SharedPreferences.getInstance();
    // final String? logInToken = prefs.getString('token');
    // final int? emp_id = prefs.getInt("employee_id");

    // print("====>>>>login"+logInToken!+"===>login"+employeeId!.toString());

    var response = await post(
        BASE_URL+'get-specific-user-attendance-data',
        userDataforMonthAttendance,
        headers: {'Authorization': 'Bearer $logInToken'});
    // print(response.statusCode.toString());

    if (response.statusCode == 200) {
      var jsonString = response.body;
      //print(jsonString);
      return MonthlyAttendance.fromJson(jsonString);
    } else {
      return null;
    }
  }
}
