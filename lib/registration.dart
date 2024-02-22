import 'dart:convert';

import 'package:project/login.dart';
import 'package:flutter/material.dart';
import 'package:project/UI/homepage_1.dart';
import 'package:http/http.dart' as http;

class Registration extends StatefulWidget {
  const Registration({Key? key}) : super(key: key);

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  final _formKey = GlobalKey<FormState>();
  bool _passVisible = false;
  bool _CpassVisible = false;
  final TextEditingController _name = TextEditingController();
  final TextEditingController _number = TextEditingController();
  final TextEditingController _mail = TextEditingController();
  final TextEditingController _Password = TextEditingController();
  final TextEditingController _confirmPassword = TextEditingController();

  @override
  void dispose()
  {
    _name.dispose();
    _mail.dispose();
    _number.dispose();
    _Password.dispose();
    _confirmPassword.dispose();
    super.dispose();
  }

  void Register() async {
    // final url = Uri.parse("https://busbooking.bestdevelopmentteam.com/Api/user_registration");
    try
    {
      Map data =
      {
        "name" : _name.text,
        "mobile_no" : _number.text ,
        "email" : _mail.text,
        "password" : _Password.text,
      };
      var response = await http.post(
        Uri.parse("https://busbooking.bestdevelopmentteam.com/Api/user_registration"),
        body: jsonEncode(data),
        headers: {
          'Content-Type':"application/json; charset=UTF-8"
        },
      );
      print(response.body);
    }
    catch(e)
    {
      print(e);
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      //backgroundColor: const Color.fromRGBO(255, 98, 96, 1),//background: rgba(255, 98, 96, 1);

      body: Container(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  const SizedBox(height: 5,),
                  const Image(image: AssetImage("assets/images/registration.jpg"),height: 233,width: 390,),

                  const Text("Hop on Board : Your Journey Begins with Us !!",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 20,)),

                  const SizedBox(height: 45,),
                  TextFormField(
                    // For Name
                    controller: _name,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Name*",
                      prefixIcon: Icon(Icons.person, color: Colors.blue),
                      hintText: 'Name',
                    ),
                    keyboardType: TextInputType.name,
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Name is required';
                      }
                      return (value.contains(RegExp(r'[0-9!@#%^&*]'))) ? 'Please enter characters only' : null;
                    },
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                  ),

                  const SizedBox(height: 25),
                  TextFormField(
                    //For Number
                    controller: _number,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Number*",
                        hintText: 'Number',
                        prefixIcon: Icon(Icons.call, color: Colors.blue)),
                    maxLength: 10,
                    keyboardType: TextInputType.phone,
                    validator: (String? value)
                    {
                      if (value == null || value.isEmpty) {
                        return 'Number is required';
                      }
                      return (value.contains(RegExp(r'[a-zA-z!@#%^&*]'))) ? 'Enter only numbers' : null;
                    },
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                  ),

                  const SizedBox(height: 5),
                  TextFormField(
                    //For E-mail
                    controller: _mail,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "E-Mail*",
                        hintText: 'E-mail',
                        prefixIcon: Icon(Icons.email, color: Colors.blue)
                    ),
                    keyboardType: TextInputType.emailAddress,
                    validator: (String? value) {
                      if (value == null || value.isEmpty)
                      {
                        return 'Please enter an email address';
                      }
                      else if (!RegExp(r'^[\w-]+@[a-zA-Z]+\.[a-zA-Z]{2,}$').hasMatch(value))
                      {
                        return 'Format of abc123@gmail.com';
                      }
                      return null;
                    },
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                  ),

                  const SizedBox(height: 25),
                  TextFormField(
                    //For Password
                    enableSuggestions: false,
                    autocorrect: false,
                    obscureText: !_passVisible,
                    controller: _Password,
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
                    controller: _confirmPassword,
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
                        if (value != _Password.text) {
                          return 'Passwords do not match';
                        }
                      } else {
                        return 'Please enter your password again';
                      }
                      return null;
                    },
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(25),
                    child: ElevatedButton(
                      child: const Text("Register"),
                      onPressed: () {
                        Register();
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => MyHomePage(),
                        ));
                      },
                    ),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Already Account?"),
                      TextButton(child: const Text("LogIn Here"),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const LogIn(),
                          ));
                        },
                      ),
                    ],
                  ),

                  const SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Text("By Clicking on Register, you are agree to "
                            "Privacy Policy and "
                            "Terms & Conditions !!",style: TextStyle(color: Colors.red)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}