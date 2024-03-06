// // import 'package:flutter/material.dart';
// // import 'package:project/UI/board_drop.dart';
// //
// // class SelectSeat extends StatefulWidget {
// //   const SelectSeat({super.key});
// //
// //   @override
// //   State<SelectSeat> createState() => _SelectSeatState();
// // }
// //
// // class _SelectSeatState extends State<SelectSeat> {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         backgroundColor: const Color.fromRGBO(255, 98, 96, 1),
// //         surfaceTintColor: const Color.fromRGBO(255, 98, 96, 1),
// //         actions: [
// //           TextButton(
// //               onPressed: () {},
// //               child: const Text(
// //                 "Next",
// //                 style: TextStyle(
// //                     color: Colors.white,
// //                     fontSize: 16,
// //                     fontWeight: FontWeight.w400),
// //               ))
// //         ],
// //       ),
// //       body: SingleChildScrollView(
// //         scrollDirection: Axis.vertical,
// //         physics: const AlwaysScrollableScrollPhysics(),
// //         child: SizedBox(
// //           height: MediaQuery.of(context).size.height,
// //           child: Stack(
// //             clipBehavior: Clip.none,
// //             children: [
// //               Container(
// //                 height: 296,
// //                 width: 390,
// //                 decoration: const BoxDecoration(
// //                   borderRadius: BorderRadius.only(
// //                       bottomLeft: Radius.circular(4),
// //                       bottomRight: Radius.circular(4)),
// //                   color: Color.fromRGBO(255, 98, 96, 1),
// //                 ),
// //                 child: Column(
// //                   children: [
// //                     const Text(
// //                       "Choose your seat !",
// //                       style: TextStyle(
// //                           color: Colors.white,
// //                           fontSize: 18,
// //                           fontWeight: FontWeight.w300),
// //                     ),
// //                     const SizedBox(height: 15),
// //                     Row(
// //                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// //                       children: [
// //                         const Text(
// //                           "Ahmedabad",
// //                           style: TextStyle(
// //                               color: Colors.white,
// //                               fontSize: 24,
// //                               fontWeight: FontWeight.normal),
// //                         ),
// //                         IconButton(
// //                           icon: const Icon(Icons.swap_horiz_outlined,
// //                               color: Colors.white),
// //                           onPressed: () {},
// //                         ),
// //                         const Text(
// //                           "Pune",
// //                           style: TextStyle(
// //                               color: Colors.white,
// //                               fontSize: 24,
// //                               fontWeight: FontWeight.normal),
// //                         ),
// //                       ],
// //                     ),
// //                     const SizedBox(
// //                       height: 15,
// //                     ),
// //                     const Text(
// //                       "12th - Jan - 2023 | Monday",
// //                       style: TextStyle(
// //                           fontSize: 18,
// //                           fontWeight: FontWeight.w400,
// //                           color: Color.fromRGBO(238, 238, 238, 1)),
// //                     ),
// //                     const SizedBox(
// //                       height: 10,
// //                     ),
// //                     Padding(
// //                       padding:
// //                           const EdgeInsets.only(top: 18, left: 26, right: 26),
// //                       child: Container(
// //                         height: 77,
// //                         width: 350,
// //                         decoration: BoxDecoration(
// //                           color: Colors.white,
// //                           borderRadius: BorderRadius.circular(10),
// //                         ),
// //                         child: const Column(
// //                           children: [
// //                             Row(
// //                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                               children: [
// //                                 Padding(
// //                                   padding: EdgeInsets.only(left: 12),
// //                                   child: Column(
// //                                     crossAxisAlignment:
// //                                         CrossAxisAlignment.start,
// //                                     children: [
// //                                       Text("7:25 PM - 5:30 AM",
// //                                           style: TextStyle(
// //                                               fontSize: 18,
// //                                               fontWeight: FontWeight.bold)),
// //                                       Text("Shrinath Travels",
// //                                           style: TextStyle(
// //                                               fontSize: 18,
// //                                               fontWeight: FontWeight.w500,
// //                                               color: Color.fromRGBO(
// //                                                   88, 86, 86, 1))),
// //                                       Text("A/C 2+1",
// //                                           style: TextStyle(
// //                                               fontSize: 14,
// //                                               fontWeight: FontWeight.w400)),
// //                                     ],
// //                                   ),
// //                                 ),
// //                                 Padding(
// //                                   padding: EdgeInsets.only(right: 12),
// //                                   child: Column(
// //                                     crossAxisAlignment: CrossAxisAlignment.end,
// //                                     children: [
// //                                       //Text("From",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w400,color: Color.fromRGBO(160, 160, 160, 1))),
// //                                       Padding(
// //                                         padding: EdgeInsets.only(top: 5),
// //                                         child: Text("₹ 630",
// //                                             style: TextStyle(
// //                                                 fontSize: 22,
// //                                                 fontWeight: FontWeight.w700,
// //                                                 color: Color.fromRGBO(
// //                                                     245, 165, 34, 1))),
// //                                       ),
// //                                       Padding(
// //                                         padding: EdgeInsets.only(top: 1),
// //                                         child: Text("7h 45m",
// //                                             style: TextStyle(
// //                                                 fontSize: 14,
// //                                                 fontWeight: FontWeight.w500,
// //                                                 color: Color.fromRGBO(
// //                                                     160, 160, 160, 1))),
// //                                       ),
// //                                     ],
// //                                   ),
// //                                 ),
// //                               ],
// //                             ),
// //                           ],
// //                         ),
// //                       ),
// //                     ),
// //                   ],
// //                 ),
// //               ),
// //               Positioned(
// //                 top: 265,
// //                 left: 23,
// //                 right: 23,
// //                 child: Container(
// //                   height: 513,
// //                   width: 350,
// //                   decoration: BoxDecoration(
// //                     boxShadow: [
// //                       const BoxShadow(
// //                           offset: Offset(0, 4),
// //                           blurRadius: 4,
// //                           color: Color.fromRGBO(0, 0, 0, 0.25)),
// //                     ],
// //                     borderRadius: BorderRadius.circular(8),
// //                     color: const Color.fromRGBO(
// //                         255, 255, 255, 1), //background: rgba(255, 255, 255, 1);
// //                   ),
// //                   child: Padding(
// //                     padding: const EdgeInsets.only(left: 20, top: 20),
// //                     child: Column(
// //                       children: [
// //                         Row(
// //                           crossAxisAlignment: CrossAxisAlignment.start,
// //                           children: [
// //                             Container(
// //                               height: 20,
// //                               width: 20,
// //                               decoration: BoxDecoration(
// //                                 borderRadius: BorderRadius.circular(5),
// //                                 color: const Color.fromRGBO(239, 154, 154,
// //                                     1), //background: rgba(239, 154, 154, 1);
// //                               ),
// //                             ),
// //                             const SizedBox(
// //                               width: 5,
// //                             ),
// //                             const Text("Booked",
// //                                 style: TextStyle(
// //                                     color: Color.fromRGBO(
// //                                       160,
// //                                       160,
// //                                       160,
// //                                       1,
// //                                     ),
// //                                     fontSize: 14,
// //                                     fontWeight: FontWeight.w500)),
// //                             Padding(
// //                               padding: const EdgeInsets.only(left: 20),
// //                               child: Row(
// //                                 children: [
// //                                   Container(
// //                                     height: 20,
// //                                     width: 20,
// //                                     decoration: BoxDecoration(
// //                                       borderRadius: BorderRadius.circular(5),
// //                                       color: const Color.fromRGBO(
// //                                           218, 217, 219, 1),
// //                                     ),
// //                                   ),
// //                                   const SizedBox(
// //                                     width: 5,
// //                                   ),
// //                                   const Text("Available",
// //                                       style: TextStyle(
// //                                           color:
// //                                               Color.fromRGBO(160, 160, 160, 1),
// //                                           fontSize: 14,
// //                                           fontWeight: FontWeight.w500)),
// //                                   Padding(
// //                                     padding: const EdgeInsets.only(left: 15),
// //                                     child: Row(
// //                                       children: [
// //                                         Container(
// //                                           height: 20,
// //                                           width: 20,
// //                                           decoration: BoxDecoration(
// //                                             borderRadius:
// //                                                 BorderRadius.circular(5),
// //                                             color: const Color.fromRGBO(
// //                                                 245, 165, 34, 1),
// //                                           ),
// //                                         ),
// //                                         const SizedBox(
// //                                           width: 5,
// //                                         ),
// //                                         const Text(
// //                                           "Your Seat",
// //                                           style: TextStyle(
// //                                               color: Color.fromRGBO(
// //                                                   160, 160, 160, 1),
// //                                               fontSize: 14,
// //                                               fontWeight: FontWeight.w500),
// //                                         ),
// //                                       ],
// //                                     ),
// //                                   ),
// //                                 ],
// //                               ),
// //                             ),
// //                           ],
// //                         ),
// //                         Column(
// //                           children: [
// //                             const Padding(
// //                               padding: EdgeInsets.only(left: 185, top: 30),
// //                               child: Image(
// //                                   image: AssetImage(
// //                                       "assets/images/steering-wheel.png")),
// //                             ),
// //                             Padding(
// //                               padding: const EdgeInsets.only(
// //                                 top: 20,
// //                                 left: 5,
// //                               ),
// //                               child: Row(
// //                                 children: [
// //                                   const Column(
// //                                     children: [
// //                                       SizedBox(
// //                                         height: 45,
// //                                       ),
// //                                       Text("1",
// //                                           style: TextStyle(
// //                                               fontSize: 14,
// //                                               fontWeight: FontWeight.w500,
// //                                               color: Color.fromRGBO(
// //                                                   160, 160, 160, 1))),
// //                                       SizedBox(
// //                                         height: 35,
// //                                       ),
// //                                       Text("2",
// //                                           style: TextStyle(
// //                                               fontSize: 14,
// //                                               fontWeight: FontWeight.w500,
// //                                               color: Color.fromRGBO(
// //                                                   160, 160, 160, 1))),
// //                                       SizedBox(
// //                                         height: 35,
// //                                       ),
// //                                       Text("3",
// //                                           style: TextStyle(
// //                                               fontSize: 14,
// //                                               fontWeight: FontWeight.w500,
// //                                               color: Color.fromRGBO(
// //                                                   160, 160, 160, 1))),
// //                                       SizedBox(
// //                                         height: 35,
// //                                       ),
// //                                       Text("4",
// //                                           style: TextStyle(
// //                                               fontSize: 14,
// //                                               fontWeight: FontWeight.w500,
// //                                               color: Color.fromRGBO(
// //                                                   160, 160, 160, 1))),
// //                                       SizedBox(
// //                                         height: 35,
// //                                       ),
// //                                       Text("5",
// //                                           style: TextStyle(
// //                                               fontSize: 14,
// //                                               fontWeight: FontWeight.w500,
// //                                               color: Color.fromRGBO(
// //                                                   160, 160, 160, 1))),
// //                                       SizedBox(
// //                                         height: 35,
// //                                       ),
// //                                       Text("6",
// //                                           style: TextStyle(
// //                                               fontSize: 14,
// //                                               fontWeight: FontWeight.w500,
// //                                               color: Color.fromRGBO(
// //                                                   160, 160, 160, 1))),
// //                                     ],
// //                                   ),
// //                                   Column(
// //                                     children: [
// //                                       const SizedBox(
// //                                         width: 80,
// //                                       ),
// //                                       const Text("A",
// //                                           style: TextStyle(
// //                                               fontSize: 14,
// //                                               fontWeight: FontWeight.w500,
// //                                               color: Color.fromRGBO(
// //                                                   160, 160, 160, 1))),
// //                                       const SizedBox(
// //                                         height: 20,
// //                                       ),
// //                                       Container(
// //                                         height: 35,
// //                                         width: 35,
// //                                         decoration: BoxDecoration(
// //                                           borderRadius:
// //                                               BorderRadius.circular(5),
// //                                           color: const Color.fromRGBO(
// //                                               239,
// //                                               154,
// //                                               154,
// //                                               1), //background: rgba(239, 154, 154, 1);
// //                                         ),
// //                                       ),
// //                                       const SizedBox(
// //                                         height: 20,
// //                                       ),
// //                                       GestureDetector(
// //                                         onTap: () {
// //                                           Navigator.of(context)
// //                                               .push(MaterialPageRoute(
// //                                             builder: (context) =>
// //                                                 const BoardDrop(),
// //                                           ));
// //                                         },
// //                                         child: Container(
// //                                           height: 35,
// //                                           width: 35,
// //                                           decoration: BoxDecoration(
// //                                             borderRadius:
// //                                                 BorderRadius.circular(5),
// //                                             color: const Color.fromRGBO(
// //                                                 245,
// //                                                 165,
// //                                                 34,
// //                                                 1), //background: rgba(245, 165, 34, 1);
// //                                           ),
// //                                         ),
// //                                       ),
// //                                       const SizedBox(
// //                                         height: 20,
// //                                       ),
// //                                       Container(
// //                                         height: 35,
// //                                         width: 35,
// //                                         decoration: BoxDecoration(
// //                                           borderRadius:
// //                                               BorderRadius.circular(5),
// //                                           color: const Color.fromRGBO(
// //                                               218,
// //                                               219,
// //                                               219,
// //                                               1), //background: rgba(218, 217, 219, 1);
// //                                         ),
// //                                       ),
// //                                       const SizedBox(
// //                                         height: 20,
// //                                       ),
// //                                       Container(
// //                                         height: 35,
// //                                         width: 35,
// //                                         decoration: BoxDecoration(
// //                                           borderRadius:
// //                                               BorderRadius.circular(5),
// //                                           color: const Color.fromRGBO(
// //                                               218,
// //                                               219,
// //                                               219,
// //                                               1), //background: rgba(218, 217, 219, 1);
// //                                         ),
// //                                       ),
// //                                       const SizedBox(
// //                                         height: 20,
// //                                       ),
// //                                       Container(
// //                                         height: 35,
// //                                         width: 35,
// //                                         decoration: BoxDecoration(
// //                                           borderRadius:
// //                                               BorderRadius.circular(5),
// //                                           color: const Color.fromRGBO(
// //                                               239,
// //                                               154,
// //                                               154,
// //                                               1), //background: rgba(239, 154, 154, 1);
// //                                         ),
// //                                       ),
// //                                       const SizedBox(
// //                                         height: 20,
// //                                       ),
// //                                       Container(
// //                                         height: 35,
// //                                         width: 35,
// //                                         decoration: BoxDecoration(
// //                                           borderRadius:
// //                                               BorderRadius.circular(5),
// //                                           color: const Color.fromRGBO(
// //                                               218,
// //                                               219,
// //                                               219,
// //                                               1), //background: rgba(218, 217, 219, 1);
// //                                         ),
// //                                       ),
// //                                     ],
// //                                   ),
// //                                   const SizedBox(
// //                                     width: 65,
// //                                   ),
// //                                   Column(
// //                                     children: [
// //                                       const Text("B",
// //                                           style: TextStyle(
// //                                               fontSize: 14,
// //                                               fontWeight: FontWeight.w500,
// //                                               color: Color.fromRGBO(
// //                                                   160, 160, 160, 1))),
// //                                       const SizedBox(
// //                                         height: 20,
// //                                       ),
// //                                       Container(
// //                                         height: 35,
// //                                         width: 35,
// //                                         decoration: BoxDecoration(
// //                                           borderRadius:
// //                                               BorderRadius.circular(5),
// //                                           color: const Color.fromRGBO(
// //                                               218,
// //                                               219,
// //                                               219,
// //                                               1), //background: rgba(218, 217, 219, 1);
// //                                         ),
// //                                       ),
// //                                       const SizedBox(
// //                                         height: 20,
// //                                       ),
// //                                       Container(
// //                                         height: 35,
// //                                         width: 35,
// //                                         decoration: BoxDecoration(
// //                                           borderRadius:
// //                                               BorderRadius.circular(5),
// //                                           color: const Color.fromRGBO(
// //                                               218,
// //                                               219,
// //                                               219,
// //                                               1), //background: rgba(218, 217, 219, 1);
// //                                         ),
// //                                       ),
// //                                       const SizedBox(
// //                                         height: 20,
// //                                       ),
// //                                       Container(
// //                                         height: 35,
// //                                         width: 35,
// //                                         decoration: BoxDecoration(
// //                                           borderRadius:
// //                                               BorderRadius.circular(5),
// //                                           color: const Color.fromRGBO(
// //                                               218,
// //                                               219,
// //                                               219,
// //                                               1), //background: rgba(218, 217, 219, 1);
// //                                         ),
// //                                       ),
// //                                       const SizedBox(
// //                                         height: 20,
// //                                       ),
// //                                       Container(
// //                                         height: 35,
// //                                         width: 35,
// //                                         decoration: BoxDecoration(
// //                                           borderRadius:
// //                                               BorderRadius.circular(5),
// //                                           color: const Color.fromRGBO(
// //                                               239,
// //                                               154,
// //                                               154,
// //                                               1), //background: rgba(239, 154, 154, 1);
// //                                         ),
// //                                       ),
// //                                       const SizedBox(
// //                                         height: 20,
// //                                       ),
// //                                       Container(
// //                                         height: 35,
// //                                         width: 35,
// //                                         decoration: BoxDecoration(
// //                                           borderRadius:
// //                                               BorderRadius.circular(5),
// //                                           color: const Color.fromRGBO(
// //                                               218,
// //                                               219,
// //                                               219,
// //                                               1), //background: rgba(218, 217, 219, 1);
// //                                         ),
// //                                       ),
// //                                       const SizedBox(
// //                                         height: 20,
// //                                       ),
// //                                       Container(
// //                                         height: 35,
// //                                         width: 35,
// //                                         decoration: BoxDecoration(
// //                                           borderRadius:
// //                                               BorderRadius.circular(5),
// //                                           color: const Color.fromRGBO(
// //                                               239,
// //                                               154,
// //                                               154,
// //                                               1), //background: rgba(239, 154, 154, 1);
// //                                         ),
// //                                       ),
// //                                     ],
// //                                   ),
// //                                   const SizedBox(
// //                                     width: 30,
// //                                   ),
// //                                   Column(
// //                                     children: [
// //                                       const Text("C",
// //                                           style: TextStyle(
// //                                               fontSize: 14,
// //                                               fontWeight: FontWeight.w500,
// //                                               color: Color.fromRGBO(
// //                                                   160, 160, 160, 1))),
// //                                       const SizedBox(
// //                                         height: 20,
// //                                       ),
// //                                       Container(
// //                                         height: 35,
// //                                         width: 35,
// //                                         decoration: BoxDecoration(
// //                                           borderRadius:
// //                                               BorderRadius.circular(5),
// //                                           color: const Color.fromRGBO(
// //                                               218,
// //                                               219,
// //                                               219,
// //                                               1), //background: rgba(218, 217, 219, 1);
// //                                         ),
// //                                       ),
// //                                       const SizedBox(
// //                                         height: 20,
// //                                       ),
// //                                       Container(
// //                                         height: 35,
// //                                         width: 35,
// //                                         decoration: BoxDecoration(
// //                                           borderRadius:
// //                                               BorderRadius.circular(5),
// //                                           color: const Color.fromRGBO(
// //                                               239,
// //                                               154,
// //                                               154,
// //                                               1), //background: rgba(239, 154, 154, 1);
// //                                         ),
// //                                       ),
// //                                       const SizedBox(
// //                                         height: 20,
// //                                       ),
// //                                       Container(
// //                                         height: 35,
// //                                         width: 35,
// //                                         decoration: BoxDecoration(
// //                                           borderRadius:
// //                                               BorderRadius.circular(5),
// //                                           color: const Color.fromRGBO(
// //                                               218,
// //                                               219,
// //                                               219,
// //                                               1), //background: rgba(218, 217, 219, 1);
// //                                         ),
// //                                       ),
// //                                       const SizedBox(
// //                                         height: 20,
// //                                       ),
// //                                       Container(
// //                                         height: 35,
// //                                         width: 35,
// //                                         decoration: BoxDecoration(
// //                                           borderRadius:
// //                                               BorderRadius.circular(5),
// //                                           color: const Color.fromRGBO(
// //                                               239,
// //                                               154,
// //                                               154,
// //                                               1), //background: rgba(239, 154, 154, 1);
// //                                         ),
// //                                       ),
// //                                       const SizedBox(
// //                                         height: 20,
// //                                       ),
// //                                       Container(
// //                                         height: 35,
// //                                         width: 35,
// //                                         decoration: BoxDecoration(
// //                                           borderRadius:
// //                                               BorderRadius.circular(5),
// //                                           color: const Color.fromRGBO(
// //                                               218,
// //                                               219,
// //                                               219,
// //                                               1), //background: rgba(218, 217, 219, 1);
// //                                         ),
// //                                       ),
// //                                       const SizedBox(
// //                                         height: 20,
// //                                       ),
// //                                       Container(
// //                                         height: 35,
// //                                         width: 35,
// //                                         decoration: BoxDecoration(
// //                                           borderRadius:
// //                                               BorderRadius.circular(5),
// //                                           color: const Color.fromRGBO(
// //                                               218,
// //                                               219,
// //                                               219,
// //                                               1), //background: rgba(218, 217, 219, 1);
// //                                         ),
// //                                       ),
// //                                     ],
// //                                   ),
// //                                 ],
// //                               ),
// //                             ),
// //                           ],
// //                         )
// //                       ],
// //                     ),
// //                   ),
// //                 ),
// //               ),
// //             ],
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }
// import 'package:flutter/material.dart';
//
// class select_Seat extends StatefulWidget {
//   String? busID;
//   String? date;
//
//   select_Seat({this.busID, this.date});
//
//   @override
//   State<select_Seat> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<select_Seat> {
//   List<List<int>> _chairStatus = List.generate(
//     6,
//         (index) => List.generate(3, (index) => 1),
//   );
//   List<String> _selectedSeats = [];
//
//   void _selectSeat(int row, int col) {
//     if (_chairStatus[row][col] == 1) {
//       if (_selectedSeats.length < 5) {
//         setState(() {
//           _chairStatus[row][col] = 2; // Mark as selected
//           _selectedSeats.add('${String.fromCharCode(row + 65)}${col + 1}');
//         });
//       } else {
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(
//             content: Text('You can select a maximum of 5 seats.'),
//           ),
//         );
//       }
//     } else if (_chairStatus[row][col] == 2) {
//       setState(() {
//         _chairStatus[row][col] = 1; // Deselect
//         _selectedSeats.remove('${String.fromCharCode(row + 65)}${col + 1}');
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: const Color.fromRGBO(255, 98, 96, 1),
//         title: const Text("Select Seat"),
//         actions: [
//           TextButton(
//             onPressed: () {},
//             child: const Text(
//               "Next",
//               style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 16,
//                   fontWeight: FontWeight.w400),
//             ),
//           ),
//         ],
//       ),
//       body: SingleChildScrollView(
//         scrollDirection: Axis.vertical,
//         physics: const AlwaysScrollableScrollPhysics(),
//         child: SizedBox(
//           height: MediaQuery.of(context).size.height,
//           child: Stack(
//             clipBehavior: Clip.none,
//             children: [
//               Container(
//                 height: 296,
//                 width: MediaQuery.of(context).size.width,
//                 decoration: const BoxDecoration(
//                   borderRadius: BorderRadius.only(
//                       bottomLeft: Radius.circular(4),
//                       bottomRight: Radius.circular(4)),
//                   color: Color.fromRGBO(255, 98, 96, 1),
//                 ),
//                 // Your existing UI code here
//               ),
//               Positioned(
//                 top: 265,
//                 left: 23,
//                 right: 23,
//                 child: Container(
//                   height: 513,
//                   width: 350,
//                   decoration: BoxDecoration(
//                     boxShadow: const [
//                       BoxShadow(
//                           offset: Offset(0, 4),
//                           blurRadius: 4,
//                           color: Color.fromRGBO(0, 0, 0, 0.25)),
//                     ],
//                     borderRadius: BorderRadius.circular(8),
//                     color: const Color.fromRGBO(255, 255, 255, 1),
//                   ),
//                   child: Padding(
//                     padding: const EdgeInsets.only(left: 20, top: 20),
//                     child: Column(
//                       children: [
//                         // Your existing UI code here
//                         // Seat map
//                         Column(
//                           children: List.generate(
//                             _chairStatus.length,
//                                 (row) => Row(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: List.generate(
//                                 _chairStatus[row].length,
//                                     (col) => GestureDetector(
//                                   onTap: () => _selectSeat(row, col),
//                                   child: Container(
//                                     height: 35,
//                                     width: 35,
//                                     margin: const EdgeInsets.all(5),
//                                     decoration: BoxDecoration(
//                                       borderRadius: BorderRadius.circular(5),
//                                       color: _chairStatus[row][col] == 1
//                                           ? const Color.fromRGBO(
//                                           239, 154, 154, 1) // Booked
//                                           : _chairStatus[row][col] == 2
//                                           ? const Color.fromRGBO(
//                                           245, 165, 34, 1) // Selected
//                                           : const Color.fromRGBO(218, 217,
//                                           219, 1), // Available
//                                     ),
//                                     child: Center(
//                                       child: Text(
//                                         "${String.fromCharCode(row + 65)}${col + 1}",
//                                         style: const TextStyle(
//                                             fontSize: 12,
//                                             fontWeight: FontWeight.bold),
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                         const SizedBox(height: 20),
//                         // Selected seats
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             const Text(
//                               "Selected Seats: ",
//                               style: TextStyle(
//                                   fontSize: 16, fontWeight: FontWeight.bold),
//                             ),
//                             Text(
//                               _selectedSeats.join(', '),
//                               style: const TextStyle(fontSize: 16),
//                             ),
//                           ],
//                         ),
//                         Text('BusID:${widget.busID.toString()}'),
//                         Text('Date:${widget.date.toString()}'),
//                       ],
//                     ),
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
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:project/model/seatselect.dart';

void main() {
  runApp(const SeatSelect(busID: '', date: ''));
}

class SeatSelect extends StatefulWidget {
  const SeatSelect({Key? key, required this.busID, required this.date}) : super(key: key);

  final String busID;
  final String date;

  @override
  State<SeatSelect> createState() => _SeatSelectState();
}

class _SeatSelectState extends State<SeatSelect> {
  List<SeatSel> seat = [];
  bool d = true;

  var sI = [];

  void _getSeat() async {
    var res = await http.post(
      Uri.parse('https://busbooking.bestdevelopmentteam.com/Api/setas.php'),
      body: jsonEncode({"bus_id": 24, "date": "2024/03/11"}),
      headers: {'Content-Type': 'application/json'},
    );
    if (res.statusCode == 200) {
      var data = jsonDecode(res.body);
      seat = (data['seats'] as List).map((e) => SeatSel.fromJson(e)).toList();
      print(res.body);
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
    _getSeat();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        actions: [
          TextButton(
            style: TextButton.styleFrom(foregroundColor: Colors.white),
            onPressed: () {},
            child: Text('Next'),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(58.0),
        child: Column(
          children: [
            Expanded(
              child: Card(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 10,
                  ),
                  itemCount: seat.length,
                  itemBuilder: (context, index) {
                    final s = seat[index];
                    final color = s.bookedStatus == true
                        ? Colors.grey
                        : s.userSelected == true
                        ? Colors.orangeAccent
                        : Colors.green;

                    return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: GestureDetector(
                        onTap: () {
                          if (s.userSelected == false && s.bookedStatus == false && sI.length < 5) {
                            setState(() {
                              s.userSelected = true;
                              sI.add(s.seatNo.toString());
                              print(sI);
                              print(s.userSelected);
                            });
                          } else if (s.userSelected == true) {
                            setState(() {
                              s.userSelected = false;
                              sI.remove(s.seatNo.toString());
                              print(sI);
                              print(s.userSelected);
                            });
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                backgroundColor: Colors.red,
                                behavior: SnackBarBehavior.floating,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                                content: Text('You can only select up to 5 seats!'),
                              ),
                            );
                          }
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: color,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          width: 50,
                          height: 50,
                          alignment: Alignment.center,
                          child: Text(
                            '${s.seatNo.toString()}',
                            style: TextStyle(
                              color: s.bookedStatus! ? Colors.white : Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            Text(
              'Selected Seats: ${sI.join(", ")}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}