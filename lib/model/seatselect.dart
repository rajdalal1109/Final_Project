import 'package:flutter/src/widgets/editable_text.dart';

class SeatSel {
  int? seatNo;
  bool? bookedStatus;
  bool? userSelected;

  SeatSel({this.seatNo, this.bookedStatus, this.userSelected, required TextEditingController name, required TextEditingController age});

  SeatSel.fromJson(Map<String, dynamic> json) {
    seatNo = json['seatNo'];
    bookedStatus = json['BookedStatus'];
    userSelected = json['userSelected'] ?? false;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['seatNo'] = this.seatNo;
    data['BookedStatus'] = this.bookedStatus;
    data['userSelected'] = this.userSelected;
    return data;
  }
}