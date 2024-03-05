import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project/UI/setting.dart';
import 'package:project/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  Uint8List? _image;
  File? selectedIMage;


  void showImagePickerOption(BuildContext context) {
    showModalBottomSheet(
        backgroundColor: const Color.fromRGBO(255, 98, 96, 1),
        context: context,
        builder: (builder) {
          return Padding(
            padding: const EdgeInsets.all(18.0),
            child: SizedBox(
              height: 100,
              width: 400,
              child: Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        _getGallery();
                      },
                      child: const SizedBox(
                        child: Column(
                          children: [
                            Icon(Icons.image, size: 50,color: Colors.white,),
                            Text("Gallery",style: TextStyle(color: Colors.white),)
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        _getCamera();
                      },
                      child: const SizedBox(
                        child: Column(
                          children: [
                            Icon(Icons.camera_alt, size: 50,color: Colors.white,),
                            Text("Camera",style: TextStyle(color: Colors.white),)
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

//Gallery
  Future _getGallery() async {
    final returnImage =
    await ImagePicker().pickImage(source: ImageSource.gallery);
    if (returnImage == null) return;
    setState(() {
      selectedIMage = File(returnImage.path);
      _image = File(returnImage.path).readAsBytesSync();
    });
    Navigator.of(context).pop(); //close the model sheet
  }

//Camera
  Future _getCamera() async {
    final returnImage =
    await ImagePicker().pickImage(source: ImageSource.camera);
    if (returnImage == null) return;
    setState(() {
      selectedIMage = File(returnImage.path);
      _image = File(returnImage.path).readAsBytesSync();
    });
    Navigator.of(context).pop();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  void saveImage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (_image != null) {
      prefs.setString('image', base64Encode(_image!));
    }
  }

  void loadImage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? imageData = prefs.getString('image');
    if (imageData != null) {
      setState(() {
        _image = base64Decode(imageData);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Profile",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromRGBO(255, 98, 96, 1),
        actions: [
          IconButton(
            onPressed: () {
              showImagePickerOption(context);
            },
            icon: const Icon(
              Icons.add_a_photo_outlined,
              color: Colors.white,
              size: 30,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: const AlwaysScrollableScrollPhysics(),
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                height: 179,
                width: 393,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(8),
                    bottomRight: Radius.circular(8),
                  ),
                  color: Color.fromRGBO(255, 98, 96, 1),
                ),
              ),
              Positioned(
                top: 80,
                left: 20,
                right: 20,
                child: Column(
                  children: [
                    if (_image != null)
                      CircleAvatar(radius: 90, backgroundImage: MemoryImage(_image!),)
                    else
                      const CircleAvatar(radius: 90, backgroundImage: AssetImage("assets/images/girldp2.png"),),
                    const SizedBox(height: 8),
                    const Text(
                      "Carla Dakota",
                      style: TextStyle(
                          fontWeight: FontWeight.w800, fontSize: 25),
                    ),
                    const SizedBox(height: 30),
                    const Card(
                      child: ListTile(
                        title: Text("Email", style: TextStyle(fontSize: 16,
                            fontWeight: FontWeight.w500)),
                        subtitle: Text("abc@gmail.com", style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w400)),
                        trailing: Icon(Icons.email_outlined),
                      ),
                    ),
                    const SizedBox(height: 5),
                    const Card(
                      child: ListTile(
                        title: Text("Phone Number", style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500)),
                        subtitle: Text("+91\t1234567890", style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w400)),
                        trailing: Icon(Icons.local_phone_outlined),
                      ),
                    ),
                    const SizedBox(height: 5),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Setting(),));
                      },
                      child: const Card(
                        child: ListTile(
                          title: Text("Setting", style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500)),
                          trailing: Icon(Icons.settings_outlined),
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => LogIn(),));
                      },
                      child: const Card(
                        child: ListTile(
                          title: Text("Log Out", style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500)),
                          trailing: Icon(Icons.power_settings_new_outlined),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
