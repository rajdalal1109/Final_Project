import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:project/models/seatdata.dart';

class SeatSelect extends StatefulWidget {
  String? busID;
  String? date;

  SeatSelect({this.busID, this.date});

  @override
  State<SeatSelect> createState() => _SeatSelectState();
}

class _SeatSelectState extends State<SeatSelect> {
  List<SeatSel> seat = [];

  void _getSeat() async {
    var res = await http.post(
        Uri.parse('https://busbooking.bestdevelopmentteam.com/Api/setas'),
        body: jsonEncode({
          "bus_id": widget.busID.toString(),
          "date": widget.date.toString()
        }),
        headers: {'Content-Type': 'application/json'});
    if (res.statusCode == 200) {
      var data = jsonDecode(res.body);
      seat = (data['seats'] as List).map((e) => SeatSel.fromJson(e)).toList();
      print(res.body);
      print(widget.date);
      print(widget.busID);
      setState(() {});
    } else {}
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getSeat();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(58.0),
        child: Card(
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 1,
              mainAxisSpacing: 1,
              // childAspectRatio:1/2
            ),
            itemCount: seat.length,
            itemBuilder: (context, index) {
              final s = seat[index];
              final color = s.bookedStatus == true ? Colors.grey : Colors.green;
              final selcolor =
                  s.userSelected == true ? Colors.orangeAccent : Colors.green;

              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        if (s.userSelected == false) {
                          setState(() {
                            s.userSelected = true;

                            print(s.userSelected);
                          });
                        } else if (s.userSelected == true) {
                          setState(() {
                            s.userSelected = false;
                            print(s.userSelected);
                          });
                        } else {}
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: s.userSelected == true
                                ? Colors.orangeAccent
                                : color,
                            borderRadius: BorderRadius.circular(10)),
                        width: 50,
                        height: 50,
                        alignment: Alignment.center,
                        child: Text('${s.seatNo.toString()}'),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
