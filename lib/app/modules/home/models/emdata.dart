// To parse this JSON data, do
//
//     final everyoneMonthlyData = everyoneMonthlyDataFromJson(jsonString);

import 'dart:convert';

List<List<EveryoneMonthlyData>> everyoneMonthlyDataFromJson(String str) => List<List<EveryoneMonthlyData>>.from(json.decode(str).map((x) => List<EveryoneMonthlyData>.from(x.map((x) => EveryoneMonthlyData.fromJson(x)))));

String everyoneMonthlyDataToJson(List<List<EveryoneMonthlyData>> data) => json.encode(List<dynamic>.from(data.map((x) => List<dynamic>.from(x.map((x) => x.toJson())))));

class EveryoneMonthlyData {
  EveryoneMonthlyData({
    this.employeeId,
    this.userFullName,
    this.id,
    this.inTime,
    this.isLate,
    this.isPresent,
    this.outTime,
    this.date,
    this.day,
    this.isHoliday,
  });

  int? employeeId;
  String? userFullName;
  int? id;
  String? inTime;
  String? isLate;
  int? isPresent;
  String? outTime;
  String? date;
  String? day;
  bool? isHoliday;

  factory EveryoneMonthlyData.fromJson(Map<String, dynamic> json) => EveryoneMonthlyData(
    employeeId: json["employee_id"],
    userFullName: json["user_full_name"],
    id: json["id"],
    inTime: json["in_time"],
    isLate: json["is_late"],
    isPresent: json["is_present"],
    outTime: json["out_time"],
    date: json["date"],
    day: json["day"],
    isHoliday: json["isHoliday"],
  );

  Map<String, dynamic> toJson() => {
    "employee_id": employeeId,
    "user_full_name": userFullName,
    "id": id,
    "in_time": inTime,
    "is_late": isLate,
    "is_present": isPresent,
    "out_time": outTime,
    "date": date,
    "day": day,
    "isHoliday": isHoliday,
  };
}
