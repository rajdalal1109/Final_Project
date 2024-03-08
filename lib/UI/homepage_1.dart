import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:project/UI/find_bus.dart';
import 'package:project/models/dropdown.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> {
  Stops? source;
  Stops? desti;
  List<Stops> stops = [];

  getStops() async {
    var res = await http.get(Uri.parse(
        'https://busbooking.bestdevelopmentteam.com/Api/stopsapi.php'));
    if (res.statusCode == 200) {
      var data = jsonDecode(res.body);
      stops = (data as List)
          .map(
            (e) => Stops.fromJson(e),
          )
          .toList();
      print(res.body);
      setState(() {});
    } else {}
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getStops();
  }

  TextEditingController dateInput = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var screensize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(
            255, 98, 96, 1), //background: rgba(255, 98, 96, 1);
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
                  child: const Column(
                    children: [
                      SizedBox(
                        height: 25,
                      ),
                      Text(
                        'Hey User!',
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
                          child: Container(
                            alignment: Alignment.center,
                            width: 350,
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color.fromRGBO(243, 238, 255, 1),
                            ),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton(
                                isExpanded: true,
                                value: source,
                                padding: EdgeInsets.symmetric(horizontal: 50),
                                hint: Text(
                                  'Source',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey),
                                ),
                                items: stops.map((e) {
                                  return DropdownMenuItem(
                                    child: Text(
                                      e.name.toString(),
                                      style: TextStyle(
                                          color:
                                              Color.fromRGBO(181, 160, 232, 1),
                                          fontSize: 19,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    value: e,
                                  );
                                }).toList(),
                                onChanged: (value) {
                                  setState(() {
                                    source = value!;
                                  });
                                  print(source!.name);
                                },
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 15, right: 15, top: 25),
                          child: Container(
                            alignment: Alignment.center,
                            width: 350,
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color.fromRGBO(243, 238, 255, 1),
                            ),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton(
                                isExpanded: true,
                                // isDense: false,
                                value: desti,
                                padding: EdgeInsets.symmetric(horizontal: 50),
                                hint: Text(
                                  'Destination',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey),
                                ),
                                items: stops.map((e) {
                                  return DropdownMenuItem(
                                    child: Text(
                                      e.name.toString(),
                                      style: TextStyle(
                                          color:
                                              Color.fromRGBO(181, 160, 232, 1),
                                          fontSize: 19,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    value: e,
                                  );
                                }).toList(),
                                onChanged: (value) {
                                  setState(() {
                                    desti = value!;
                                  });
                                  print(desti!.name);
                                },
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: SizedBox(
                            width: 345,
                            child: TextField(
                              controller: dateInput,
                              //editing controller of this TextField
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 12),
                                filled: true,
                                fillColor: Color.fromRGBO(243, 238, 255, 1),

                                suffixIcon: Icon(Icons.calendar_today),
                                //icon of text field
                                labelText: "Enter Date",
                                labelStyle: TextStyle(
                                    color: Color.fromRGBO(181, 160, 232, 1),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16),
                                //label text of field
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                              readOnly: true,
                              //set it true, so that user will not able to edit text
                              onTap: () async {
                                DateTime? pickedDate = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime.now(),
                                    //DateTime.now() - not to allow to choose before today.
                                    lastDate: DateTime(2100));

                                if (pickedDate != null) {
                                  print(
                                      pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                                  String formattedDate =
                                      DateFormat('yyyy-MM-dd')
                                          .format(pickedDate);
                                  print(
                                      formattedDate); //formatted date output using intl package =>  2021-03-16
                                  setState(() {
                                    dateInput.text =
                                        formattedDate; //set output date to TextField value.
                                  });
                                } else {}
                              },
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 300,
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 25, top: 15),
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
                                        desti: desti!.name.toString(),
                                        dateInput: dateInput.text,
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
              //UPCOMING BUSES TEXT
              const Positioned(
                top: 535,
                left: 20,
                child: Text(
                  "Upcoming Journey",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
                ),
              ),
              Positioned(
                height: 290,
                width: MediaQuery.of(context).size.width,
                top: 570,
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Container(
                      height: 400,
                      width: 350,
                      decoration:
                          const BoxDecoration(color: Colors.white, boxShadow: [
                        BoxShadow(
                            color: Colors.grey,
                            spreadRadius: 1,
                            blurRadius: 5,
                            blurStyle: BlurStyle.normal,
                            offset: Offset(2, 2))
                      ]),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(left: 5, top: 8),
                            child: Text("Ticket No : 13392789",
                                style: TextStyle(
                                    color: Color.fromRGBO(160, 160, 160, 1),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500)),
                          ),
                          const Divider(
                            thickness: 1,
                          ),
                          Row(
                            children: [
                              const Column(
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                          flex: 0,
                                          child: Icon(Icons.exit_to_app_sharp,
                                              size: 20)),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Expanded(
                                        flex: 0,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text("Boarding Point",
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w500,
                                                    color: Color.fromRGBO(
                                                        160, 160, 160, 1))),
                                            SizedBox(
                                              width: 200,
                                              child: Text(
                                                  "8:05 PM, New Sangavi - Pick up near Sangavi Phata New Sangavi - Pick up near Sanavi Phata, 9595951132, 9028298789",
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      overflow:
                                                          TextOverflow.clip)),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                          flex: 0,
                                          child:
                                              Icon(Icons.pin_drop, size: 20)),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Expanded(
                                        flex: 0,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text("Drop Point",
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w500,
                                                    color: Color.fromRGBO(
                                                        160, 160, 160, 1))),
                                            SizedBox(
                                              width: 200,
                                              child: Text(
                                                  "6:30 AM, DeepNagar,DeepNagar",
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      overflow:
                                                          TextOverflow.clip)),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Container(
                                width: 2,
                                color: Colors.grey.withOpacity(0.2),
                                height: 120,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              const Expanded(
                                flex: 0,
                                child: Column(
                                  children: [
                                    Text("Ahmedabad",
                                        style: TextStyle(
                                            color: Color.fromRGBO(
                                                160, 160, 160, 1))),
                                    Text("8:05 PM",
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500)),
                                    Text("Sun, 13 Jan",
                                        style: TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.w500)),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    Text("TO",
                                        style: TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.w500,
                                            color: Color.fromRGBO(
                                                245, 165, 34, 1))),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text("Pune",
                                        style: TextStyle(
                                            color: Color.fromRGBO(
                                                160, 160, 160, 1))),
                                    Text("6:30 AM",
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500)),
                                    Text("Mon, 14 Jan",
                                        style: TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.w500)),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 13,
                          ),
                          const Divider(
                            thickness: 1,
                          ),
                          const Row(
                            children: [
                              Expanded(
                                  flex: 0, child: Icon(Icons.directions_bus)),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                flex: 0,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Sangitam Travels",
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500)),
                                    Text("2X1 (30) A/C SLEEPER",
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                            color: Color.fromRGBO(
                                                160, 160, 160, 1))),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 115,
                              ),
                              Text("1 Seat",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500)),
                            ],
                          ),
                        ],
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
