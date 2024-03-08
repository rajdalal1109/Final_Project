import 'package:flutter/material.dart';
import 'package:project/UI/homepage_1.dart';
import 'package:project/login.dart';

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
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      //backgroundColor: const Color.fromRGBO(255, 98, 96, 1),//background: rgba(255, 98, 96, 1);

      body: SingleChildScrollView(
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
                    String trimmedValue = value.trim();
                    if (trimmedValue.length < 2) {
                      return 'Name should contain at least two letters';
                    }
                    if (RegExp(r'[0-9!@#%^&*]').hasMatch(trimmedValue)) {
                      return 'Name should only contain letters';
                    }
                    return null;
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
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Number is required';
                    }
                    if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                      return 'Enter only numbers';
                    }
                    if (value.length != 10) {
                      return 'Number must be 10 digits long';
                    }
                    return null;
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
                    if (!RegExp(r'^[\w-\.]+@[a-zA-Z]+\.[a-zA-Z]{2,}$').hasMatch(value) || !value.contains("@gmail.com")) {
                      return 'Format is abc123@gmail.com';
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
                        if (_formKey.currentState!.validate()) {
                          // Form is valid, proceed with registration
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => HomePage(name: _name.toString(),),
                          ));
                        } else {
                          // Form is invalid
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: const Text('Please fix the errors in the form'),
                            ),
                          );
                        }
                      },
                    )
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
                      Text("By Clicking on Register, You are agree to \n"
                          "Privacy Policy and "
                          "Terms & Conditions !!",style: TextStyle(color: Colors.red,fontWeight: FontWeight.w400)),
                    ],
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