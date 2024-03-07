import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:project/UI/pass-detail.dart';
import 'package:project/model/dropdown.dart';
import 'package:project/model/seatselect.dart';

class SeatSelect extends StatefulWidget {
  SeatSelect({
    Key? key,
    required this.busID,
    required this.date,
    this.start,
    this.end,
  }) : super(key: key);

  final String? start;
  final String? end;
  final String busID;
  final String date;

  @override
  State<SeatSelect> createState() => _SeatSelectState();
}

class _SeatSelectState extends State<SeatSelect> {
  late String busID;
  late String date;
  late String? start;
  late String? end;

  Future<List<BusDisplay>> _sendStops() async {
    print(widget.start);
    print(widget.end);

    var res = await http.post(
      Uri.parse('https://busbooking.bestdevelopmentteam.com/Api/bussrch.php'),
      body: jsonEncode({
        "start": widget.start.toString(),
        "end": widget.end.toString(),
        "date": widget.date.toString(),
      }),
      headers: {'Content-Type': 'application/json'},
    );

    if (res.statusCode == 200) {
      var data = jsonDecode(res.body);
      print(res.body);

      return (data['data'] as List).map((e) => BusDisplay.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load ');
    }
  }

  List<SeatSel> seat = [];

  int noOfSeats = 0;

  List<SeatSel> selectSeatList = [];

  void _getSeat() async {
    var res = await http.post(
        Uri.parse('https://busbooking.bestdevelopmentteam.com/Api/setas.php'),
        body: jsonEncode({"bus_id": 24, "date": "2024/03/18"}),
        headers: {'Content-Type': 'application/json'});
    if (res.statusCode == 200) {
      var data = jsonDecode(res.body);
      seat = (data['seats'] as List).map((e) => SeatSel.fromJson(e)).toList();
      print(res.body);
      setState(() {});
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    busID = widget.busID;
    date = widget.date;
    start = widget.start;
    end = widget.end;
    _getSeat();
  }

  getListOfSelectedSeats(){
    noOfSeats = 0;
    selectSeatList.clear();
    seat.forEach((element) {
      if(element.userSelected!){
        noOfSeats++;
        selectSeatList.add(SeatSel(seatNo: element.seatNo!));
      }

    });
    print("total Selected Seats $noOfSeats");
    print("total Selected Seats {${jsonEncode(selectSeatList)}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(255, 98, 96, 1),
        surfaceTintColor: const Color.fromRGBO(255, 98, 96, 1),
      ),
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Container(
                height: 313,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                  color: Color.fromRGBO(255, 98, 96, 1),
                ),
                child: Column(
                  children: [
                    const Text(
                      "Choose your seat!",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Column(
                      children: [
                        Text(
                          widget.start.toString(),
                          style: const TextStyle(
                            color: Colors.white,
                            height: 1,
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.swap_vert_outlined, color: Colors.white),
                          onPressed: () {},
                        ),
                        Text(
                          widget.end.toString(),
                          style: const TextStyle(
                            color: Colors.white,
                            height: 1,
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Date:\t\t",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(238, 238, 238, 1),
                          ),
                        ),
                        Text(
                          widget.date.toString(),
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: Color.fromRGBO(238, 238, 238, 1),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 170, left: 10, right: 10, bottom: 520),
                child: Container(
                  width: 353,
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Bus ID: $busID'),
                          Text('Date: $date'),
                          Text('Start: $start'),
                          Text('End: $end'),
                        ],
                      ),
                    ),
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.only(top: 280,left: 20,right: 20,bottom: 80),
                child: Card(
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 15,left: 15),
                        child: Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: 20,
                              width: 20,
                              color: Colors.green,
                            ),
                            Text("\t\tAvailable"),
                            SizedBox(width: 15,),
                            Container(
                              height: 20,
                              width: 20,
                              color: Colors.orangeAccent,
                            ),
                            Text("\t\tYour Seat"),
                            SizedBox(width: 15,),
                            Container(
                              height: 20,
                              width: 20,
                              color: Colors.grey,
                            ),
                            Text("\t\tBooked"),
                          ],
                        ),
                      ),

                      GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                        ),
                        itemCount: seat.length,
                        itemBuilder: (context, index) {
                          final s = seat[index];
                          final color = s.bookedStatus == true
                              ? Colors.grey
                              : s.userSelected == true
                              ? Colors.orangeAccent
                              : Colors.green;
                          // final selcolor =
                          //     s.userSelected == true ? Colors.orangeAccent : Colors.green;

                          return Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    if(seat[index].userSelected==false){
                                      if(noOfSeats<5) {
                                        seat[index].userSelected = !seat[index].userSelected!;
                                      }else{
                                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Bas bhai kitni add krega!")));
                                      }}else{
                                      seat[index].userSelected = !seat[index].userSelected!;
                                    }
                                    getListOfSelectedSeats();
                                    setState(() {});
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: color,
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
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 720,left: 30,right: 5),
                child: Text(
                  'Selected Seat Numbers: ${selectSeatList.map((seat) => seat.seatNo).toList().join(', ')}',
                  style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 750,left: 30,right: 20),
                child: GestureDetector(
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PassDeatils(),
                      ),
                    );
                  },
                  child: Container(
                    width: 293,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color.fromRGBO(255, 98, 96, 1),
                    ),
                    child: Center(child: Text("Confirm Ticket",style: TextStyle(fontSize: 20,color:Colors.white,fontWeight: FontWeight.w500 ),)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}