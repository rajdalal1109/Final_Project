import 'dart:convert';

import 'package:apidemo/forgot_pass.dart';
import 'package:apidemo/successful.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;



class NewPass extends StatefulWidget {
  final String Pass;
  final String comPass;

  // const NewPass({super.key, required this.Pass, required this.comPass});
  const NewPass({Key? key, required this.Pass, required this.comPass}) : super(key: key);

  @override
  State<NewPass> createState() => _NewPassState();
}

class _NewPassState extends State<NewPass> {
  final _formKey = GlobalKey<FormState>();
  bool _passVisible = false;
  bool _CpassVisible = false;
  TextEditingController _Pass = TextEditingController();
  TextEditingController _comPass = TextEditingController();

  void ConfirmPass() async
  {
    try
    {
      var response = await http.post(Uri.parse("https://busbooking.bestdevelopmentteam.com/Api/newpwd.php"),
          body: jsonEncode({
            "Pass" : widget.Pass.toString(),
          }),
          headers: {'content-type': 'application/json; charset=UTF-8'});
      if (response.statusCode == 200) {
        print(response.body);
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Done()));
      }
    }
    catch(e)
    {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    print(widget.Pass);
    print(widget.comPass);
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 98, 96, 1),
      //background: rgba(255, 98, 96, 1);
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Container(
              height: 600,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "New Password",
                        style: TextStyle(fontSize: 35),
                      ),
                      const SizedBox(height: 20),
                      const Text("Set the new password for account so you can login and access all  features."),
                      //const Text("OTP will expire soon",style: TextStyle(color: Colors.redAccent),),



                      const SizedBox(height: 20),
                      TextFormField(
                        //For Password
                        enableSuggestions: false,
                        autocorrect: false,
                        obscureText: !_passVisible,
                        controller: _Pass,
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          labelText: "Password*",
                          hintText: 'Password',
                          prefixIcon: const Icon(Icons.password),
                          suffixIcon: IconButton(
                            icon: Icon(_passVisible ? Icons.visibility : Icons.visibility_off),
                            onPressed: () {
                              setState(() {
                                _passVisible = !_passVisible;
                              });
                            },
                          ),
                        ),
                        validator: (String? value)
                        {
                          if (value == null || value.isEmpty)
                          {
                            return 'Password is required';
                          }
                          return (value.length < 6 && value.contains(RegExp(r'[a-zA-z0-9!@#%^&*]'))) ? 'Password must be at least 6 characters long' : null;
                        },
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                      ),

                      const SizedBox(height: 25),
                      TextFormField(
                        // For Confirm Password
                        enableSuggestions: false,
                        autocorrect: false,
                        obscureText: !_CpassVisible,
                        controller: _comPass,
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          labelText: "Confirm Password*",
                          hintText: 'Confirm Password',
                          prefixIcon: const Icon(Icons.password),
                          suffixIcon: IconButton(
                            icon: Icon(_CpassVisible ? Icons.visibility : Icons.visibility_off),
                            onPressed: () {
                              setState(() {
                                _CpassVisible = !_CpassVisible;
                              });
                            },
                          ),
                        ),
                        validator: (String? value) {
                          if (value != null && value.isNotEmpty) {
                            if (value != _Pass.text) {
                              return 'Passwords do not match';
                            }
                          } else {
                            return 'Please enter your password again';
                          }
                          return null;
                        },
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                      ),

                      const SizedBox(height: 20),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10))),
                        onPressed: ConfirmPass,
                        child: Center(child: Text("UPDATE PASSWORD")),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}