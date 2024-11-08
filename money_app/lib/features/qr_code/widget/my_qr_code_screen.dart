import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import '../../../core/global_components/color_constants.dart';

class MyQrCodeWidget extends StatelessWidget {
  const MyQrCodeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Data yang akan dienkode dalam QR Code
    String qrData = "https://example.com/user-profile";

    return Container(
      width: double.infinity, // Memenuhi lebar layar
      padding: const EdgeInsets.symmetric(
          horizontal: 4, vertical: 24), // Membuat padding lebih besar
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.95),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30.0), // Radius lebih besar
          topRight: Radius.circular(30.0), // Radius lebih besar
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 12.0, // Blur lebih besar
            offset:
                Offset(0, -6), // Offset lebih besar untuk kesan lebih menonjol
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min, // Sesuaikan tinggi sesuai konten
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Header dengan judul
          Row(
            mainAxisAlignment: MainAxisAlignment.start, // Sesuaikan tinggi
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.black),
                onPressed: () => Navigator.pop(context),
              ),
              SizedBox(height: 20),
              const Text(
                "My QR Code",
                style: TextStyle(
                  fontSize: 16, // Font lebih besar
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          const SizedBox(height: 60), // Jarak antar elemen lebih besar
          // QR Code dengan logo di tengah
          QrImageView(
            data: qrData,
            version: QrVersions.auto,
            size: 350.0, // Ukuran QR Code lebih besar
            backgroundColor: Colors.white,
            embeddedImage: const AssetImage('assets/images/logo.png'),
            embeddedImageStyle: QrEmbeddedImageStyle(
              size: const Size(60, 60), // Ukuran embedded image lebih besar
            ),
          ),

          const SizedBox(height: 10), // Jarak antar elemen lebih besar
          // Nama Pengguna
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.person_2_rounded,
                size: 20,
              ), // Use a valid icon from Icons
              const SizedBox(
                  width: 8), // Optional: add space between the icon and text
              const Text(
                "Asal Design",
                style: TextStyle(
                  fontSize: 16, // Font lebih besar
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          const SizedBox(height: 80), // Jarak antar elemen lebih besar
          // Deskripsi Penggunaan
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: const Text(
                    "Use the Montek app to scan the QR code and receive financial payments into your account.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16, // Font lebih besar
                      color: Colors.grey,
                    ),
// Ensure text wraps within the space
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 24), // Jarak lebih besar sebelum tombol
          // Tombol "Share Code" (Placeholder)
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                // Placeholder aksi
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Fungsi berbagi belum diimplementasikan.'),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: ColorConstants.primaryColor, // Warna tombol
                padding: const EdgeInsets.symmetric(
                    vertical: 16), // Padding lebih besar
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(80), // Sudut lebih besar
                ),
              ),
              child: const Text(
                "Share Code",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18, // Font lebih besar
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
