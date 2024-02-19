import 'package:flutter/material.dart';
import 'package:project/UI/ticket.dart';

int selectoption = 1;

class PassDeatils extends StatefulWidget {
  const PassDeatils({super.key});

  @override
  State<PassDeatils> createState() => _PassDeatilsState();
}
enum selectOption {Male,Female}

class _PassDeatilsState extends State<PassDeatils> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:  const Color.fromRGBO(255, 98, 96, 1),
        surfaceTintColor:  const Color.fromRGBO(255, 98, 96, 1),
        centerTitle: true,
        title: const Column(
          children: [
            Text("Shrinath Travels",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 18,color: Colors.white)),
            Text("2+1, Seating, AC | 7:45 PM",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w300,color: Colors.white)),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 8,left: 8,right: 8),
          child: Column(
            children: [
              Container(
                width: 390,
                height: 250,
                color: const Color.fromRGBO(255, 255, 255, 1),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Traveller Information :",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500)),
                      const SizedBox(height: 6,),
                      const Text("Passenger 1",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500)),
                      const SizedBox(height: 10,),
                      SizedBox(
                        height: 50,
                        child: TextField(
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey.withOpacity(0.2),),
                              borderRadius: BorderRadius.circular(8),),
                            disabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey.withOpacity(0.2),),
                              borderRadius: BorderRadius.circular(8),),
                            filled: true,
                            fillColor: Colors.grey.withOpacity(0.2),
                            hintText: "Full Name",
                            hintStyle: const TextStyle(color: Colors.black,fontWeight: FontWeight.w400,fontSize: 15),
                            labelText: "Full Name",
                            labelStyle: const TextStyle(color: Colors.black,fontWeight: FontWeight.w400,fontSize: 15),
                            border: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.grey),
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 15,),
                      Row(
                        children: [
                          SizedBox(
                            height: 45,
                            width: 145,
                            child: TextField(
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey.withOpacity(0.2),),
                                  borderRadius: BorderRadius.circular(8),),
                                disabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey.withOpacity(0.2),),
                                  borderRadius: BorderRadius.circular(8),),
                                filled: true,
                                fillColor: Colors.grey.withOpacity(0.2),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                hintText: "Age",
                                hintStyle: const TextStyle(color: Colors.black,fontWeight: FontWeight.w400,fontSize: 15),
                                labelText: "Age",
                                labelStyle: const TextStyle(color: Colors.black,fontWeight: FontWeight.w400,fontSize: 15),
                              ),
                            ),
                          ),
                          Radio(
                            value: 1,
                            groupValue: selectoption,
                            onChanged: (int? value) {
                              setState(() {
                                selectoption = value!;
                              });
                            },
                          ),
                          const Text("Male"),
                          Radio(
                            value: 2,
                            groupValue: selectoption,
                            onChanged: (int? value) {
                              setState(() {
                                selectoption = value!;
                              });
                            },
                          ),
                          const Text("Female"),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 14,),
              Container(
                width: 390,
                height: 166,
                color: const Color.fromRGBO(255, 255, 255, 1),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Contact Information :",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500)),
                      const SizedBox(height: 8,),
                      SizedBox(
                        height: 45,
                        width: 355,
                        child: TextField(
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.grey.withOpacity(0.2),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey.withOpacity(0.2),),
                              borderRadius: BorderRadius.circular(8),),
                            disabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey.withOpacity(0.2),),
                              borderRadius: BorderRadius.circular(8),),
                            hintText: "Mobile",
                            hintStyle: const TextStyle(color: Colors.black,fontWeight: FontWeight.w400,fontSize: 15),
                            labelText: "Mobile",
                            labelStyle: const TextStyle(color: Colors.black,fontWeight: FontWeight.w400,fontSize: 15),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey.withOpacity(0.2)),
                                borderRadius: BorderRadius.circular(8)
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10,),
                      SizedBox(
                        height: 45,
                        width: 355,
                        child: TextField(
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.grey.withOpacity(0.2),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey.withOpacity(0.2),),
                              borderRadius: BorderRadius.circular(8),),
                            disabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey.withOpacity(0.2),),
                              borderRadius: BorderRadius.circular(8),),
                            hintText: "Email",
                            hintStyle :const TextStyle(color: Colors.black,fontWeight: FontWeight.w400,fontSize: 15),
                            labelText: "Email",
                            labelStyle: const TextStyle(color: Colors.black,fontWeight: FontWeight.w400,fontSize: 15),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8)
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Tickets(),));
                },
                child: Container(
                    margin: const EdgeInsets.only(top: 200,left: 35,right: 35),
                    width: 338,
                    decoration: BoxDecoration
                      (
                      color: const Color.fromRGBO(255, 98, 96, 1),//background: rgba(255, 98, 96, 1);
                      borderRadius: BorderRadius.circular(8),
                    ),
                    height: 50,
                    child: const Center(
                        child: Text("Proceed to Book", style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.w400),)
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
