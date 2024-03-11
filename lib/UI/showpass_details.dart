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
import 'package:project/model/seatselect.dart';


class ShowPassenger extends StatefulWidget {
  List<SeatSel> addPasengers = [];

  ShowPassenger({super.key, required this.addPasengers});

  @override
  State<ShowPassenger> createState() => _ShowPassengerState();
}

class _ShowPassengerState extends State<ShowPassenger> {
  // List<SubmitData> submitData = [];

  submitUserData() async {
    var body = {
      "data": List.generate(
          widget.addPasengers.length,
              (index) => {
            "name": widget.addPasengers[index].name.text,
            "gender": widget.addPasengers[index].selecctRadio,
            "age": widget.addPasengers[index].age.text,
            "date": "2024/03/18",
            "seatid": widget.addPasengers[index].seatNo,
            "busid": 24,
            "price": 500,
            "start": "surat",
            "end": "mumbai",
            "cid": 203
          })
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
      } else {
        throw ('Error');
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
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