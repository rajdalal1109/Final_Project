// import 'dart:convert';
//
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:project/UI/pass-detail.dart';
// import 'package:project/model/dropdown.dart';
// import 'package:project/model/seatselect.dart';
//
// class SeatSelect extends StatefulWidget {
//   SeatSelect({Key? key, required this.busID, required this.date, this.start, this.end,}) : super(key: key);
//
//   String? start;
//   String? end;
//   final String busID;
//   final String date;
//
//   @override
//   State<SeatSelect> createState() => _SeatSelectState();
// }
//
// class _SeatSelectState extends State<SeatSelect> {
//   Future<List<BusDisplay>> _sendStops() async {
//     print(widget.start);
//     print(widget.end);
//
//     var res = await http.post(
//       Uri.parse('https://busbooking.bestdevelopmentteam.com/Api/bussrch.php'),
//       body: jsonEncode({
//         "start": widget.start.toString(),
//         "end": widget.end.toString(),
//         "date": widget.date.toString(),
//       }),
//       headers: {'Content-Type': 'application/json'},
//     );
//
//     if (res.statusCode == 200) {
//       var data = jsonDecode(res.body);
//       print(res.body);
//
//       return (data['data'] as List).map((e) => BusDisplay.fromJson(e)).toList();
//     } else {
//       throw Exception('Failed to load ');
//     }
//   }
//
//   List<SeatSel> seat = [];
//   int noOfSeats = 0;
//   List<SeatSel> selectSeatList = [];
//
//   void _getSeat() async {
//     var res = await http.post(
//         Uri.parse('https://busbooking.bestdevelopmentteam.com/Api/setas.php'),
//         body: jsonEncode({"bus_id": 24, "date": "2024/03/18"}),
//         headers: {'Content-Type': 'application/json'});
//     if (res.statusCode == 200) {
//       var data = jsonDecode(res.body);
//       seat = (data['seats'] as List).map((e) => SeatSel.fromJson(e)).toList();
//       print(res.body);
//       setState(() {});
//     }
//   }
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     _getSeat();
//   }
//
//   getListOfSelectedSeats(){
//     noOfSeats = 0;
//     selectSeatList.clear();
//     seat.forEach((element) {
//       if(element.userSelected!){
//         noOfSeats++;
//         selectSeatList.add(SeatSel(seatNo: element.seatNo!));
//       }
//
//     });
//     print("total Selected Seats $noOfSeats");
//     print("total Selected Seats {${jsonEncode(selectSeatList)}");
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: const Color.fromRGBO(255, 98, 96, 1),
//         surfaceTintColor: const Color.fromRGBO(255, 98, 96, 1),
//       ),
//       body: SingleChildScrollView(
//         physics: const AlwaysScrollableScrollPhysics(),
//         child: SizedBox(
//           width: MediaQuery.of(context).size.width,
//           height: MediaQuery.of(context).size.height,
//           child: Stack(
//             children: [
//               Container(
//                 height: 313,
//                 width: MediaQuery.of(context).size.width,
//                 decoration: const BoxDecoration(
//                   borderRadius: BorderRadius.only(
//                     bottomLeft: Radius.circular(10),
//                     bottomRight: Radius.circular(10),
//                   ),
//                   color: Color.fromRGBO(255, 98, 96, 1),
//                 ),
//                 child: Column(
//                   children: [
//                     const Text("Choose your seat!", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w300,),),
//                     const SizedBox(height: 15),
//                     Column(
//                       children: [
//                         Text(widget.start.toString(), style: const TextStyle(color: Colors.white, height: 1, fontSize: 20,fontWeight: FontWeight.w500,),),
//                         IconButton(icon: const Icon(Icons.swap_vert_outlined, color: Colors.white),
//                           onPressed: () {},
//                         ),
//                         Text(widget.end.toString(), style: const TextStyle(color: Colors.white, height: 1, fontSize: 20, fontWeight: FontWeight.w500,)),
//                       ],
//                     ),
//                     const SizedBox(height: 15),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         const Text("Date:\t\t", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color.fromRGBO(238, 238, 238, 1),),),
//                         Text(widget.date.toString(), style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w400, color: Color.fromRGBO(238, 238, 238, 1),),),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//               Padding(
//                 padding: EdgeInsets.only(top: 170, left: 10, right: 10, bottom: 520),
//                 child: Container(
//                   width: 353,
//                   child: Card(
//                     child: Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           // Text('Bus ID: $busID'),
//                           // Text('Date: $date'),
//                           // Text('Start: $start'),
//                           // Text('End: $end'),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: EdgeInsets.only(top: 330,left: 40),
//                 child: Row(
//                   // mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Container(
//                       height: 20,
//                       width: 20,
//                       color: Colors.green,
//                     ),
//                     Text("\t\tAvailable"),
//                     SizedBox(width: 15,),
//                     Container(
//                       height: 20,
//                       width: 20,
//                       color: Colors.orangeAccent,
//                     ),
//                     Text("\t\tYour Seat"),
//                     SizedBox(width: 15,),
//                     Container(
//                       height: 20,
//                       width: 20,
//                       color: Colors.grey,
//                     ),
//                     Text("\t\tBooked"),
//                   ],
//                 ),
//               ),
//           Padding(
//             padding: EdgeInsets.only(top: 360,left: 10,right: 10,bottom: 90),
//             child: Card(
//               child: GridView.builder(
//                 gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: 3,
//                   crossAxisSpacing: 1,
//                   mainAxisSpacing: 1,
//                   // childAspectRatio:1/2
//                 ),
//                 itemCount: seat.length,
//                 itemBuilder: (context, index) {
//                   final s = seat[index];
//                   final color = s.bookedStatus == true
//                       ? Colors.grey
//                       : s.userSelected == true
//                       ? Colors.orangeAccent
//                       : Colors.green;
//                   // final selcolor =
//                   //     s.userSelected == true ? Colors.orangeAccent : Colors.green;
//
//                   return Padding(
//                     padding: const EdgeInsets.all(10.0),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         GestureDetector(
//                           onTap: () {
//                             if(seat[index].userSelected==false){
//                               if(noOfSeats<5) {
//                                 seat[index].userSelected = !seat[index].userSelected!;
//                               }else{
//                                 ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Bas bhai kitni add krega!")));
//                               }}else{
//                               seat[index].userSelected = !seat[index].userSelected!;
//                             }
//                             getListOfSelectedSeats();
//                             setState(() {
//
//                             });
//
//                           },
//                           child: Container(
//                             decoration: BoxDecoration(
//                                 color: color,
//                                 borderRadius: BorderRadius.circular(10)),
//                             width: 50,
//                             height: 50,
//                             alignment: Alignment.center,
//                             child: Text('${s.seatNo.toString()}'),
//                           ),
//                         ),
//                       ],
//                     ),
//                   );
//                 },
//               ),
//               ),
//             ),
//               Padding(
//                 padding: EdgeInsets.only(top: 720,left: 30,right: 5),
//                 child: Text(
//                   'Selected Seat Numbers: ${selectSeatList.map((seat) => seat.seatNo).toList().join(', ')}',
//                   style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),
//                 ),
//               ),
//               Padding(
//                 padding: EdgeInsets.only(top: 750,left: 30,right: 20),
//                 child: GestureDetector(
//                   onTap: (){
//                     if (selectSeatList.isNotEmpty) {
//                       Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => PassDeatils(),
//                           ));
//                     } else {
//                       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//                           backgroundColor: Colors.red,
//                           behavior: SnackBarBehavior.floating,
//                           duration: Duration(seconds: 1),
//                           shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(25)),
//                           content: Text('PLease select Seat!!')));
//                     }
//                   },
//                   child: Container(
//                     width: 293,
//                     height: 40,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(10),
//                       color: Color.fromRGBO(255, 98, 96, 1),
//                     ),
//                     child: Center(child: Text("Confirm Ticket",style: TextStyle(fontSize: 20,color:Colors.white,fontWeight: FontWeight.w500 ),)),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:project/UI/pass-detail.dart';
import 'package:project/model/dropdown.dart';
import 'package:project/model/seatselect.dart';

