import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:project/UI/find_bus.dart';
import 'package:project/model/data.dart';
import 'package:project/utils/appcolor.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  String? name;
  String? mobile;
  String? email;
  String?  cid;


  HomePage({Key? key,  this.cid,this.name,this.email,this.mobile}) : super(key: key);

  @override
  State<HomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> {
  int currentPageIndex = 0;
  String? name;
  String? mobile;
  String? email;
  TextEditingController datecontroller = TextEditingController();
  late SharedPreferences prefs;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _stop();
    _initSharedPreferences();
  }

  Future<void> _initSharedPreferences() async {
    prefs = await SharedPreferences.getInstance();
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

  void searchBuses() async{
    final res=await http.post(Uri.parse('https://busbooking.bestdevelopmentteam.com/Api/bussrch.php'),
        body: jsonEncode({
          "start": source?.name.toString(),
          "end": destination?.name.toString(),
          "date": datecontroller.text
        }),
        headers: {'Content-Type': 'application/json; charset=UTF-8'}
    );
    if(res.statusCode==200){
      print(res.body);
      setState(() {});
    }else{
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Please Select Source & Destination !!"),),);
    }
  }

  @override
  Widget build(BuildContext context) {
    print("CUTOMER ID ON HOME${widget.cid.toString()}");

    var screensize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.primary,
        surfaceTintColor: AppColors.primary,
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
                bottom: 610,
                child: Container(
                  width: 300,
                  height: 250,
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(8),
                        bottomRight: Radius.circular(8)),
                  ),
                  child: Column(
                    children: [
                      Text(
                        "Hey ${widget.name.toString()} ! and ${widget.cid.toString()}",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ),
                      Text(
                        'Where you want to go?',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w500),
                      ),
                      Image(
                        image: AssetImage("assets/images/bus1.png"),
                        height: 100,
                        width: 100,
                      )
                    ],
                  ),
                ),
              ),

              //SERCH DESTIONAATION AND DATES
              Positioned(
                top: 160,
                bottom: 80,
                right: 15,
                left: 15,
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  physics: const NeverScrollableScrollPhysics(),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: AppColors.secondary,
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
                          padding: const EdgeInsets.only(left: 15, right: 15, top: 40),
                          child: DropdownButtonFormField(
                            hint: Text("Boarding From",style: TextStyle(fontFamily: "Ubuntu",fontWeight: FontWeight.w400)),
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: const Color.fromRGBO(243, 238, 255, 1),//background: rgba(243, 238, 255, 1);,
                              enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Colors.transparent),
                                  borderRadius: BorderRadius.circular(5)
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Colors.transparent),
                                  borderRadius: BorderRadius.circular(5)
                              ),
                            ),
                            borderRadius: BorderRadius.circular(5),
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700,color: Color.fromRGBO(181, 160, 232, 1),),
                            value: source,
                            items: route.map((e) {
                              return DropdownMenuItem<Routes>(
                                value: e,
                                child: Text(e.name.toString(),style: TextStyle(fontFamily: "Ubuntu",fontWeight: FontWeight.w400,color: AppColors.primary)),
                              );
                            }).toList(),
                            onChanged: (value) {
                              setState(() {
                                source=value;
                              });
                            },
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(left: 15, right: 15,top: 10),
                          child: DropdownButtonFormField(
                            hint: Text("Where are you going?",style: TextStyle(fontFamily: "Ubuntu",fontWeight: FontWeight.w400,)),
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: const Color.fromRGBO(243, 238, 255, 1),//background: rgba(243, 238, 255, 1);,
                              enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Colors.transparent),
                                  borderRadius: BorderRadius.circular(5)
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Colors.transparent),
                                  borderRadius: BorderRadius.circular(5)
                              ),
                            ),
                            borderRadius: BorderRadius.circular(5),
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700,color: Color.fromRGBO(181, 160, 232, 1),),
                            value: destination,
                            items: route.map((e) {
                              return DropdownMenuItem<Routes>(
                                value: e,
                                child: Text(e.name.toString(),style: TextStyle(fontFamily: "Ubuntu",fontWeight: FontWeight.w400,color: AppColors.primary)),
                              );
                            }).toList(),
                            onChanged: (value) {
                              setState(() {
                                destination=value;
                              });
                            },
                          ),
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                                padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
                                child: SizedBox(
                                  height: 45,
                                  width: 250,
                                  child: TextField(
                                    // Date Select
                                    controller: datecontroller,
                                    readOnly: true,
                                    onTap: () async {
                                      final DateTime? pickedDate = await showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime(1990),
                                        lastDate: DateTime(2050),
                                      );
                                      if (pickedDate != null) {
                                        print(pickedDate);
                                        String formateDate = DateFormat('yyyy-MM-dd').format(pickedDate);
                                        print(formateDate);
                                        setState(() {
                                          datecontroller.text = formateDate;
                                        });
                                      } else {
                                        ScaffoldMessenger.of(context).showSnackBar(
                                          const SnackBar(
                                            content: Text("Please Select Date !!"),
                                          ),
                                        );
                                      }
                                    },
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: AppColors.secondary,
                                      isDense: true,
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(15),
                                        borderSide: BorderSide(color: AppColors.primary),
                                      ),
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide(color: AppColors.primary),
                                        borderRadius: BorderRadius.all(Radius.circular(15)),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: AppColors.primary),
                                      ),
                                      disabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color:AppColors.primary),
                                      ),
                                      // prefixIcon: Icon(Icons.date_range, color: AppColors.primary),
                                      prefixIcon: Icon(Icons.calendar_month_outlined, color: AppColors.primary),
                                      labelText: "Day*",
                                      hintText: "Select Date",
                                    ),
                                  ),
                                )
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 293,
                          child: Padding(
                            padding:
                            const EdgeInsets.only(bottom: 15, top: 15),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                AppColors.primary,
                                shape: RoundedRectangleBorder(
                                  borderRadius:
                                  BorderRadius.circular(5),
                                ),
                              ),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => FindBus(
                                        source: source!.name.toString(),
                                        destination: destination!.name.toString(),
                                        datecontroller: datecontroller.text,
                                        cId: widget.cid.toString(),
                                      ),
                                    ));
                              },
                              child: const Text('Find Buses', style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w400),),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.only(top: 240,left: 250),
                child: IconButton(onPressed: (){}, icon: Icon(Icons.swap_vert_circle_rounded),iconSize: 40,color: AppColors.primary,),
              ),

              //UpComing Feature
              Padding(
                padding: EdgeInsets.only(top: 550,left: 20),
                child: Text("UpComing Features..",style: TextStyle(fontSize: 20)),
              ),
              Padding(
                padding: EdgeInsets.only(top: 580,left: 20),
                child: SizedBox(
                  height: 350,
                  child: ListView(
                      children: [
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              Card(
                                color: Color.fromRGBO(255, 98, 96, 1),
                                child: Container(
                                  height: 130,width: 250,
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(left: 10,top: 12),
                                            // child: Text("Stay informed! Get real-time bus \nlocation updates to plan your journey \nefficiently. Never miss your stop again.",style: TextStyle(fontSize: 10),),
                                            child: Text("Stay updated with \nreal-time bus locations. \n\nNever miss your stop!",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w400 ),),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(top: 15,right: 1),
                                            child: ClipRRect(
                                                borderRadius: BorderRadius.circular(10),
                                                child: Image.asset("assets/images/features/bus_location.jpg",width: 100,height: 100,)
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Card(
                                child: Container(
                                  height: 120,width: 200,
                                  child: Column(
                                    children: [
                                      Text("data"),
                                      Text("data"),
                                      Text("data"),
                                    ],
                                  ),
                                ),
                              ), Card(
                                child: Container(
                                  height: 120,width: 200,
                                  child: Column(
                                    children: [
                                      Text("data"),
                                      Text("data"),
                                      Text("data"),
                                    ],
                                  ),
                                ),
                              ),Card(
                                child: Container(
                                  height: 120,width: 200,
                                  child: Column(
                                    children: [
                                      Text("data"),
                                      Text("data"),
                                      Text("data"),
                                    ],
                                  ),
                                ),
                              ), Card(
                                child: Container(
                                  height: 120,width: 200,
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
                      ]
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
