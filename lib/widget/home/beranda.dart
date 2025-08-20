
import 'package:e_learning/widget/home/qr_scanner.dart';
import 'package:flutter/material.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Dashboard")),
      body: Padding(
        padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
        child: Column(
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
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => QrScannerWidget()));
                },
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
      )),
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
