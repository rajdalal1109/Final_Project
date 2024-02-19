import 'package:flutter/material.dart';
import 'package:project/UI/pass-detail.dart';

class BoardDrop extends StatefulWidget {
  const BoardDrop({super.key});

  @override
  State<BoardDrop> createState() => _BoardDropState();
}

class _BoardDropState extends State<BoardDrop> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:  const Color.fromRGBO(255, 98, 96, 1),
        surfaceTintColor:  const Color.fromRGBO(255, 98, 96, 1),
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
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(8),bottomRight: Radius.circular(8)),
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
                    borderRadius: BorderRadius.circular(20),
                    color:  const Color.fromRGBO(255, 255, 255, 1),//background: rgba(255, 255, 255, 1);
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 40,left: 10,right: 10),
                    child: TextField(
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.exit_to_app_sharp,size: 22),
                        labelText: "Select Boarding Point",
                        hintText: "Select Boarding Point",
                        hintStyle: const TextStyle(fontSize: 14,fontWeight: FontWeight.w400,color: Color.fromRGBO(88, 86, 86, 1)),
                        suffixIcon: IconButton(onPressed: (){}, icon: const Icon(Icons.keyboard_arrow_down_sharp,size: 24,)),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 400,right: 33,left: 33),
                child: TextField(
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.pin_drop_sharp,size: 22),
                    labelText: "Select Drop Point",
                    hintText: "Select Drop Point",
                    hintStyle: const TextStyle(fontSize: 14,fontWeight: FontWeight.w400,color: Color.fromRGBO(88, 86, 86, 1)),
                    suffixIcon: IconButton(onPressed: (){}, icon: const Icon(Icons.keyboard_arrow_down_sharp,size: 24,)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 680,left: 40,right:40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Select Seat",style: TextStyle(fontWeight: FontWeight.w400,color: Color.fromRGBO(86, 86, 86, 1))),
                    Text("Total Fare",style: TextStyle(fontWeight: FontWeight.w400,color: Color.fromRGBO(86, 86, 86, 1))),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 695,left: 40,right:40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("2A",style: TextStyle(fontWeight: FontWeight.w700)),
                    Text("₹ 630",style: TextStyle(fontWeight: FontWeight.w700)),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => const PassDeatils(),));
                },
                child: Container(
                    margin: const EdgeInsets.only(top: 720,left: 35,right: 35),
                    width: 338,
                    decoration: BoxDecoration
                      (
                      color: const Color.fromRGBO(255, 98, 96, 1),//background: rgba(255, 98, 96, 1);
                      borderRadius: BorderRadius.circular(8),
                    ),
                    height: 50,
                    child: const Center(
                        child: Text("Proceed", style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.w400),)
                    )
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
