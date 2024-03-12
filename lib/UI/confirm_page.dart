import 'dart:convert';

import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:project/UI/homepage_1.dart';

import 'package:project/model/showticketmodel.dart';

class ConfirmTicketsF extends StatefulWidget {
  String? ticketNo;
  String? cId;

  ConfirmTicketsF({this.ticketNo, this.cId});

  @override
  State<ConfirmTicketsF> createState() => _TicketsState();
}

class _TicketsState extends State<ConfirmTicketsF> {
  Future<List<ShowTicket>> displayTicket() async {
    var res = await http.post(
        Uri.parse('https://busbooking.bestdevelopmentteam.com/Api/tickit.php'),
        body: jsonEncode({
          "ticketno": widget.ticketNo.toString(),
        }),
        headers: {'Content-Type': 'application/json'});
    if (res.statusCode == 200 || res.statusCode == 201) {
      print('Ticket REsponse:::::${res.body}');

      var data = jsonDecode(res.body);
      return (data['tickit'] as List)
          .map((e) => ShowTicket.fromJson(e))
          .toList();
    } else {
      throw ('ERRORRR');
    }
  }

  @override
  Widget build(BuildContext context) {
    print('TicketNo on Confir TIcket::::${widget.ticketNo.toString()}');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(255, 98, 96, 1),
      ),
      backgroundColor: Color.fromRGBO(255, 98, 96, 1),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              // color: Colors.redAccent,
              color: Color.fromRGBO(255, 98, 96, 1),
              height: MediaQuery.of(context).size.height * 0.12,
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Booking Confirmed",
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w700,
                              color: Colors.white)),
                      SizedBox(width: 5),
                      // Image.asset("assets/images/confirm.png"),
                      // ImageIcon(AssetImage("assets/images/confirm.png")),
                    ],
                  ),
                  SizedBox(height: 20),
                  Text("We have send you the ticket copy on your E-mail",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.white)),
                  Text("abc@gmail.com",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.white)),
                ],
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.white,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 30, right: 50, left: 50),
                      child: SingleChildScrollView(
                        physics: AlwaysScrollableScrollPhysics(),
                        child: Container(
                            height: MediaQuery.of(context).size.height * 0.6,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: FutureBuilder(
                              future: displayTicket(),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return CircularProgressIndicator();
                                } else if (snapshot.hasError) {
                                  return Text('ERROR :::${snapshot.error}');
                                } else {
                                  return ListView.builder(
                                    itemBuilder: (context, index) {
                                      final ticket = snapshot.data![index];

                                      return Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                              "Bus Name : ${ticket.busname.toString()}"),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Source : ${ticket.start.toString()}",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.w700),
                                              ),
                                              // IconButton(
                                              //   icon: const Icon(Icons.swap_vert,
                                              //       color: Colors.black),
                                              //   onPressed: () {},
                                              // ),
                                              Text(
                                                "Desination : ${ticket.end.toString()}",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.w700),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 15,
                                          ),
                                          Text(
                                              "Day : ${ticket.day.toString()}"),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                              "Arival Time : ${ticket.reportingTime.toString()}"),
                                          Text(
                                              "Desination Time : ${ticket.depatureTime.toString()}"),
                                          SizedBox(
                                            height: 15,
                                          ),
                                          DottedLine(
                                            dashLength: 5,
                                            dashColor: Colors.black,
                                            lineThickness: 2,
                                            dashGapLength: 6,
                                          ),
                                          SizedBox(
                                            height: 15,
                                          ),
                                          Text(
                                            "Ticket No : ${ticket.tickitno.toString()}",
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w700),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          ListView.builder(
                                            itemBuilder: (context, index) {
                                              final passenger =
                                                  ticket.passenger;
                                              return Container(
                                                height: 50,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                        "Passanger Name : ${passenger![index].name.toString()}"),
                                                    Text(
                                                        "Seat No : ${passenger[index].seatno.toString()}")
                                                  ],
                                                ),
                                              );
                                            },
                                            shrinkWrap: true,
                                            itemCount: ticket.passenger!.length,
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            "Price = ${ticket.amount.toString()}",
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w700),
                                          ),
                                          Text(
                                            "Ticket Booking Date : ${ticket.bookingdate.toString()}",
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w700),
                                          ),
                                          Text(
                                            "Ticket Created Date : ${ticket.createddate.toString()}",
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w700),
                                          ),
                                          SizedBox(
                                            height: 15,
                                          ),
                                        ],
                                      );
                                    },
                                    itemCount: snapshot.data!.length,
                                  );
                                }
                              },
                            )),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomePage(
                              cid: widget.cId,
                            ),
                          )),
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Container(
                            height: 50,
                            width: 300,
                            decoration: BoxDecoration(
                                color: Color.fromRGBO(255, 98, 96, 1),
                                borderRadius: BorderRadius.circular(8)),
                            child: const Center(
                                child: Text(
                              "Home",
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600),
                            ))),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}