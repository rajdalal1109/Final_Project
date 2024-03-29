

import 'dart:convert';

import 'package:BusBuddy/utils/global_function.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:BusBuddy/UI/confirm_ticket.dart';
import 'package:BusBuddy/model/seatselect.dart';
import 'package:BusBuddy/utils/appcolor.dart';

class ShowPassenger extends StatefulWidget {
  List<SeatSel> addPasengers = [];
  String? cId;
  String? date;
  String? start;
  String? end;
  String? busId;
  String? price;

  ShowPassenger(
      {this.start,
        this.end,
        this.busId,
        this.price,
        super.key,
        required this.addPasengers,
        this.cId,
        this.date});

  @override
  State<ShowPassenger> createState() => _ShowPassengerState();
}

class _ShowPassengerState extends State<ShowPassenger> {
  // List<SubmitData> submitData = [];
  String?ticket;
  submitUserData() async {
    var body = {
      "passenger_data": List.generate(
          widget.addPasengers.length,
              (index) => {
            "name": widget.addPasengers[index].name.text,
            "gender": widget.addPasengers[index].selecctRadio,
            "age": widget.addPasengers[index].age.text,
            "seatid": widget.addPasengers[index].seatNo,


          }),
      "price": widget.price,
      "start": widget.start,
      "busid": widget.busId,
      "date": widget.date,
      "end": widget.end,
      "cid": GlobalFunction.userProfile.cid.toString(),
    };
    print('ADDED DATA________${body}');

    try {
      var res = await http.post(
          Uri.parse(
              'https://busbooking.bestdevelopmentteam.com/Api/passenger.php'),
          body: jsonEncode(body),
          headers: {'Content-Type': 'application/json'});
      if (res.statusCode == 200 || res.statusCode == 201) {
        print('RESPONSE__________________${res.body}');
        var data=jsonDecode(res.body);
        setState(() {
          ticket = data['ticketno'];
        });
        Navigator.push(context, MaterialPageRoute(builder: (context) => ConfirmTickets(ticketNo: ticket.toString(),cId: widget.cId.toString(),),));
      } else {
        throw ('Error');
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    print('CID On SUbmitPassen::::${widget.cId}');
    print('ticket On SUbmitPassen::::${ticket}');

    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.primary,
          surfaceTintColor: AppColors.primary,
          title: Text("Show Details",style: TextStyle(color: Colors.white),),
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: widget.addPasengers.length,
                itemBuilder: (context, index) {
                  final data = widget.addPasengers[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(5),
                              child: Text('Pasenger No : ${index + 1}'),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5),
                              child: Text('Name : ${data.name.text}'),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5),
                              child: Text('Age : ${data.age.text}'),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5),
                              child: Text('Gender : ${data.selecctRadio}'),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5),
                              child: Text('SeatNo : ${data.seatNo}'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: (){
                  submitUserData();
                },
                child: Container(
                  width: 300,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.primary,
                  ),
                  child: Center(
                      child: Text(
                        "Confirm to Book!!",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.w500),
                      )
                  ),
                ),
              ),
            ),
          ],
        )
    );
  }
}

