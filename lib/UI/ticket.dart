import 'dart:convert';

import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:project/model/tickethistorymodel.dart';
import 'package:http/http.dart'as http;
import 'package:intl/intl.dart';
import 'package:project/utils/appcolor.dart';
class Tickets extends StatefulWidget {
  String?cId;

  Tickets({this.cId});

  @override
  State<Tickets> createState() => _TicketsState();
}

class _TicketsState extends State<Tickets> {
  TextEditingController datecontroller = TextEditingController();
  Future<List<TicketHistoryM>> getTicketHistory() async {
    var body=
    {"cid": widget.cId.toString(), "date": datecontroller.text}
    ;
    print('ADEDEDEDD BODYDYDYDYD:::::${body}');
    var res = await http.post(
        Uri.parse(
            'https://busbooking.bestdevelopmentteam.com/Api/userhistory.php'),
        body: jsonEncode(body),
        headers: {'Content-Type': 'application/json'});
    print('RESPONSE FROM DB::::::${res.body}');

    if (res.statusCode == 200) {
      var data = jsonDecode(res.body);
      return (data['tickit'] as List)
          .map((e) => TicketHistoryM.fromJson(e))
          .toList();
    } else {
      throw ('Kya kar hai bhai');
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.primary,
        surfaceTintColor: AppColors.primary,
        centerTitle: true,
        title: const Text("My Tickets",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,color: Colors.white)),
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
          FutureBuilder(
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
        ],
      ),
      /*    body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          child: Padding(
            padding: EdgeInsets.only(top: 30,right: 50,left: 50),
            child: Container(
              height: 350,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [


                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Source",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w700),),
                      IconButton(icon: const Icon(Icons.swap_horiz, color: Colors.black), onPressed: () {},),
                      Text("Destination",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w700),),
                    ],
                  ),
                  SizedBox(height: 15,),
                  Text("Date : 12/12/2025"),
                  SizedBox(height: 10,),
                  Text("Arrival Time : 12/12/2025"),
                  Text("Departure Time : 12/12/2025"),
                  SizedBox(height: 15,),
                  DottedLine(dashLength: 5,dashColor: Colors.black,lineThickness: 2,dashGapLength: 6,),
                  SizedBox(height: 15,),
                  Text("TICKET NUMBER : 1234567890",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w700),),
                  SizedBox(height: 10,),
                  Text("Total Seat : 2",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w700),),
                  SizedBox(height: 10,),
                  Text("Total Price : ₹ 1350",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w700),),
                  SizedBox(height: 15,),
                  GestureDetector(
                    onTap: (){

                    },
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 30,),
                      child: Container(
                          height: 40,
                          width: 250,
                          decoration: BoxDecoration(
                              color: Color.fromRGBO(255, 98, 96, 1),
                              borderRadius: BorderRadius.circular(8)
                          ),
                          child: const Center(
                              child: Text("Show Passangers Details", style: TextStyle(fontSize: 18,color: Colors.white,),)
                          )
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),*/
    );
  }
}
