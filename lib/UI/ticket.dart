import 'package:flutter/material.dart';

class Tickets extends StatefulWidget {
  const Tickets({super.key});

  @override
  State<Tickets> createState() => _TicketsState();
}

class _TicketsState extends State<Tickets> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(255, 98, 96, 1),//background: rgba(255, 98, 96, 1);
        surfaceTintColor: const Color.fromRGBO(255, 98, 96, 1),//background: rgba(255, 98, 96, 1);
        title: const Text("My Tickets",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,color: Colors.white)),
        actions: [
          Image.asset("assets/images/girldp.png",height: 45,width: 45),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Container(
            height: 400,
            width: 350,
            color: const Color.fromRGBO(255, 255, 255, 1),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 8,),
                const Text("PNR/Ticket No:13392789",style: TextStyle(color: Color.fromRGBO(160, 160, 160, 1),fontSize: 14,fontWeight: FontWeight.w500)),
                const Divider(thickness: 1,),
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
                                  const Text("Boarding Point",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500,color: Color.fromRGBO(160, 160, 160, 1))),
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
                                  const Text("Drop Point",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500,color: Color.fromRGBO(160, 160, 160, 1))),
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
                    Container(width: 2,color: Colors.grey.withOpacity(0.2),height: 120,),
                    const SizedBox(width: 10,),
                    const Expanded(
                      flex: 0,
                      child: Column(
                        children: [
                          Text("Ahmedabad",style: TextStyle(color: Color.fromRGBO(160, 160, 160, 1))),
                          Text("8:05 PM",style:TextStyle(fontSize: 14,fontWeight: FontWeight.w500)),
                          Text("Sun, 13 Jan",style:TextStyle(fontSize: 10,fontWeight: FontWeight.w500)),
                          SizedBox(height: 8,),
                          Text("TO",style: TextStyle(fontSize: 10,fontWeight: FontWeight.w500,color: Color.fromRGBO(245, 165, 34, 1))),
                          SizedBox(height: 5,),
                          Text("Pune",style: TextStyle(color: Color.fromRGBO(160, 160, 160, 1))),
                          Text("6:30 AM",style:TextStyle(fontSize: 14,fontWeight: FontWeight.w500)),
                          Text("Mon, 14 Jan",style:TextStyle(fontSize: 10,fontWeight: FontWeight.w500)),
                        ],
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 13,),
                const Divider(thickness: 1,),
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
                          Text("2X1 (30) A/C SLEEPER",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500,color: Color.fromRGBO(160, 160, 160, 1))),
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
    );
  }
}
