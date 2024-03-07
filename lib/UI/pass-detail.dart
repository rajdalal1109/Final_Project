 import 'package:flutter/material.dart';
import 'package:project/UI/confirm_ticket.dart';
import 'package:project/UI/showpass_details.dart';
import 'package:project/model/seatselect.dart';

int selectoption = 1;

class PassDeatils extends StatefulWidget {
  List<SeatSel> seat = [];
  PassDeatils({required this.seat});


  @override
  State<PassDeatils> createState() => _PassDeatilsState();
}
enum selectOption {Male,Female}

class _PassDeatilsState extends State<PassDeatils> {

  List<SeatSel> addPasengers = [];
  submitPasengerDetails() {
    addPasengers.clear();
    widget.seat.forEach((element) {
      if (element.name.toString().isNotEmpty) {
        addPasengers.add(SeatSel(
            name: element.name,
            age: element.age,
            seatNo: element.seatNo,
            selecctRadio: element.selecctRadio,
            userSelected: element.userSelected));
      }
    });
    addPasengers.forEach((element) {
      print("Name: ${element.name.text},"
          "Age:${element.age.text},"
          "UserSelected:${element.userSelected.toString()},"
          "SeatNo:${element.seatNo}"
          "Gender:${element.selecctRadio}");
    });
    setState(() {});
  }
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:  const Color.fromRGBO(255, 98, 96, 1),
        surfaceTintColor:  const Color.fromRGBO(255, 98, 96, 1),
      ),
      body:Form(
      key: formKey,
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    print(widget.seat[index].seatNo);
                  },
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('PasengerNo: ${index + 1}'),
                          Text('SeatNo: ${widget.seat[index].seatNo}'),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              controller: widget.seat[index].name,
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(),
                                focusedBorder: OutlineInputBorder(),
                                hintText: 'pasenger name',
                              ),
                              autovalidateMode:
                              AutovalidateMode.onUserInteraction,
                              validator: _validateName,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              controller: widget.seat[index].age,
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(),
                                focusedBorder: OutlineInputBorder(),
                                hintText: 'Age',
                              ),
                              keyboardType: TextInputType.number,
                              autovalidateMode:
                              AutovalidateMode.onUserInteraction,
                              validator: _validatePhone,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15.0),
                            child: Row(
                              children: <Widget>[
                                Text(
                                  'Gender:',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                                Radio(
                                    value: 'Male',
                                    groupValue:
                                    widget.seat[index].selecctRadio,
                                    onChanged: (String? value) {
                                      setState(() {
                                        widget.seat[index].selecctRadio =
                                        value!;
                                      });
                                    }),
                                Text('Male'),
                                Radio(
                                    value: 'Female',
                                    groupValue:
                                    widget.seat[index].selecctRadio,
                                    onChanged: (String? value) {
                                      setState(() {
                                        widget.seat[index].selecctRadio =
                                        value!;
                                      });
                                    }),
                                Text('FeMale'),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
              itemCount: widget.seat.length,
            ),
          ),
          ElevatedButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  submitPasengerDetails();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            ShowPassenger(addPasengers: addPasengers),
                      ));
                } else {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text('Fill Proper Data !!')));
                  return;
                }
              },
              child: Text("Proceed to Book.."))
        ],
      ),
    )
    );
  }
}
 String? _validateName(String? name) {
   RegExp nameReg = RegExp(r'[a-z,A-Z]');
   final isName = nameReg.hasMatch(name ?? '');
   if (!isName || name!.length < 2) {
     return 'Please use only Alphabets';
   }
 }
 String? _validatePhone(String? num) {
   RegExp numReg = RegExp(r'[0-9]');
   final isNum = numReg.hasMatch(num ?? '');
   if (!isNum || num!.length < 2 || num.length > 3) {
     return 'Please Entre Valid Age and only Digit Please ';
   }
 }