import 'package:flutter/material.dart';
import 'package:project/UI/homepage_1.dart';

class ConfirmTickets extends StatefulWidget {
  const ConfirmTickets({super.key});

  @override
  State<ConfirmTickets> createState() => _TicketsState();
}

class _TicketsState extends State<ConfirmTickets> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Tickets",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w500)),
        backgroundColor: Color.fromRGBO(255, 98, 96, 1),//background: rgba(255, 98, 96, 1);
        surfaceTintColor: Color.fromRGBO(255, 98, 96, 1),
      ),
      body:
      SingleChildScrollView(
        child: Container(
          height: 792,
          width: 393,
          color: Color.fromRGBO(255, 98, 96, 1),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Booking Confirmed",style: TextStyle(fontSize: 22,fontWeight: FontWeight.w700,color: Colors.white)),
                    SizedBox(width: 5),
                    Image.asset("assets/images/confirm.png"),
                    // ImageIcon(AssetImage("assets/images/confirm.png")),
                  ],
                ),
                SizedBox(height: 10),
                Text("We have send you the ticket copy on your E-mail",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400,color: Colors.white)),
                Text("abc@gmail.com",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500,color: Colors.white)),

                SizedBox(height: 40),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                      height: 250,
                      width: 350,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Color.fromRGBO(245, 165, 34, 1),//background: rgba(245, 165, 34, 1);
                          //color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.white,
                                spreadRadius: 0.5,
                                blurRadius: 10,
                                blurStyle: BlurStyle.normal,
                                offset: Offset(2, 2))
                          ]
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 8,),
                          const Text("PNR/Ticket No:13392789",style: TextStyle(color: Colors.white,fontSize: 14,fontWeight: FontWeight.w500)),
                          const Divider(thickness: 1,color: Colors.white,),
                          Row(
                            children: [
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      const Expanded(flex:0,child: Icon(Icons.exit_to_app_sharp,size: 20)),
                                      const SizedBox(width: 10,),
                                      Expanded(flex: 0,
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            const Text("Boarding Point",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500,color: Colors.white)),
                                            Container(
                                              width: 200,
                                              child: const Text("8:05 PM, New Sangavi - Pick up near Sangavi Phata New Sangavi - Pick up near Sanavi Phata, 9595951132, 9028298789",
                                                  style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500,overflow: TextOverflow.clip)
                                              ),
                                            ),

                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 10,),
                                  Row(
                                    children: [
                                      const Expanded(flex:0,child: Icon(Icons.pin_drop,size: 20)),
                                      const SizedBox(width: 10,),
                                      Expanded(flex: 0,
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            const Text("Drop Point",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500,color: Colors.white)),
                                            Container(
                                              width: 200,
                                              child: const Text("6:30 AM, DeepNagar,DeepNagar",
                                                  style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500,overflow: TextOverflow.clip)
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Container(width: 2,color: Colors.white.withOpacity(0.5),height: 120,),
                              const SizedBox(width: 10,),
                              const Expanded(
                                flex: 0,
                                child: Column(
                                  children: [
                                    Text("Ahmedabad",style: TextStyle(color: Colors.white)),
                                    Text("8:05 PM",style:TextStyle(fontSize: 14,fontWeight: FontWeight.w500)),
                                    Text("Sun, 13 Jan",style:TextStyle(fontSize: 10,fontWeight: FontWeight.w500)),
                                    SizedBox(height: 8,),
                                    Text("TO",style: TextStyle(fontSize: 10,fontWeight: FontWeight.w500,color: Color.fromRGBO(245, 165, 34, 1))),
                                    SizedBox(height: 5,),
                                    Text("Pune",style: TextStyle(color: Colors.white)),
                                    Text("6:30 AM",style:TextStyle(fontSize: 14,fontWeight: FontWeight.w500)),
                                    Text("Mon, 14 Jan",style:TextStyle(fontSize: 10,fontWeight: FontWeight.w500)),
                                  ],
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 13,),
                          const Divider(thickness: 1,color: Colors.white),
                          const Row(
                            children: [
                              Expanded(flex: 0,child: Icon(Icons.directions_bus)),
                              SizedBox(width: 10,),
                              Expanded(
                                flex: 0,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Sangitam Travels",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500)),
                                    Text("2X1 (30) A/C SLEEPER",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500,color: Colors.white)),
                                  ],
                                ),
                              ),
                              SizedBox(width: 115,),
                              Text("1 Seat",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500)),
                            ],
                          ),
                        ],
                      )
                  ),
                ),

                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(name: '',)));
                  },
                  child: Container(
                      margin: const EdgeInsets.only(top: 210),
                      width: 305,
                      decoration: BoxDecoration
                        (
                          color: const Color.fromRGBO(245, 165, 34, 1),//background: rgba(245, 165, 34, 1);
                          borderRadius: BorderRadius.circular(20)
                      ),
                      height: 56,
                      child: const Center(
                          child: Text("Home", style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.w600),)
                      )
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}