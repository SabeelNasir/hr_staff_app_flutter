class LeavesModel {
  String leaveFromDate;
  String leaveToDate;
  String leaveName;
  String description;
  LeavesModel({
    this.leaveFromDate,
    this.leaveToDate,
    this.leaveName,
    this.description,
  });

  factory LeavesModel.fromJson(Map<String, dynamic> json) {
    return LeavesModel(
      leaveFromDate: json['leaveFromDate'],
      leaveToDate: json['leaveToDate'],
      leaveName: json['leaveName'],
      description: json['description'],
    );
  }
}
