class LeavesModel {
  String leaveFromDate;
  String leaveToDate;
  String leaveName;
  String description;
  int leaveDays;
  LeavesModel({
    this.leaveFromDate,
    this.leaveToDate,
    this.leaveName,
    this.description,
    this.leaveDays,
  });

  factory LeavesModel.fromJson(Map<String, dynamic> json) {
    return LeavesModel(
      leaveFromDate: json['leave_from_date'],
      leaveToDate: json['leave_to_date'],
      leaveName: json['leave_name'],
      description: json['description'],
      leaveDays: json['leave_days'],
    );
  }
}
