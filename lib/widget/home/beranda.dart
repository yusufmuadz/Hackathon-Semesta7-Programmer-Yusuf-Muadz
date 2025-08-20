
import 'dart:io';

import 'package:e_learning/widget/auth/login.dart';
import 'package:e_learning/widget/home/admin/admin_widget.dart';
import 'package:e_learning/widget/home/generate_qr_page.dart';
import 'package:e_learning/widget/home/qr_scanner.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {

  bool isLoading = false;
  String role = '';
  Position? _currentPosition;
  File? _imageFile;
  final ImagePicker _picker = ImagePicker();

  getDataUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      isLoading = true;
    });
    
    role = prefs.getString('role') ?? '';
    _getCurrentLocation();
  }


  Future<void> _pickImage() async {
    try {
      final pickedFile = await _picker.pickImage(source: ImageSource.camera, preferredCameraDevice: CameraDevice.front);
      if (pickedFile != null) {
        setState(() {
          _imageFile = File(pickedFile.path);
        });
      }
    } catch (e) {
      print('Error picking image: $e');
    }
  }

  setLogout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      prefs.setString('masuk', '');
      prefs.setString('login', '');
      prefs.setString('username', '');
      prefs.setString('role', '');
    });

    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => LoginWidget()));
  }

  Future<void> _getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      print('Location services are disabled.');
      return;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        print('Location permissions are denied');
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      print('Location permissions are permanently denied.');
      return;
    }

    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

    setState(() {
      _currentPosition = position;
      isLoading = false;
      print('Latitude: ${_currentPosition!.latitude}, Longitude: ${_currentPosition!.longitude}');
    });
  }

  @override
  void initState() {
    super.initState();
    getDataUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dashboard"),
        actions: [
          IconButton(
            onPressed: setLogout,
            icon: Icon(Icons.logout, color: Colors.red)
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
        child: 
        role == 'admin' ? 
        AdminWidget()
        :
        Column(
          children: [
            Card(
              child: ListTile(
                title: Text("Shift: 08:00 - 16:00"),
                subtitle: Text("Lokasi: Mall Plaza"),
                trailing: Chip(label: Text("Belum Absen")),
              ),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => QrScannerWidget()));
                },
                child: Container(
                  height: 40,
                  width: MediaQuery.of(context).size.width/2-25,
                  padding: EdgeInsets.only(right: 10, left: 10),
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.qr_code_scanner),
                      SizedBox(width: 5),
                      Text("Absensi")
                    ],
                  ),
                )),
                SizedBox(width: 10),
                InkWell(
                onTap: _pickImage,
                child: Container(
                  height: 40,
                  width: MediaQuery.of(context).size.width/2-25,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.person),
                      SizedBox(width: 5),
                      Text("Foto Absensi")
                    ],
                  ),
                )),
              ],
            ),
          SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Icon(Icons.check_circle, color: Colors.green),
                  title: Text("12/08/2025"),
                  subtitle: Text("On-Time • 07:55"),
                );
              }
            )
          )
        ],
      )
      ),
      bottomNavigationBar: Container(
        height: 60,
        color: Colors.blue,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: Icon(Icons.home),
              color: Colors.white,
              onPressed: () {},
            ),
            Visibility(
              visible: role == 'admin',
              child: IconButton(
                icon: Icon(Icons.qr_code),
                color: Colors.white,
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => GenerateQrPage()));
                },
              ),
            ),
            IconButton(
              icon: Icon(Icons.person),
              color: Colors.white,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
