// To parse this JSON data, do
//
//     final monthlyAttendanceGrouped = monthlyAttendanceGroupedFromJson(jsonString);

import 'dart:convert';

MonthlyAttendanceGrouped monthlyAttendanceGroupedFromJson(String str) => MonthlyAttendanceGrouped.fromJson(json.decode(str));

String monthlyAttendanceGroupedToJson(MonthlyAttendanceGrouped data) => json.encode(data.toJson());

class MonthlyAttendanceGrouped {
  MonthlyAttendanceGrouped({
    this.success,
    this.data,
    this.message,
  });

  bool? success;
  List<Datum>? data;
  String? message;

  factory MonthlyAttendanceGrouped.fromJson(Map<String, dynamic> json) => MonthlyAttendanceGrouped(
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
    this.id,
    this.employeeId,
    this.isPresent,
    this.inTime,
    this.outTime,
    this.isLate,
    this.userFullName,
    this.userDepartmentName,
  });

  int? id;
  int? employeeId;
  int? isPresent;
  String? inTime;
  String? outTime;
  int? isLate;
  String? userFullName;
  UserDepartmentName? userDepartmentName;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    employeeId: json["employee_id"],
    isPresent: json["is_present"],
    inTime: json["in_time"],
    outTime: json["out_time"] ,
    isLate: json["is_late"],
    userFullName: json["user_full_name"],
    userDepartmentName: userDepartmentNameValues.map![json["user_department_name"]],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "employee_id": employeeId,
    "is_present": isPresent == null ? null : isPresent,
    "in_time": inTime?.toString(),
    "out_time": outTime == null ? null : outTime?.toString(),
    "is_late": isLate == null ? null : isLate,
    "user_full_name": userFullName,
    "user_department_name": userDepartmentNameValues.reverse![userDepartmentName],
  };
}

enum UserDepartmentName { DIGITAL_MARKETING, OPERATION, SOFTWARE, ACCOUNTS, BUSINESS_DEVELOPMENT, GRAPHICS, VAT_TAX, HR_ADMIN, E_COMMERCE, RECEPTIONIST, PS_TO_CHAIRMAN_SIR }

final userDepartmentNameValues = EnumValues({
  "Accounts": UserDepartmentName.ACCOUNTS,
  "Business Development": UserDepartmentName.BUSINESS_DEVELOPMENT,
  "Digital Marketing": UserDepartmentName.DIGITAL_MARKETING,
  "E-commerce": UserDepartmentName.E_COMMERCE,
  "Graphics": UserDepartmentName.GRAPHICS,
  "HR Admin": UserDepartmentName.HR_ADMIN,
  "Operation": UserDepartmentName.OPERATION,
  "PS to Chairman Sir": UserDepartmentName.PS_TO_CHAIRMAN_SIR,
  "Receptionist": UserDepartmentName.RECEPTIONIST,
  "Software": UserDepartmentName.SOFTWARE,
  "Vat Tax": UserDepartmentName.VAT_TAX
});

class EnumValues<T> {
  Map<String, T>? map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    if (reverseMap == null) {
      reverseMap = map?.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}