class UserModel {
  String token;
  String employeeName;
  String employeeImage;
  String employeeImageName;
  int tTL;

  UserModel(
      {this.token,
      this.employeeName,
      this.employeeImage,
      this.employeeImageName,
      this.tTL});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    json = json['data'];
    return UserModel(
        token: json['token'],
        employeeName: json['employeeName'],
        employeeImage: json['employeeImage'],
        employeeImageName: json['employeeImageName'],
        tTL: json['TTL']);
  }

  Map mapSendBody(username, password) {
    var map = new Map<String, dynamic>();
    map["username"] = username;
    map["password"] = password;
    return map;
  }
}
