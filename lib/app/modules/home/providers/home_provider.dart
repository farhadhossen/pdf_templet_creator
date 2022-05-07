import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import 'package:open_file/open_file.dart';
import 'package:pdf_templet_creator/app/modules/home/models/emdata.dart';


import '../models/monthly_attendance_3.dart';

import 'package:http/http.dart' as http;

class HomeProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = 'YOUR-API-URL';
  }


  final String BASE_URL = 'http://172.16.154.13/rdtl-hrm/api/';

  Future<MonthlyGroup3?> fetchMonthlyAttendance() async {

    // final prefs = await SharedPreferences.getInstance();
    // final String? logInToken = prefs.getString('token');
    // final int? employeeId = prefs.getInt("employee_id");

    final String? logInToken = "95|Dnl96dmTGkeAI98vnIuZmxl6fH54YJFOmZwboBxB";
    final int? employeeId = 310;

    print("====>>>>login "+logInToken!+"===>login"+employeeId!.toString());

    DateTime date = DateTime.now();

    var userDataforMonthAttendance = new Map();
    userDataforMonthAttendance['employee_id'] = employeeId;
    userDataforMonthAttendance['date'] = "01-01-2022";

    // final prefs = await SharedPreferences.getInstance();
    // final String? logInToken = prefs.getString('token');
    // final int? emp_id = prefs.getInt("employee_id");

    // print("====>>>>login"+logInToken!+"===>login"+employeeId!.toString());

    var response = await post(
        BASE_URL+'get-all-user-specific-month-attendance-data-grouped',
        userDataforMonthAttendance,
        headers: {'Authorization': 'Bearer $logInToken'});
    print("my response code"+response.statusCode.toString());



    if (response.statusCode == 200) {
      var jsonString = response.body;
      print(jsonString);
      return MonthlyGroup3.fromJson(jsonString);
    } else {
      return null;
    }
  }


  Future getData() async {


    final date = new Map();
    date['date'] = "01-01-2022";

    var apiUrl = Uri.parse("http://172.16.154.13/rdtl-hrm/api/get-all-user-specific-month-attendance-data-grouped");
    var response = await http.post(apiUrl, headers: {
      'Authorization': 'Bearer ${"95|Dnl96dmTGkeAI98vnIuZmxl6fH54YJFOmZwboBxB"}'},
        body: {"date": "01-01-2022"});
    if (response.statusCode == 200) {

      var DataList = json.decode(response.body);

      print(">>"+DataList['success'].toString());


      return MonthlyGroup3.fromJson(DataList);

    } else {
      print('error');
    }
  }
}
