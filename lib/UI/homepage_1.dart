import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:project/UI/find_bus.dart';
import 'package:project/model/data.dart';

class HomePage extends StatefulWidget {
  final String name;
  String? cid;

  //const HomePage({super.key});
  HomePage({Key? key, required this.name, this.cid}) : super(key: key);

  @override
  State<HomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> {
  int currentPageIndex = 0;
  TextEditingController datecontroller = TextEditingController();
  TextEditingController name = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _stop();
  }

  List<Routes> route = [];
  Routes? source;
  Routes? destination;

  void _stop() async {
    var response = await http.get(
      Uri.parse("https://busbooking.bestdevelopmentteam.com/Api/stopsapi.php"),
    );
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body) as List;
      route = data.map((e) => Routes.fromJson(e)).toList();
      print(response.body);
      setState(() {});
    }
  }

  void searchBuses() async {
    final res = await http.post(
        Uri.parse('https://busbooking.bestdevelopmentteam.com/Api/bussrch.php'),
        body: jsonEncode({
          "start": source?.name.toString(),
          "end": destination?.name.toString(),
          "date": datecontroller.text
        }),
        headers: {'Content-Type': 'application/json; charset=UTF-8'});
    if (res.statusCode == 200) {
      print(res.body);
      setState(() {});
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Please Select Source & Destination !!"),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    var screensize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(255, 98, 96, 1),
        //background: rgba(255, 98, 96, 1);
        surfaceTintColor: const Color.fromRGBO(
            255, 98, 96, 1), //Color.fromRGBO(255, 98, 96, 1);
      ),
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: SizedBox(
          height: screensize.height,
          width: screensize.width,
          child: Stack(
            children: [
              Positioned(
                width: screensize.width,
                top: -1,
                bottom: 550,
                child: Container(
                  width: 300,
                  height: 250,
                  decoration: const BoxDecoration(
                    color: Color.fromRGBO(255, 98, 96, 1),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(5),
                        bottomRight: Radius.circular(5)),
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 25,
                      ),
                      Text(
                        "Hey User::${widget.cid.toString()}!",
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w300,
                            color: Colors.white),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Where you want to go?',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 3,
                      ),
                      Image(
                        image: AssetImage("assets/images/bus1.png"),
                        height: 120,
                        width: 120,
                      )
                    ],
                  ),
                ),
              ),

              //SERCH DESTIONAATION AND DATES
              Positioned(
                top: 200,
                bottom: 80,
                right: 15,
                left: 15,
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  physics: const NeverScrollableScrollPhysics(),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: const Color.fromRGBO(245, 165, 34, 1),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black45,
                          blurStyle: BlurStyle.normal,
                          blurRadius: 9,
                          offset: Offset(6, 8),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 15, right: 15, top: 40),
                          child: DropdownButtonFormField(
                            hint: Text("Boarding From"),
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: const Color.fromRGBO(243, 238, 255, 1),
                              //background: rgba(243, 238, 255, 1);,
                              enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Colors.transparent),
                                  borderRadius: BorderRadius.circular(5)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Colors.transparent),
                                  borderRadius: BorderRadius.circular(5)),
                            ),
                            borderRadius: BorderRadius.circular(5),
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: Color.fromRGBO(181, 160, 232, 1),
                            ),
                            value: source,
                            items: route.map((e) {
                              return DropdownMenuItem<Routes>(
                                value: e,
                                child: Text(e.name.toString()),
                              );
                            }).toList(),
                            onChanged: (value) {
                              setState(() {
                                source = value;
                              });
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 15, right: 15, top: 10),
                          child: DropdownButtonFormField(
                            hint: Text("Where are you going?"),
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: const Color.fromRGBO(243, 238, 255, 1),
                              //background: rgba(243, 238, 255, 1);,
                              enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Colors.transparent),
                                  borderRadius: BorderRadius.circular(5)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Colors.transparent),
                                  borderRadius: BorderRadius.circular(5)),
                            ),
                            borderRadius: BorderRadius.circular(5),
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: Color.fromRGBO(181, 160, 232, 1),
                            ),
                            value: destination,
                            items: route.map((e) {
                              return DropdownMenuItem<Routes>(
                                value: e,
                                child: Text(e.name.toString()),
                              );
                            }).toList(),
                            onChanged: (value) {
                              setState(() {
                                destination = value;
                              });
                            },
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                                padding: const EdgeInsets.only(
                                    top: 15, left: 15, right: 15),
                                child: SizedBox(
                                  height: 45,
                                  width: 250,
                                  child: TextField(
                                    // Date Select
                                    controller: datecontroller,
                                    readOnly: true,
                                    onTap: () async {
                                      final DateTime? pickedDate =
                                          await showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime(1990),
                                        lastDate: DateTime(2050),
                                      );
                                      if (pickedDate != null) {
                                        print(pickedDate);
                                        String formateDate =
                                            DateFormat('yyyy-MM-dd')
                                                .format(pickedDate);
                                        print(formateDate);
                                        setState(() {
                                          datecontroller.text = formateDate;
                                        });
                                      } else {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          const SnackBar(
                                            content:
                                                Text("Please Select Date !!"),
                                          ),
                                        );
                                      }
                                    },
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      prefixIcon: const Icon(Icons.date_range,
                                          color: Colors.black),
                                      labelText: "Day*",
                                      hintText: "Select Date",
                                    ),
                                  ),
                                )),
                          ],
                        ),
                        SizedBox(
                          width: 300,
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 15, top: 15),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    const Color.fromRGBO(255, 98, 96, 1),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => FindBus(
                                        source: source!.name.toString(),
                                        destination:
                                            destination!.name.toString(),
                                        datecontroller: datecontroller.text,
                                        cId: widget.cid,
                                      ),
                                    ));
                              },
                              child: const Text(
                                'Find Buses',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 550, left: 20),
                child: SizedBox(
                  height: 350,
                  child: ListView(children: [
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Card(
                            child: Container(
                              height: 100,
                              width: 200,
                              child: Column(
                                children: [
                                  Text("data"),
                                  Text("data"),
                                  Text("data"),
                                ],
                              ),
                            ),
                          ),
                          Card(
                            child: Container(
                              height: 100,
                              width: 100,
                              child: Column(
                                children: [
                                  Text("data"),
                                  Text("data"),
                                  Text("data"),
                                ],
                              ),
                            ),
                          ),
                          Card(
                            child: Container(
                              height: 100,
                              width: 100,
                              child: Column(
                                children: [
                                  Text("data"),
                                  Text("data"),
                                  Text("data"),
                                ],
                              ),
                            ),
                          ),
                          Card(
                            child: Container(
                              height: 100,
                              width: 100,
                              child: Column(
                                children: [
                                  Text("data"),
                                  Text("data"),
                                  Text("data"),
                                ],
                              ),
                            ),
                          ),
                          Card(
                            child: Container(
                              height: 100,
                              width: 100,
                              child: Column(
                                children: [
                                  Text("data"),
                                  Text("data"),
                                  Text("data"),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ]),
                ),
              ),
              // //UPCOMING BUSES TEXT
              // const Positioned(
              //   top: 550,
              //   left: 20,
              //   child: Text(
              //     "Upcoming Journey",
              //     style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
              //   ),
              // ),
              // Positioned(
              //   height: 290,
              //   width: 360,
              //   top: 565,
              //   child: Padding(
              //     padding: const EdgeInsets.all(15),
              //     child: Container(
              //         height: 400,
              //         width: 350,
              //         decoration: const BoxDecoration(
              //             color: Colors.white,
              //             boxShadow: [
              //               BoxShadow(
              //                   color: Colors.grey,
              //                   spreadRadius: 1,
              //                   blurRadius: 5,
              //                   blurStyle: BlurStyle.normal,
              //                   offset: Offset(2, 2))
              //             ]
              //         ),
              //         child: Column(
              //           crossAxisAlignment: CrossAxisAlignment.start,
              //           children: [
              //             const Padding(
              //               padding: EdgeInsets.only(left: 5,top: 8),
              //               child: Text("Ticket No : 13392789",
              //                   style: TextStyle(
              //                       color: Color.fromRGBO(160, 160, 160, 1),
              //                       fontSize: 14,
              //                       fontWeight: FontWeight.w500)),
              //             ),
              //             const Divider(
              //               thickness: 1,
              //             ),
              //             Row(
              //               children: [
              //                 const Column(
              //                   children: [
              //                     Row(
              //                       children: [
              //                         Expanded(
              //                             flex: 0,
              //                             child: Icon(Icons.exit_to_app_sharp,
              //                                 size: 20)),
              //                         SizedBox(
              //                           width: 10,
              //                         ),
              //                         Expanded(
              //                           flex: 0,
              //                           child: Column(
              //                             crossAxisAlignment:
              //                             CrossAxisAlignment.start,
              //                             children: [
              //                               Text("Boarding Point",
              //                                   style: TextStyle(
              //                                       fontSize: 12,
              //                                       fontWeight:
              //                                       FontWeight.w500,
              //                                       color: Color.fromRGBO(
              //                                           160, 160, 160, 1))),
              //                               SizedBox(
              //                                 width: 200,
              //                                 child: Text(
              //                                     "8:05 PM, New Sangavi - Pick up near Sangavi Phata New Sangavi - Pick up near Sanavi Phata, 9595951132, 9028298789",
              //                                     style: TextStyle(
              //                                         fontSize: 12,
              //                                         fontWeight:
              //                                         FontWeight.w500,
              //                                         overflow:
              //                                         TextOverflow.clip)),
              //                               ),
              //                             ],
              //                           ),
              //                         ),
              //                       ],
              //                     ),
              //                     SizedBox(
              //                       height: 10,
              //                     ),
              //                     Row(
              //                       children: [
              //                         Expanded(
              //                             flex: 0,
              //                             child:
              //                             Icon(Icons.pin_drop, size: 20)),
              //                         SizedBox(
              //                           width: 10,
              //                         ),
              //                         Expanded(
              //                           flex: 0,
              //                           child: Column(
              //                             crossAxisAlignment:
              //                             CrossAxisAlignment.start,
              //                             children: [
              //                               Text("Drop Point",
              //                                   style: TextStyle(
              //                                       fontSize: 12,
              //                                       fontWeight:
              //                                       FontWeight.w500,
              //                                       color: Color.fromRGBO(
              //                                           160, 160, 160, 1))),
              //                               SizedBox(
              //                                 width: 200,
              //                                 child: Text(
              //                                     "6:30 AM, DeepNagar,DeepNagar",
              //                                     style: TextStyle(
              //                                         fontSize: 12,
              //                                         fontWeight:
              //                                         FontWeight.w500,
              //                                         overflow:
              //                                         TextOverflow.clip)),
              //                               ),
              //                             ],
              //                           ),
              //                         ),
              //                       ],
              //                     ),
              //                   ],
              //                 ),
              //                 Container(
              //                   width: 2,
              //                   color: Colors.grey.withOpacity(0.2),
              //                   height: 120,
              //                 ),
              //                 const SizedBox(
              //                   width: 10,
              //                 ),
              //                 const Expanded(
              //                   flex: 0,
              //                   child: Column(
              //                     children: [
              //                       Text("Ahmedabad",
              //                           style: TextStyle(
              //                               color: Color.fromRGBO(
              //                                   160, 160, 160, 1))),
              //                       Text("8:05 PM",
              //                           style: TextStyle(
              //                               fontSize: 14,
              //                               fontWeight: FontWeight.w500)),
              //                       Text("Sun, 13 Jan",
              //                           style: TextStyle(
              //                               fontSize: 10,
              //                               fontWeight: FontWeight.w500)),
              //                       SizedBox(
              //                         height: 8,
              //                       ),
              //                       Text("TO",
              //                           style: TextStyle(
              //                               fontSize: 10,
              //                               fontWeight: FontWeight.w500,
              //                               color: Color.fromRGBO(
              //                                   245, 165, 34, 1))),
              //                       SizedBox(
              //                         height: 5,
              //                       ),
              //                       Text("Pune",
              //                           style: TextStyle(
              //                               color: Color.fromRGBO(
              //                                   160, 160, 160, 1))),
              //                       Text("6:30 AM",
              //                           style: TextStyle(
              //                               fontSize: 14,
              //                               fontWeight: FontWeight.w500)),
              //                       Text("Mon, 14 Jan",
              //                           style: TextStyle(
              //                               fontSize: 10,
              //                               fontWeight: FontWeight.w500)),
              //                     ],
              //                   ),
              //                 ),
              //               ],
              //             ),
              //             const SizedBox(
              //               height: 13,
              //             ),
              //             const Divider(
              //               thickness: 1,
              //             ),
              //             const Row(
              //               children: [
              //                 Expanded(
              //                     flex: 0, child: Icon(Icons.directions_bus)),
              //                 SizedBox(
              //                   width: 10,
              //                 ),
              //                 Expanded(
              //                   flex: 0,
              //                   child: Column(
              //                     mainAxisAlignment:
              //                     MainAxisAlignment.spaceBetween,
              //                     crossAxisAlignment:
              //                     CrossAxisAlignment.start,
              //                     children: [
              //                       Text("Sangitam Travels",
              //                           style: TextStyle(
              //                               fontSize: 14,
              //                               fontWeight: FontWeight.w500)),
              //                       Text("2X1 (30) A/C SLEEPER",
              //                           style: TextStyle(
              //                               fontSize: 12,
              //                               fontWeight: FontWeight.w500,
              //                               color: Color.fromRGBO(
              //                                   160, 160, 160, 1))),
              //                     ],
              //                   ),
              //                 ),
              //                 SizedBox(width: 115,),
              //                 Text("1 Seat", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
              //               ],
              //             ),
              //           ],
              //         )
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
