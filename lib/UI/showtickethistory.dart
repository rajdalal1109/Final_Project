import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:BusBuddy/model/tickethistorymodel.dart';

class ShowTicketHistory extends StatefulWidget {
  String? cid;
  String? date;

  ShowTicketHistory({this.cid, this.date});

  @override
  State<ShowTicketHistory> createState() => _ShowTicketHistoryState();
}

class _ShowTicketHistoryState extends State<ShowTicketHistory> {
  Future<List<TicketHistoryM>> getTicketHistory() async {
    var res = await http.post(
        Uri.parse(
            'https://busbooking.bestdevelopmentteam.com/Api/userhistory.php'),
        body: jsonEncode(
            {"cid": widget.cid.toString(), "date": widget.date.toString()}),
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
    print(widget.date);
    print(widget.cid);
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
        future: getTicketHistory(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          } else if (snapshot.data!.isEmpty) {
            return Text('Tickets on available on this date');
          } else {
            return ListView.builder(
              shrinkWrap: true,
              itemBuilder: (context, index) {
                final tData = snapshot.data![index];
                return Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(tData.busname.toString()),
                      Text(tData.start.toString()),
                      Text(tData.end.toString()),
                      Text(tData.amount.toString()),
                      Text(tData.reportingTime.toString()),
                      Text(tData.depatureTime.toString()),
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: tData.passenger!.length,
                        itemBuilder: (context, index) {
                          final pdetail = tData.passenger![index];
                          return Column(
                            children: [
                              Text('Name:${pdetail.name.toString()}'),
                              Text('SeatNo:${pdetail.seatno.toString()}'),
                            ],
                          );
                        },
                      )
                    ],
                  ),
                );
              },
              itemCount: snapshot.data!.length,
            );
          }
        },
      ),
    );
  }
}
