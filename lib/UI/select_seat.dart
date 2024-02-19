import 'package:flutter/material.dart';
import 'package:project/UI/board_drop.dart';

class SelectSeat extends StatefulWidget {
  const SelectSeat({super.key});

  @override
  State<SelectSeat> createState() => _SelectSeatState();
}

class _SelectSeatState extends State<SelectSeat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:  const Color.fromRGBO(255, 98, 96, 1),
        surfaceTintColor:  const Color.fromRGBO(255, 98, 96, 1),
        actions: [
          TextButton(onPressed: (){}, child:  const Text("Next",style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.w400),))
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics:  const AlwaysScrollableScrollPhysics(),
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                height: 296,
                width: 390,
                decoration:  const BoxDecoration(
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(4),bottomRight: Radius.circular(4)),
                  color: Color.fromRGBO(255, 98, 96, 1),
                ),
                child: Column(
                  children: [
                    const Text("Choose your seat !", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w300),),
                    const SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Text("Ahmedabad", style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.normal),),
                        IconButton(icon:  const Icon(Icons.swap_horiz_outlined, color: Colors.white), onPressed: () {},),
                        const Text("Pune", style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.normal),),
                      ],
                    ),
                    const SizedBox(height: 15,),
                    const Text("12th - Jan - 2023 | Monday",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400,color: Color.fromRGBO(238, 238, 238, 1)),),
                    const SizedBox(height: 10,),
                    Padding(
                      padding:  const EdgeInsets.only(top: 18,left: 26,right: 26),
                      child: Container(
                        height: 77,
                        width: 350,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 12),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("7:25 PM - 5:30 AM",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
                                      Text("Shrinath Travels",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500,color: Color.fromRGBO(88, 86, 86, 1))),
                                      Text("A/C 2+1",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400)),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(right: 12),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      //Text("From",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w400,color: Color.fromRGBO(160, 160, 160, 1))),
                                      Padding(
                                        padding: EdgeInsets.only(top: 5),
                                        child: Text("₹ 630",style: TextStyle(fontSize: 22,fontWeight: FontWeight.w700,color: Color.fromRGBO(245, 165, 34, 1))),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(top: 1),
                                        child: Text("7h 45m",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500,color: Color.fromRGBO(160, 160, 160, 1))),
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
              Positioned(
                top: 265,
                left: 23,
                right: 23,
                child: Container(
                  height: 513,
                  width: 350,
                  decoration: BoxDecoration(
                    boxShadow:  [
                      const BoxShadow(offset: Offset(0, 4),blurRadius: 4,color: Color.fromRGBO(0, 0, 0, 0.25)),
                    ],
                    borderRadius: BorderRadius.circular(8),
                    color:  const Color.fromRGBO(255, 255, 255, 1),//background: rgba(255, 255, 255, 1);
                  ),
                  child: Padding(
                    padding:  const EdgeInsets.only(left: 20,top: 20),
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 20,
                              width: 20,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color:  const Color.fromRGBO(239, 154, 154, 1),//background: rgba(239, 154, 154, 1);
                              ),
                            ),
                            const SizedBox(width: 5,),
                            const Text("Booked",style: TextStyle(color: Color.fromRGBO(160, 160, 160, 1,),fontSize: 14,fontWeight: FontWeight.w500)),

                            Padding(
                              padding:  const EdgeInsets.only(left: 20),
                              child: Row(
                                children: [
                                  Container(
                                    height: 20,
                                    width: 20,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color:  const Color.fromRGBO(218, 217, 219, 1),
                                    ),
                                  ),
                                  const SizedBox(width: 5,),
                                  const Text("Available",style: TextStyle(color: Color.fromRGBO(160, 160, 160, 1),fontSize: 14,fontWeight: FontWeight.w500)),

                                  Padding(
                                    padding:  const EdgeInsets.only(left: 15),
                                    child: Row(
                                      children: [
                                        Container(
                                          height: 20,
                                          width: 20,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(5),
                                            color:  const Color.fromRGBO(245, 165, 34, 1),
                                          ),
                                        ),
                                        const SizedBox(width: 5,),
                                        const Text("Your Seat",style: TextStyle(color: Color.fromRGBO(160, 160, 160, 1),fontSize: 14,fontWeight: FontWeight.w500),),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),

                        Column(
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(left: 185,top: 30),
                              child: Image(image: AssetImage("assets/images/steering-wheel.png")),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 20,left: 5,),
                              child: Row(
                                children: [
                                  const Column(
                                    children: [
                                      SizedBox(height: 45,),
                                      Text("1",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500,color: Color.fromRGBO(160, 160, 160, 1))),
                                      SizedBox(height: 35,),
                                      Text("2",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500,color: Color.fromRGBO(160, 160, 160, 1))),
                                      SizedBox(height: 35,),
                                      Text("3",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500,color: Color.fromRGBO(160, 160, 160, 1))),
                                      SizedBox(height: 35,),
                                      Text("4",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500,color: Color.fromRGBO(160, 160, 160, 1))),
                                      SizedBox(height: 35,),
                                      Text("5",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500,color: Color.fromRGBO(160, 160, 160, 1))),
                                      SizedBox(height: 35,),
                                      Text("6",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500,color: Color.fromRGBO(160, 160, 160, 1))),
                                    ],
                                  ),

                                  Column(
                                    children: [
                                      const SizedBox(width: 80,),
                                      const Text("A",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500,color: Color.fromRGBO(160, 160, 160, 1))),
                                      const SizedBox(height: 20,),
                                      Container(
                                        height: 35,
                                        width: 35,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(5),
                                          color: const Color.fromRGBO(239, 154, 154, 1),//background: rgba(239, 154, 154, 1);
                                        ),
                                      ),
                                      const SizedBox(height: 20,),
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => const BoardDrop(),));
                                        },
                                        child: Container(
                                          height: 35,
                                          width: 35,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(5),
                                            color: const Color.fromRGBO(245, 165, 34, 1),//background: rgba(245, 165, 34, 1);
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 20,),
                                      Container(
                                        height: 35,
                                        width: 35,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(5),
                                          color: const Color.fromRGBO(218, 219, 219, 1),//background: rgba(218, 217, 219, 1);
                                        ),
                                      ),
                                      const SizedBox(height: 20,),
                                      Container(
                                        height: 35,
                                        width: 35,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(5),
                                          color: const Color.fromRGBO(218, 219, 219, 1),//background: rgba(218, 217, 219, 1);
                                        ),
                                      ),
                                      const SizedBox(height: 20,),
                                      Container(
                                        height: 35,
                                        width: 35,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(5),
                                          color: const Color.fromRGBO(239, 154, 154, 1),//background: rgba(239, 154, 154, 1);
                                        ),
                                      ),
                                      const SizedBox(height: 20,),
                                      Container(
                                        height: 35,
                                        width: 35,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(5),
                                          color: const Color.fromRGBO(218, 219, 219, 1),//background: rgba(218, 217, 219, 1);
                                        ),
                                      ),
                                    ],
                                  ),

                                  const SizedBox(width: 65,),
                                  Column(
                                    children: [
                                      const Text("B",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500,color: Color.fromRGBO(160, 160, 160, 1))),
                                      const SizedBox(height: 20,),
                                      Container(
                                        height: 35,
                                        width: 35,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(5),
                                          color: const Color.fromRGBO(218, 219, 219, 1),//background: rgba(218, 217, 219, 1);
                                        ),
                                      ),
                                      const SizedBox(height: 20,),
                                      Container(
                                        height: 35,
                                        width: 35,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(5),
                                          color: const Color.fromRGBO(218, 219, 219, 1),//background: rgba(218, 217, 219, 1);
                                        ),
                                      ),
                                      const SizedBox(height: 20,),
                                      Container(
                                        height: 35,
                                        width: 35,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(5),
                                          color: const Color.fromRGBO(218, 219, 219, 1),//background: rgba(218, 217, 219, 1);
                                        ),
                                      ),
                                      const SizedBox(height: 20,),
                                      Container(
                                        height: 35,
                                        width: 35,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(5),
                                          color: const Color.fromRGBO(239, 154, 154, 1),//background: rgba(239, 154, 154, 1);
                                        ),
                                      ),
                                      const SizedBox(height: 20,),
                                      Container(
                                        height: 35,
                                        width: 35,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(5),
                                          color: const Color.fromRGBO(218, 219, 219, 1),//background: rgba(218, 217, 219, 1);
                                        ),
                                      ),
                                      const SizedBox(height: 20,),
                                      Container(
                                        height: 35,
                                        width: 35,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(5),
                                          color: const Color.fromRGBO(239, 154, 154, 1),//background: rgba(239, 154, 154, 1);
                                        ),
                                      ),
                                    ],
                                  ),


                                  const SizedBox(width: 30,),
                                  Column(
                                    children: [
                                      const Text("C",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500,color: Color.fromRGBO(160, 160, 160, 1))),
                                      const SizedBox(height: 20,),
                                      Container(
                                        height: 35,
                                        width: 35,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(5),
                                          color: const Color.fromRGBO(218, 219, 219, 1),//background: rgba(218, 217, 219, 1);
                                        ),
                                      ),
                                      const SizedBox(height: 20,),
                                      Container(
                                        height: 35,
                                        width: 35,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(5),
                                          color: const Color.fromRGBO(239, 154, 154, 1),//background: rgba(239, 154, 154, 1);
                                        ),
                                      ),
                                      const SizedBox(height: 20,),
                                      Container(
                                        height: 35,
                                        width: 35,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(5),
                                          color: const Color.fromRGBO(218, 219, 219, 1),//background: rgba(218, 217, 219, 1);
                                        ),
                                      ),
                                      const SizedBox(height: 20,),
                                      Container(
                                        height: 35,
                                        width: 35,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(5),
                                          color: const Color.fromRGBO(239, 154, 154, 1),//background: rgba(239, 154, 154, 1);
                                        ),
                                      ),
                                      const SizedBox(height: 20,),
                                      Container(
                                        height: 35,
                                        width: 35,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(5),
                                          color: const Color.fromRGBO(218, 219, 219, 1),//background: rgba(218, 217, 219, 1);
                                        ),
                                      ),
                                      const SizedBox(height: 20,),
                                      Container(
                                        height: 35,
                                        width: 35,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(5),
                                          color: const Color.fromRGBO(218, 219, 219, 1),//background: rgba(218, 217, 219, 1);
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
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
