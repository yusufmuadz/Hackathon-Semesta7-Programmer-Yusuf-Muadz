
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class GenerateQrPage extends StatelessWidget {
  const GenerateQrPage({super.key});

  @override
  Widget build(BuildContext context) {
    String qrData = "lokasi:A1|shift:malam|expires:${DateTime.now().add(Duration(hours: 1)).toIso8601String()}";
    
    return Scaffold(
      appBar: AppBar(
        title: Text("Generate QR Code"),
      ),
      body: Center(
        child: Column(
          children: [
            QrImageView(
              data: qrData,
              version: QrVersions.auto,
              size: 200.0,
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        width: double.infinity,
        padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
            backgroundColor: Colors.amber,
          ),
          child: Text('Pilih'),
        ),
      ),
    );
  }
}