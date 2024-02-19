//import 'package:project/UI/select_seat.dart';
import 'package:flutter/material.dart';
import 'package:project/UI/select_seat.dart';

class FindBus extends StatefulWidget {
  const FindBus({super.key});

  @override
  State<FindBus> createState() => _FindBusState();
}

class _FindBusState extends State<FindBus> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(255, 98, 96, 1),
        surfaceTintColor: const Color.fromRGBO(255, 98, 96, 1),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.filter_alt_outlined,color: Colors.white,size: 25,))
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: const AlwaysScrollableScrollPhysics(),
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                height: 296,
                width: 390,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(3),bottomRight: Radius.circular(3)),
                  color: Color.fromRGBO(255, 98, 96, 1),
                ),
                child: Column(
                  children: [
                    const Text("Select your bus !", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w300),),
                    const SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Text("Ahmedabad", style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.normal),),
                        IconButton(icon: const Icon(Icons.swap_horiz_outlined, color: Colors.white), onPressed: () {},),
                        const Text("Pune", style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.normal),),
                      ],
                    ),
                    const SizedBox(height: 15,),
                    const Text("12th - Jan - 2023 | Monday",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400,color: Color.fromRGBO(238, 238, 238, 1)),),
                    // Container(
                    //   width: 300,
                    //   child: TextField(
                    //     controller: dateController,
                    //     onTap: () async {
                    //       final DateTime? pickedDate = await showDatePicker(
                    //         context: context,
                    //         initialDate: DateTime.now(),
                    //         firstDate: DateTime(2024),
                    //         lastDate: DateTime(2030),
                    //       );
                    //       if (pickedDate != null) {
                    //         setState(() {
                    //           selectedDate = pickedDate;
                    //           dateController.text = DateFormat('dd-MMM-yyyy | EEEE').format(selectedDate!);
                    //         });
                    //       } else {
                    //         ScaffoldMessenger.of(context).showSnackBar(
                    //           const SnackBar(
                    //             content: Text("Please Select Date !!"),
                    //           ),
                    //         );
                    //       }
                    //     },
                    //     decoration: InputDecoration(
                    //       border: OutlineInputBorder(
                    //         borderRadius: BorderRadius.circular(20),
                    //       ),
                    //       prefixIcon: const Icon(Icons.date_range, color: Colors.white),
                    //       labelText: "Date",
                    //       labelStyle: const TextStyle(color: Colors.white),
                    //       hintText: "Select Date",
                    //     ),
                    //   ),
                    // ),
                    const SizedBox(height: 10,),
                    const Image(image: AssetImage("assets/images/find_page.png"),height: 110,width: 110),
                  ],
                ),
              ),
              Positioned(
                //1
                top: 261,
                left: 20,
                right: 20,
                child: Container(
                  height: 104,
                  width: 350,
                  decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(offset: Offset(0, 4),blurRadius: 4,color: Color.fromRGBO(0, 0, 0, 0.25)),
                    ],
                    borderRadius: BorderRadius.circular(8),
                    color: const Color.fromRGBO(255, 255, 255, 1),//background: rgba(255, 255, 255, 1);
                  ),
                  child: const Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 8,left: 12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Sangitam Travels",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400)),
                                Text("A/C Sleeper (2+2)",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w300)),
                                Text("6:00 PM - 3:00 AM",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w400)),
                                Padding(
                                  padding: EdgeInsets.only(top: 5),
                                  child: Text("15 Seats left",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w300,color: Color.fromRGBO(67, 160, 71, 1))),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 6,right: 12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(1),
                                  child: Text("₹ 600",style: TextStyle(fontSize: 22,fontWeight: FontWeight.w700,color: Color.fromRGBO(245, 165, 34, 1))),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 5),
                                  child: Text("9h",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400)),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 15),
                                  child: Row(
                                    children: [
                                      Icon(Icons.gps_fixed_outlined,size: 14,color: Color.fromRGBO(97, 97, 97, 1)),
                                      SizedBox(width: 5,),
                                      Icon(Icons.confirmation_num_sharp,size: 14,color: Color.fromRGBO(97, 97, 97, 1)),
                                      SizedBox(width: 5,),
                                      Icon(Icons.charging_station_outlined,size: 14,color: Color.fromRGBO(97, 97, 97, 1)),
                                      SizedBox(width: 5,),
                                      Icon(Icons.logout_rounded,size: 14,color: Color.fromRGBO(97, 97, 97, 1)),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                //2
                top: 385,
                left: 20,
                right: 20,
                child: Container(
                  height: 104,
                  width: 350,
                  decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(offset: Offset(0, 4),blurRadius: 4,color: Color.fromRGBO(0, 0, 0, 0.25)),
                    ],
                    borderRadius: BorderRadius.circular(8),
                    color: const Color.fromRGBO(255, 255, 255, 1),//background: rgba(255, 255, 255, 1);
                  ),
                  child: const Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 8,left: 12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Shree Sairam Travels",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400)),
                                Text("A/C Sleeper 2+1",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w300)),
                                Text("8:15 PM - 6:00 AM",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w400)),
                                Padding(
                                  padding: EdgeInsets.only(top: 5),
                                  child: Text("2 Seats left",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w300,color: Color.fromRGBO(255, 98, 96, 1))),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 6,right: 12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(1),
                                  child: Text("₹ 550",style: TextStyle(fontSize: 22,fontWeight: FontWeight.w700,color: Color.fromRGBO(245, 165, 34, 1))),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 5),
                                  child: Text("9h 45m",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400)),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 15),
                                  child: Row(
                                    children: [
                                      Icon(Icons.gps_fixed_outlined,size: 14,color: Color.fromRGBO(97, 97, 97, 1)),
                                      SizedBox(width: 5,),
                                      Icon(Icons.confirmation_num_sharp,size: 14,color: Color.fromRGBO(97, 97, 97, 1)),
                                      SizedBox(width: 5,),
                                      Icon(Icons.charging_station_outlined,size: 14,color: Color.fromRGBO(97, 97, 97, 1)),
                                      SizedBox(width: 5,),
                                      Icon(Icons.logout_rounded,size: 14,color: Color.fromRGBO(97, 97, 97, 1)),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                //3
                top: 509,
                left: 20,
                right: 20,
                child: Container(
                  height: 104,
                  width: 350,
                  decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(offset: Offset(0, 4),blurRadius: 4,color: Color.fromRGBO(0, 0, 0, 0.25)),
                    ],
                    borderRadius: BorderRadius.circular(8),
                    color: const Color.fromRGBO(255, 255, 255, 1),//background: rgba(255, 255, 255, 1);
                  ),
                  child: const Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 8,left: 12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Gayatri Travels",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400)),
                                Text("A/C Sleeper (2+2)",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w300)),
                                Text("8:30 PM - 5:30 AM",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w400)),
                                Padding(
                                  padding: EdgeInsets.only(top: 5),
                                  child: Text("21 Seats left",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w300,color: Color.fromRGBO(67, 160, 71, 1))),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 6,right: 12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(1),
                                  child: Text("₹ 700",style: TextStyle(fontSize: 22,fontWeight: FontWeight.w700,color: Color.fromRGBO(245, 165, 34, 1))),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 5),
                                  child: Text("9h",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400)),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 15),
                                  child: Row(
                                    children: [
                                      Icon(Icons.gps_fixed_outlined,size: 14,color: Color.fromRGBO(97, 97, 97, 1)),
                                      SizedBox(width: 5,),
                                      Icon(Icons.confirmation_num_sharp,size: 14,color: Color.fromRGBO(97, 97, 97, 1)),
                                      SizedBox(width: 5,),
                                      Icon(Icons.charging_station_outlined,size: 14,color: Color.fromRGBO(97, 97, 97, 1)),
                                      SizedBox(width: 5,),
                                      Icon(Icons.logout_rounded,size: 14,color: Color.fromRGBO(97, 97, 97, 1)),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                //4
                top: 633,
                left: 20,
                right: 20,
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const SelectSeat(),));
                  },
                  child: Container(
                    height: 104,
                    width: 350,
                    decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(offset: Offset(0, 4),blurRadius: 4,color: Color.fromRGBO(0, 0, 0, 0.25)),
                      ],
                      borderRadius: BorderRadius.circular(8),
                      color: const Color.fromRGBO(255, 255, 255, 1),//background: rgba(255, 255, 255, 1);
                    ),
                    child: const Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 8,left: 12),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Shrinath Travels",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400)),
                                  Text("A/C (2+1)",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w300)),
                                  Text("7:25 PM - 5:30 AM",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w400)),
                                  Padding(
                                    padding: EdgeInsets.only(top: 5),
                                    child: Text("1 Seats left",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w300,color: Colors.red)),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 6,right: 12),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.all(1),
                                    child: Text("₹ 630",style: TextStyle(fontSize: 22,fontWeight: FontWeight.w700,color: Color.fromRGBO(245, 165, 34, 1))),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 5),
                                    child: Text("7h 45m",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400)),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 15),
                                    child: Row(
                                      children: [
                                        Icon(Icons.gps_fixed_outlined,size: 14,color: Color.fromRGBO(97, 97, 97, 1)),
                                        SizedBox(width: 5,),
                                        Icon(Icons.confirmation_num_sharp,size: 14,color: Color.fromRGBO(97, 97, 97, 1)),
                                        SizedBox(width: 5,),
                                        Icon(Icons.charging_station_outlined,size: 14,color: Color.fromRGBO(97, 97, 97, 1)),
                                        SizedBox(width: 5,),
                                        Icon(Icons.logout_rounded,size: 14,color: Color.fromRGBO(97, 97, 97, 1)),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                //5
                top: 757,
                left: 20,
                right: 20,
                child: Container(
                  height: 104,
                  width: 350,
                  decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(offset: Offset(0, 4),blurRadius: 4,color: Color.fromRGBO(0, 0, 0, 0.25)),
                    ],
                    borderRadius: BorderRadius.circular(8),
                    color: const Color.fromRGBO(255, 255, 255, 1),//background: rgba(255, 255, 255, 1);
                  ),
                  child: const Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 8,left: 12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Shri Swaminarayan Travels",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400)),
                                Text("Non A/C Sleeper 2+1",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w300)),
                                Text("7:30 PM - 6:10 AM",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w400)),
                                Padding(
                                  padding: EdgeInsets.only(top: 5),
                                  child: Text("15 Seats left",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w300,color: Color.fromRGBO(67, 160, 71, 1))),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 6,right: 12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(1),
                                  child: Text("₹ 850",style: TextStyle(fontSize: 22,fontWeight: FontWeight.w700,color: Color.fromRGBO(245, 165, 34, 1))),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 5),
                                  child: Text("9h",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400)),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 15),
                                  child: Row(
                                    children: [
                                      Icon(Icons.gps_fixed_outlined,size: 14,color: Color.fromRGBO(97, 97, 97, 1)),
                                      SizedBox(width: 5,),
                                      Icon(Icons.confirmation_num_sharp,size: 14,color: Color.fromRGBO(97, 97, 97, 1)),
                                      SizedBox(width: 5,),
                                      Icon(Icons.charging_station_outlined,size: 14,color: Color.fromRGBO(97, 97, 97, 1)),
                                      SizedBox(width: 5,),
                                      Icon(Icons.logout_rounded,size: 14,color: Color.fromRGBO(97, 97, 97, 1)),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                //6
                top: 852,
                left: 20,
                right: 20,
                child: Container(
                  height: 104,
                  width: 350,
                  decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(offset: Offset(0, 4),blurRadius: 4,color: Color.fromRGBO(0, 0, 0, 0.25)),
                    ],
                    borderRadius: BorderRadius.circular(8),
                    color: const Color.fromRGBO(255, 255, 255, 1),//background: rgba(255, 255, 255, 1);
                  ),
                  child: const Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 8,left: 12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Sangitam Travels",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400)),
                                Text("A/C Sleeper (2+2)",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w300)),
                                Text("6:00 PM - 3:000 PM",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w400)),
                                Padding(
                                  padding: EdgeInsets.only(top: 5),
                                  child: Text("15 Seats left",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w300,color: Color.fromRGBO(67, 160, 71, 1))),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 6,right: 12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(1),
                                  child: Text("₹ 600",style: TextStyle(fontSize: 22,fontWeight: FontWeight.w700,color: Color.fromRGBO(245, 165, 34, 1))),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 5),
                                  child: Text("9h",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400)),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 15),
                                  child: Row(
                                    children: [
                                      Icon(Icons.gps_fixed_outlined,size: 14,color: Color.fromRGBO(97, 97, 97, 1)),
                                      SizedBox(width: 5,),
                                      Icon(Icons.confirmation_num_sharp,size: 14,color: Color.fromRGBO(97, 97, 97, 1)),
                                      SizedBox(width: 5,),
                                      Icon(Icons.charging_station_outlined,size: 14,color: Color.fromRGBO(97, 97, 97, 1)),
                                      SizedBox(width: 5,),
                                      Icon(Icons.logout_rounded,size: 14,color: Color.fromRGBO(97, 97, 97, 1)),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
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
