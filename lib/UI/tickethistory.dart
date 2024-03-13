import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:BusBuddy/UI/showtickethistory.dart';
import 'package:BusBuddy/model/tickethistorymodel.dart';


class TicketHistory extends StatefulWidget {
  const TicketHistory({super.key});

  @override
  State<TicketHistory> createState() => _TicketHistoryState();
}

class _TicketHistoryState extends State<TicketHistory> {
  TextEditingController datecontroller = TextEditingController();
  TextEditingController _cid = TextEditingController();

  Future<List<TicketHistoryM>> getTicketHistory() async {
    var res = await http.post(
        Uri.parse(
            'https://busbooking.bestdevelopmentteam.com/Api/userhistory.php'),
        body: jsonEncode(
            {"cid": _cid.toString(), "date": datecontroller.toString()}),
        headers: {'Content-Type': 'application/json'});
    print('RESPONSE FROM DB::::::${res.body}');

    if (res.statusCode == 200) {
      var data = jsonDecode(res.body);
      return (data['tickit'] as List)
          .map((e) => TicketHistoryM.fromJson(e))
          .toList();
    } else {
      throw ('fjdkfnjnf');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              // Date Select
              controller: datecontroller,
              readOnly: true,
              onTap: () async {
                final DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(1990),
                  lastDate: DateTime(2050),
                );
                if (pickedDate != null) {
                  print(pickedDate);
                  String formateDate =
                      DateFormat('dd-MM-yyyy').format(pickedDate);
                  print(formateDate);
                  setState(() {
                    datecontroller.text = formateDate;
                  });
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Please Select Date !!"),
                    ),
                  );
                }
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                prefixIcon: const Icon(Icons.date_range, color: Colors.black),
                labelText: "Day*",
                hintText: "Select Date",
              ),
            ),
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ShowTicketHistory(
                        cid: _cid.text,
                        date: datecontroller.text,
                      ),
                    ));
              },
              child: Text('Ticket History')),
        ],
      ),
    );
  }
}
