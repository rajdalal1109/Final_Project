// import 'dart:convert';
//
// import 'package:dotted_line/dotted_line.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:project/UI/homepage_1.dart';
// import 'package:project/model/dropdown.dart';
// import 'package:project/model/seatselect.dart';
// import 'package:http/http.dart' as http;
//
// class ConfirmTickets extends StatefulWidget {
//   List<SeatSel> booking = [];
//   // BusDisplay pass;
//
//   ConfirmTickets({super.key, required this.booking, required this.busID, required this.date});
//
//   String? start;
//   String? end;
//   String? arrivalTime;
//   String? deptTime;
//   final String busID;
//   final String date;
//
//   @override
//   State<ConfirmTickets> createState() => _TicketsState();
// }
//
// class _TicketsState extends State<ConfirmTickets> {
//   Future<List<BusDisplay>> _sendStops() async {
//     print(widget.start);
//     print(widget.end);
//     print(widget.arrivalTime);
//     print(widget.deptTime);
//
//     var res = await http.post(
//         Uri.parse('https://busbooking.bestdevelopmentteam.com/Api/bussrch.php'),
//         body: jsonEncode({
//           "start": widget.start.toString(),
//           "end": widget.end.toString(),
//           "date": widget.date.toString()
//         }),
//         headers: {'Content-Type': 'application/json'});
//
//     if (res.statusCode == 200) {
//       var data = jsonDecode(res.body);
//       print(res.body);
//       return (data['data'] as List).map((e) => BusDisplay.fromJson(e)).toList();
//     } else {
//       throw Exception('Failed to load ');
//     }
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color.fromRGBO(255, 98, 96, 1),
//       body:
//       SafeArea(
//         child: Column(
//           children: [
//             Container(
//               // color: Colors.redAccent,
//               color: Color.fromRGBO(255, 98, 96, 1),
//               height: MediaQuery.of(context).size.height*0.3,
//               width: MediaQuery.of(context).size.width,
//               child:
//               Padding(
//                 padding: EdgeInsets.only(top: 100),
//                 child: Column(
//                   children: [
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Text("Booking Confirmed",style: TextStyle(fontSize: 22,fontWeight: FontWeight.w700,color: Colors.white)),
//                         SizedBox(width: 5),
//                         Image.asset("assets/images/confirm.png"),
//                         // ImageIcon(AssetImage("assets/images/confirm.png")),
//                       ],
//                     ),
//                     SizedBox(height: 20),
//                     Text("We have send you the ticket copy on your E-mail",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400,color: Colors.white)),
//                     Text("abc@gmail.com",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: Colors.white)),
//                   ],
//                 ),
//               ),
//             ),
//             Expanded(
//               child: Container(
//                 color: Colors.white,
//                  width:  MediaQuery.of(context).size.width,
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Padding(
//                       padding: EdgeInsets.only(top: 30,right: 50,left: 50),
//                       child: Container(
//                         height: 350,
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Text(widget.start.toString(),style: TextStyle(fontSize: 18,fontWeight: FontWeight.w700),),
//                                 IconButton(icon: const Icon(Icons.swap_horiz, color: Colors.black), onPressed: () {},),
//                                 Text(widget.end.toString(),style: TextStyle(fontSize: 18,fontWeight: FontWeight.w700),),
//                               ],
//                             ),
//                             SizedBox(height: 15,),
//                             Text(widget.date.toString()),
//                             SizedBox(height: 10,),
//                             Text(widget.arrivalTime.toString()),
//                             Text(widget.deptTime.toString()),
//                             SizedBox(height: 15,),
//                             DottedLine(dashLength: 5,dashColor: Colors.black,lineThickness: 2,dashGapLength: 6,),
//                             SizedBox(height: 15,),
//                             Text("TICKET NUMBER : 1234567890",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w700),),
//                             SizedBox(height: 10,),
//                             Text("Total Seat : 2",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w700),),
//                             SizedBox(height: 10,),
//                             Text("Total Price : ₹ 1350",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w700),),
//                             SizedBox(height: 15,),
//                             GestureDetector(
//                               onTap: (){
//
//                                 },
//                               child: Padding(
//                                 padding: EdgeInsets.only(bottom: 30,),
//                                 child: Container(
//                                     height: 40,
//                                     width: 250,
//                                     decoration: BoxDecoration(
//                                         color: Color.fromRGBO(255, 98, 96, 1),
//                                         borderRadius: BorderRadius.circular(8)
//                                     ),
//                                     child: const Center(
//                                         child: Text("Show Passangers Details", style: TextStyle(fontSize: 18,color: Colors.white,),)
//                                     )
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                     GestureDetector(
//                       onTap: (){ Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(name: ''),));},
//                       child: Padding(
//                         padding: EdgeInsets.only(bottom: 30,),
//                         child: Container(
//                             height: 50,
//                             width: 300,
//                             decoration: BoxDecoration(
//                                 color: Color.fromRGBO(255, 98, 96, 1),
//                                 borderRadius: BorderRadius.circular(8)
//                             ),
//                             child: const Center(
//                                 child: Text("Home", style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.w600),)
//                             )
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'dart:convert';

import 'package:BusBuddy/utils/global_function.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:BusBuddy/UI/bottombar.dart';
import 'package:BusBuddy/UI/homepage_1.dart';
import 'package:BusBuddy/model/showticketmodel.dart';
import 'package:BusBuddy/utils/appcolor.dart';

class ConfirmTickets extends StatefulWidget {
  String? ticketNo;
  String? cId;

  ConfirmTickets({this.ticketNo,this.cId});

  @override
  State<ConfirmTickets> createState() => _TicketsState();
}

class _TicketsState extends State<ConfirmTickets> {
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
        backgroundColor: AppColors.primary,
        surfaceTintColor: AppColors.primary,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              color: AppColors.primary,
              height: MediaQuery.of(context).size.height * 0.15,
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
                      Image.asset("assets/images/confirm.png"),
                      // ImageIcon(AssetImage("assets/images/confirm.png")),
                    ],
                  ),
                  SizedBox(height: 20),
                  Text("We have send you the ticket copy on your E-mail",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.white)
                  ),
                  Text("${GlobalFunction.userProfile.email.toString()}",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.white)
                  ),
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
                      padding: EdgeInsets.only(top: 30, right: 40, left: 40),
                      child: SingleChildScrollView(
                        physics: AlwaysScrollableScrollPhysics(),
                        child: Container(
                            height: 400,
                            width: 500,
                            decoration: BoxDecoration(
                              color: AppColors.secondary,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: FutureBuilder(
                              future: displayTicket(),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return Center(child: CircularProgressIndicator());
                                } else if (snapshot.hasError) {
                                  return Text('ERROR :::${snapshot.error}');
                                } else {
                                  return Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: ListView.builder(
                                      itemBuilder: (context, index) {
                                        final ticket = snapshot.data![index];

                                        return Column(
                                          mainAxisAlignment:
                                          MainAxisAlignment.start,
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "From : ${ticket.start.toString()}",
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                      FontWeight.w700),
                                                ),
                                                Text(
                                                    "Arival Time : ${ticket.reportingTime.toString()}"),
                                                SizedBox(
                                                  height: 15,
                                                ),
                                                Text(
                                                  "To : ${ticket.end.toString()}",
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                      FontWeight.w700),
                                                ),
                                                Text(
                                                    "Desination Time : ${ticket.depatureTime.toString()}"),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 15,
                                            ),
                                            Text(
                                                "Day : ${ticket.bookingdate.toString()},  ${ticket.day.toString()}"),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            DottedLine(
                                              dashLength: 5,
                                              dashColor: Colors.black,
                                              lineThickness: 2,
                                              dashGapLength: 6,
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                                "Bus Name : ${ticket.busname.toString()} Travel"),
                                            Text(
                                              "Ticket No : ${ticket.tickitno.toString()}",
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w700),
                                            ),
                                            SizedBox(
                                              height: 15,
                                            ),
                                            ListView.builder(
                                              itemBuilder: (context, index) {
                                                final passenger =
                                                    ticket.passenger;
                                                return Container(
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
                                              height: 15,
                                            ),
                                            Text(
                                              "Price = ₹${ticket.amount.toString()}",
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w700),
                                            ),
                                            SizedBox(
                                              height: 10,
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
                                    ),
                                  );
                                }
                              },
                            )),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => BottoBar()));
                      },
                      child: Padding(
                        padding: EdgeInsets.only(
                          bottom: 30,
                        ),
                        child: Container(
                            height: 50,
                            width: 300,
                            decoration: BoxDecoration(
                                color: AppColors.primary,
                                borderRadius: BorderRadius.circular(8)),
                            child: const Center(
                                child: Text(
                                  "Home",
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600),
                                )
                            )
                        ),
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
