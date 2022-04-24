// To parse this JSON data, do
//
//     final monthlyGroup3 = monthlyGroup3FromJson(jsonString);

import 'dart:convert';

MonthlyGroup3 monthlyGroup3FromJson(String str) => MonthlyGroup3.fromJson(json.decode(str));

String monthlyGroup3ToJson(MonthlyGroup3 data) => json.encode(data.toJson());

class MonthlyGroup3 {
  MonthlyGroup3({
    this.success,
    this.data,
    this.message,
  });

  bool? success;
  List<List<List<Datum>?>?>? data;
  String? message;

  factory MonthlyGroup3.fromJson(Map<String, dynamic> json) => MonthlyGroup3(
    success: json["success"],
    data: List<List<List<Datum>>>.from(json["data"].map((x) => List<List<Datum>>.from(x.map((x) => List<Datum>.from(x.map((x) => Datum.fromJson(x))))))),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "data": List<dynamic>.from(data!.map((x) => List<dynamic>.from(x!.map((x) => List<dynamic>.from(x!.map((x) => x.toJson())))))),
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
  dynamic? isLate;
  dynamic? isPresent;
  String? outTime;
  String? date;
  String? day;
  bool? isHoliday;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    employeeId: json["employee_id"],
    id: json["id"] == null ? null : json["id"],
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
    "id": id == null ? null : id,
    "in_time": inTime,
    "is_late": isLate,
    "is_present": isPresent,
    "out_time": outTime,
    "date": date,
    "day": day,
    "isHoliday": isHoliday,
  };
}


