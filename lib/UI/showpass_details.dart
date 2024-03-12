// import 'package:flutter/material.dart';
// import 'package:project/model/seatselect.dart';
//
// class ShowPassenger extends StatefulWidget {
//   List<SeatSel> addPasengers = [];
//   ShowPassenger({super.key, required this.addPasengers});
//   @override
//   State<ShowPassenger> createState() => _ShowPassengerState();
// }
// class _ShowPassengerState extends State<ShowPassenger> {
//   displayData() {
//     widget.addPasengers.forEach((element) {
//       print(element.name);
//     });
//     setState(() {});
//   }
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     displayData();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(),
//         body: ListView.builder(
//           itemCount: widget.addPasengers.length,
//           itemBuilder: (context, index) {
//             final data = widget.addPasengers[index];
//             return Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Card(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Text('Pasenger No:${index + 1}'),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Text('Name:${data.name.text}'),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Text('Age:${data.age.text}'),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Text('Gender:${data.selecctRadio}'),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Text('SeatNo:${data.seatNo}'),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Text('Status:${data.userSelected}'),
//                     ),
//                   ],
//                 ),
//               ),
//             );
//           },
//         ));
//   }
// }

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:project/UI/confirm_page.dart';
import 'package:project/UI/confirm_ticket.dart';
import 'package:project/model/seatselect.dart';

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
  String? ticket;

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
      "date": widget.date,
      "busid": widget.busId,
      "price": widget.price,
      "start": widget.start,
      "end": widget.end,
      "cid": widget.cId,
    };
    print('ADDED DATA________${jsonEncode(body)}');

    try {
      var res = await http.post(
          Uri.parse(
              'https://busbooking.bestdevelopmentteam.com/Api/passenger.php'),
          body: jsonEncode(body),
          headers: {'Content-Type': 'application/json'});
      if (res.statusCode == 200 || res.statusCode == 201) {
        print('RESPONSE__________________${res.body}');
        var data = jsonDecode(res.body);
        setState(() {
          ticket = data['ticketno'];
        });
        print('TicketNo:${data['ticketno']}');
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ConfirmTicketsF(
                ticketNo: ticket.toString(),
                cId: widget.cId,
              ),
            ));
      } else {
        throw ('Error');
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('CID On SUbmitPassen::::${widget.cId}');
  }

  @override
  Widget build(BuildContext context) {
    print('BUSID on SHow Pass::::${widget.busId}');
    print('PRICE on SHow Pass::::${widget.price}');
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          actions: [TextButton(onPressed: submitUserData, child: Text('data'))],
        ),
        body: ListView.builder(
          itemCount: widget.addPasengers.length,
          itemBuilder: (context, index) {
            final data = widget.addPasengers[index];
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Pasenger No:${index + 1}'),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Name:${data.name.text}'),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Age:${data.age.text}'),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Gender:${data.selecctRadio}'),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('SeatNo:${data.seatNo}'),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Status:${data.userSelected}'),
                    ),
                  ],
                ),
              ),
            );
          },
        ));
  }
}
