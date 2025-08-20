1. Aplikasi QR Code Attendance System adalah sistem absensi berbasis mobile dan web untuk perusahaan outsourcing satpam.
Fitur utama:

Absensi dengan scan QR Code.

Validasi kehadiran dengan GPS lokasi dan foto selfie.

Notifikasi real-time via Telegram Bot.

User Admin untuk mengelola data absensi dan generate laporan PDF mingguan.

Backend API menggunakan Laravel.


2. Teknologi yang Digunakan

Backend: Laravel 12, MySQL.

Frontend Mobile: Flutter 3 (Dart), url_launcher, qr_flutter, geolocator, image_picker, http, SharedPreferences, dll.

Notifikasi: Telegram Bot API. => jika ada waktu mungkin masih bisa

Export Report: Laravel DomPDF. => jika ada waktu mungkin masih bisa

3. Cara menjalankan

git clone https://github.com/yusufmuadz/Hackathon-Semesta7-Programmer-Yusuf-Muadz.git (dengan branch main)
cd Hackathon-Semesta7-Programmer-Yusuf-Muadz
flutter pub get
flutter run

4. Login

Guard

Email: ha@gmail.com
Password: 12345678

Admin

Email: admin@gmail.com
Password: 12345678

5. Fitur

Login/Register: autentikasi via Laravel API.

Scan QR Code: untuk validasi kehadiran.

Ambil Foto Selfie: verifikasi absensi.

Lihat Riwayat Absensi: user bisa cek absensi harian.

Admin: menampilkan data absensi, buka lokasi di Google Maps, generate laporan mingguan.