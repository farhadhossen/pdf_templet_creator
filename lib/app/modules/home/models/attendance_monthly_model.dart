// To parse this JSON data, do
//
//     final monthlyAttendance = monthlyAttendanceFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

MonthlyAttendance monthlyAttendanceFromJson(String str) => MonthlyAttendance.fromJson(json.decode(str));

String monthlyAttendanceToJson(MonthlyAttendance data) => json.encode(data.toJson());

class MonthlyAttendance {
  MonthlyAttendance({
    this.success,
    this.data,
    this.message,
  });

  bool? success;
  List<Datum>? data;
  String? message;

  factory MonthlyAttendance.fromJson(Map<String, dynamic> json) => MonthlyAttendance(
    success: json["success"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
    "message": message,
  };
}

class Datum {
  Datum({
    this.employeeId,
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
  int? id;
  String? inTime;
  String? isLate;
  String? isPresent;
  String? outTime;
  DateTime? date;
  String? day;
  String? isHoliday;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    employeeId: json["employee_id"],
    id: json["id"],
    inTime: json["in_time"],
    isLate: json["is_late"].toString(),
    isPresent: json["is_present"].toString(),
    outTime: json["out_time"],
    date: DateTime.parse(json["date"]),
    day: json["day"],
    isHoliday: json["isHoliday"].toString(),
  );

  Map<String, dynamic> toJson() => {
    "employee_id": employeeId.toString(),
    "id": id.toString(),
    "in_time": inTime,
    "is_late": isLate.toString(),
    "is_present": isPresent.toString(),
    "out_time": outTime,
    "date": "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
    "day": day,
    "isHoliday": isHoliday.toString(),
  };
}

// enum Is { N_A }
//
// final isValues = EnumValues({
//   "N/A": Is.N_A
// });

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map,this.reverseMap);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
