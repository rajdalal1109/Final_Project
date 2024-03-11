class LoginData {
  String? message;
  String? data;
  bool? sTATUS;

  LoginData({this.message, this.data, this.sTATUS});

  LoginData.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'];
    sTATUS = json['STATUS'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['data'] = this.data;
    data['STATUS'] = this.sTATUS;
    return data;
  }
}
