import 'package:flutter/material.dart';
import 'package:project/model/seatselect.dart';

class ShowPassenger extends StatefulWidget {
  List<SeatSel> addPasengers = [];
  ShowPassenger({super.key, required this.addPasengers});
  @override
  State<ShowPassenger> createState() => _ShowPassengerState();
}
class _ShowPassengerState extends State<ShowPassenger> {
  displayData() {
    widget.addPasengers.forEach((element) {
      print(element.name);
    });
    setState(() {});
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    displayData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: ListView.builder(
          itemCount: widget.addPasengers.length,
          itemBuilder: (context, index) {
            final data = widget.addPasengers[index];
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Pasenger No:${index + 1}'),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Name:${data.name.text}'),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Age:${data.age.text}'),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Gender:${data.selecctRadio}'),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('SeatNo:${data.seatNo}'),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Status:${data.userSelected}'),
                    ),
                  ],
                ),
              ),
            );
          },
        ));
  }
}