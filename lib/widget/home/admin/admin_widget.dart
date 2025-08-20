
import 'package:e_learning/widget/home/admin/admin_log_satpam.dart';
import 'package:flutter/material.dart';

class AdminWidget extends StatefulWidget {
  const AdminWidget({super.key});

  @override
  State<AdminWidget> createState() => _AdminWidgetState();
}

class _AdminWidgetState extends State<AdminWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          elevation: 4,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text("Kehadiran Hari Ini", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                Text("92%", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.green)),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),
        Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          elevation: 4,
          child: ListTile(
            leading: const Icon(Icons.notifications_active, color: Colors.red),
            title: const Text("Satpam terlambat"),
            subtitle: const Text("2 orang terlambat lebih dari 30 menit"),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => const AdminLogSatpam()));
            },
          ),
        ),
        const SizedBox(height: 16),
        Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          elevation: 4,
          child: ListTile(
            leading: const Icon(Icons.picture_as_pdf, color: Colors.blue),
            title: const Text("Laporan Mingguan"),
            subtitle: const Text("Ekspor PDF & kirim ke email"),
            trailing: const Icon(Icons.download),
            onTap: () {},
          ),
        ),
        const SizedBox(height: 16),
        Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          elevation: 4,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text("Prediksi AI", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                SizedBox(height: 10),
                Text("3 Satpam berisiko terlambat minggu depan:"),
                SizedBox(height: 6),
                Text("1. Budi Santoso"),
                Text("2. Andi Saputra"),
                Text("3. Joko Rahman"),
              ],
            ),
          ),
        ),
      ],
    );
  }
}