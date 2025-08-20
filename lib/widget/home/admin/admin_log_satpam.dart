import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AdminLogSatpam extends StatelessWidget {
  const AdminLogSatpam({super.key});

  final List<Map<String, dynamic>> logs = const [
    {
      "nama": "Budi Santoso",
      "waktu": "2025-08-20 07:05",
      "status": "On-Time",
      'lat': -6.200,
      'long': 106.816,
      "foto": "https://i.pravatar.cc/150?img=3"
    },
    {
      "nama": "Andi Saputra",
      "waktu": "2025-08-20 07:40",
      "status": "Late",
      'lat': -6.201,
      'long': 106.817,
      "foto": "https://i.pravatar.cc/150?img=5"
    },
  ];

  void _openMap(double latitude, double longitude) async {
  final Uri googleMapUrl = Uri.parse(
    'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude',
  );

  print(await canLaunchUrl(googleMapUrl));
  print(googleMapUrl);

  try {
    await launchUrl(googleMapUrl, mode: LaunchMode.externalNonBrowserApplication);
  } catch (e) {
    throw 'Could not open the map.';
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Log Kehadiran Satpam"),
      ),
      body: ListView.builder(
        itemCount: logs.length,
        itemBuilder: (context, index) {
          final log = logs[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            elevation: 3,
            child: ListTile(
              leading: CircleAvatar(
                radius: 28,
                backgroundImage: NetworkImage(log["foto"]),
              ),
              title: Text("${log["nama"]} (${log["status"]})"),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Waktu: ${log["waktu"]}"),
                  Text("GPS: ${log["lat"]}, ${log["long"]}"),
                ],
              ),
              trailing: Icon(
                log["status"] == "On-Time" ? Icons.check_circle : Icons.warning,
                color: log["status"] == "On-Time" ? Colors.green : Colors.red,
              ),
              onTap: () => _openMap(log["lat"] ?? '', log["long"] ?? ''),
            ),
          );
        },
      ),
    );
  }
}
