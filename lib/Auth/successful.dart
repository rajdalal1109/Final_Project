import 'package:apidemo/login.dart';
import 'package:flutter/material.dart';

class Done extends StatefulWidget {
  // const Done({super.key});
  const Done({Key? key}) : super(key: key);

  @override
  State<Done> createState() => _DoneState();
}

class _DoneState extends State<Done> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.check_circle_outlined,size: 200,color: Colors.blueAccent,),
              const SizedBox(height: 20),
              const Text("Successfully", style: TextStyle(fontSize: 35),),
              const SizedBox(height: 30),
              const Text("Your Password has been reset successfully !!"),
              const SizedBox(height: 20),
              ElevatedButton(onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => const LogIn(),));
              }, child: const Text("CONTIUNE")),
            ],
          )
      ),
    );
  }
}