class SeatSelect extends StatefulWidget {
  BusDisplay?bus;
  SeatSelect({Key? key, required this.busID, required this.date,this.start, this.end,this.bus}): super(key: key);

  String? start;
  String? end;
  final String busID;
  final String date;

  @override
  State<SeatSelect> createState() => _SeatSelectState();
}

class _SeatSelectState extends State<SeatSelect> {
  Future<List<BusDisplay>> _sendStops() async {
    print(widget.start);
    print(widget.end);

    var res = await http.post(
        Uri.parse('https://busbooking.bestdevelopmentteam.com/Api/bussrch.php'),
        body: jsonEncode({
          "start": widget.start.toString(),
          "end": widget.end.toString(),
          "date": widget.date.toString()
        }),
        headers: {'Content-Type': 'application/json'});

    if (res.statusCode == 200) {
      var data = jsonDecode(res.body);
      print(res.body);

      return (data['data'] as List).map((e) => BusDisplay.fromJson(e)).toList();

      // return (data['data'] as List).map((e) => BusDisplay.fromJson(e)).toList();
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
    _getSeat();
  }

  getListOfSelectedSeats() {
    noOfSeats = 0;
    selectSeatList.clear();
    seat.forEach((element) {
      if (element.userSelected! && element.bookedStatus == false) {
        noOfSeats++;
        selectSeatList.add(
            SeatSel(
            seatNo: element.seatNo!,
            userSelected: element.userSelected,
            bookedStatus: element.bookedStatus,
            name: TextEditingController(),
            age: TextEditingController()
            )
        );
      } else {
        return null;
      }
    });
    // print("total Selected Seats $noOfSeats");
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
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Container(
                height: 190,
                // height: 313,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10)),
                  color: Color.fromRGBO(255, 98, 96, 1),
                ),
                child: Column(
                  children: [
                    const Text("Choose your seat!", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w300),
                    ),
                    const SizedBox(height: 15),
                    Column(
                      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(widget.start.toString(), style: const TextStyle(color: Colors.white, height: 1, fontSize: 20, fontWeight: FontWeight.w500),),
                        IconButton(
                          icon: const Icon(Icons.swap_vert_outlined, color: Colors.white), onPressed: () {},
                        ),
                        Text(widget.end.toString(), style: const TextStyle(color: Colors.white,height: 1, fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Date:\t\t",style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color.fromRGBO(238, 238, 238, 1)),),
                        Text(widget.date.toString(), style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w400, color: Color.fromRGBO(238, 238, 238, 1)),),
                      ],
                    ),
                  ],
                ),
              ),
                  Padding(
                padding: EdgeInsets.only(top: 210,left: 40),
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
          Padding(
            padding: EdgeInsets.only(top: 240,left: 30,right: 30,bottom: 80),
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
              ),
            ),
              Padding(
                padding: EdgeInsets.only(top: 740,left: 30,right: 20),
                child: GestureDetector(
                  onTap: (){
                    if (selectSeatList.isNotEmpty) {
                 showModalBottomSheet(
                    context: context,
                    builder: (builder){
                      return Container(
                        height: 250,
                        width: 500,
                        child: Padding(
                          padding: EdgeInsets.only(top: 20,right: 10,left: 10,bottom: 20),
                          child: Card(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                            color: Color.fromRGBO(255, 98, 96, 1),
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  //Text(widget.bus!.busid.toString(),style: TextStyle(color: Colors.white),),
                                  Text(
                                    'Selected Seat Numbers: ${selectSeatList.map((seat) => seat.seatNo).toList().join(', ')}',
                                    style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),
                                  ),
                                  Row(
                                    children: [
                                      Text("Bus Name : ",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w700,color: Colors.white),),
                                      Text(widget.bus!.busname.toString(),style: TextStyle(fontSize: 15,color: Colors.white),),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text("Arrival Time : ",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w700,color: Colors.white)),
                                      Text(widget.bus!.arrivalTime.toString(),style: TextStyle(fontSize: 15,color: Colors.white),),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text("Departure Time : ",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w700,color: Colors.white)),
                                      Text(widget.bus!.deptTime.toString(),style: TextStyle(fontSize: 15,color: Colors.white),),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text("Available Seat : ",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w700,color: Colors.white)),
                                      Text(widget.bus!.avSeats.toString(),style: TextStyle(fontSize: 15,color: Colors.white),),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text("Price : ₹ ",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w700,color: Colors.white)),
                                      Text(widget.bus!.price.toString(),style: TextStyle(fontSize: 15,color: Colors.white),),
                                    ],
                                  ),
                                  ElevatedButton(onPressed: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => PassDeatils(seat: selectSeatList),));
                                  }, child: Text("Confirm Your Seat!!"))
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    }
                );
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //       builder: (context) => PassDeatils(),
                      //     ));
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          backgroundColor: Colors.red,
                          behavior: SnackBarBehavior.floating,
                          duration: Duration(seconds: 1),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25)),
                          content: Text('PLease select Seat!!')));
                    }
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
