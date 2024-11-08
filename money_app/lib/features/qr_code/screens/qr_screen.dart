// lib/screens/qr_scanner_screen.dart

import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:image_picker/image_picker.dart';
import '../../../core/global_components/color_constants.dart';
import 'package:money_app/features/qr_code/widget/my_qr_code_screen.dart';

// Import kelas MyQrCodeScreen jika di file terpisah
// import 'my_qr_code_screen.dart'; // Uncomment jika MyQrCodeScreen berada di file terpisah

class QrScannerScreen extends StatefulWidget {
  const QrScannerScreen({Key? key}) : super(key: key);

  @override
  State<QrScannerScreen> createState() => _QrScannerScreenState();
}

class _QrScannerScreenState extends State<QrScannerScreen> {
  String scannedUsername = "Username"; // Ganti sesuai kebutuhan
  bool isFlashOn = false;

  // Kontroler untuk MobileScanner
  MobileScannerController cameraController = MobileScannerController();

  // ImagePicker untuk membuka galeri
  final ImagePicker _picker = ImagePicker();

  @override
  void dispose() {
    cameraController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Mendapatkan ukuran layar
    final size = MediaQuery.of(context).size;

    // Menentukan ukuran dan posisi bingkai pemindaian
    final scanWidth = size.width * 0.8;
    final scanHeight = size.width * 0.8;
    final scanLeft = (size.width - scanWidth) / 2;
    final scanTop = (size.height - scanHeight) / 2;

    // Membuat Rect untuk area pemindaian
    final scanRect = Rect.fromLTWH(scanLeft, scanTop, scanWidth, scanHeight);

    return Scaffold(
      backgroundColor: ColorConstants.blackColor,
      body: Stack(
        children: [
          // QR Code Scanner
          MobileScanner(
            controller: cameraController,
            allowDuplicates: false,
            onDetect: (barcode, args) {
              if (barcode.rawValue == null) {
                debugPrint('Failed to scan Barcode');
              } else {
                final String code = barcode.rawValue!;
                setState(() {
                  scannedUsername = code;
                });
                // Tambahkan aksi lain jika diperlukan, seperti navigasi atau validasi
              }
            },
          ),

          // Overlay Gelap dengan area pemindaian transparan
          CustomPaint(
            size: size,
            painter: DarkOverlayPainter(scanArea: scanRect, borderRadius: 20.0),
          ),

          // Overlay Bingkai Pemindaian
          Positioned(
            left: scanLeft,
            top: scanTop,
            child: Container(
              width: scanWidth,
              height: scanHeight,
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(20),
              ),
              child: CustomPaint(
                painter: ScannerBorderPainter(),
              ),
            ),
          ),

          // Teks Username di Bawah QR Code
          Positioned(
            top: scanTop + scanHeight + 20,
            left: 0,
            right: 0,
            child: Center(
              child: Text(
                scannedUsername,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          // Teks Petunjuk di Bawah Username
          Positioned(
            top: scanTop + scanHeight + 60,
            left: 0,
            right: 0,
            child: Center(
              child: Text(
                "Scan a QR to send money",
                style: TextStyle(
                  color: Colors.white.withOpacity(0.7),
                  fontSize: 16,
                ),
              ),
            ),
          ),

          // Kontrol Bawah
          Positioned(
            bottom: 30,
            left: 20,
            right: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Tombol Flash
                IconButton(
                  icon: Icon(
                    isFlashOn ? Icons.flash_on : Icons.flash_off,
                    color: Colors.white,
                    size: 30,
                  ),
                  onPressed: () async {
                    await cameraController.toggleTorch();
                    TorchState? torchState = cameraController.torchState.value;
                    setState(() {
                      isFlashOn = torchState == TorchState.on;
                    });
                  },
                ),

                // Tombol "My QR Code"
                // Tombol "My QR Code"
                ElevatedButton.icon(
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                      builder: (context) =>
                          const MyQrCodeWidget(), // Hanya menampilkan MyQrCodeWidget
                    );
                  },
                  icon: const Icon(Icons.qr_code, color: Colors.white),
                  label: const Text(
                    "My QR Code",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ColorConstants.primaryColor,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                ),

                // Tombol Gambar
                IconButton(
                  icon: const Icon(Icons.photo, color: Colors.white, size: 30),
                  onPressed: () async {
                    // Aksi untuk membuka galeri
                    final XFile? image =
                        await _picker.pickImage(source: ImageSource.gallery);
                    if (image != null) {
                      // Lakukan sesuatu dengan gambar yang dipilih
                      debugPrint('Gambar terpilih: ${image.path}');
                      // Misalnya, tampilkan gambar dalam dialog atau navigasi ke layar lain
                    }
                  },
                ),
              ],
            ),
          ),

          // Tombol "X" di Kiri Atas Menggunakan Align dan Padding
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.only(top: 40.0, left: 10.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context); // Kembali ke layar sebelumnya
                },
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  child: const Icon(
                    Icons.close_sharp,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DarkOverlayPainter extends CustomPainter {
  final Rect scanArea;
  final double borderRadius;

  DarkOverlayPainter({required this.scanArea, this.borderRadius = 20.0});

  @override
  void paint(Canvas canvas, Size size) {
    // Warna overlay semi-transparan
    final paint = Paint()..color = Colors.black54;

    // Menggambar seluruh layar dengan warna overlay
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), paint);

    // Menggunakan kombinasi Path untuk menghapus area bingkai pemindaian
    final Path path = Path()
      ..addRRect(
          RRect.fromRectAndRadius(scanArea, Radius.circular(borderRadius)))
      ..fillType = PathFillType.evenOdd;

    // Menghapus area bingkai pemindaian dari overlay
    canvas.drawPath(
      path,
      Paint()
        ..blendMode = BlendMode.clear
        ..style = PaintingStyle.fill,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class ScannerBorderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double cornerSize = 20.0;
    double cornerRadius = 10.0; // Radius untuk sudut melengkung
    Paint paint = Paint()
      ..color = Colors.white
      ..strokeWidth = 4
      ..style = PaintingStyle.stroke;

    // Kiri Atas
    // Menggambar garis horizontal dari cornerRadius ke cornerSize
    canvas.drawLine(Offset(cornerRadius, 0), Offset(cornerSize, 0), paint);
    // Menggambar busur untuk sudut kiri atas
    canvas.drawArc(
      Rect.fromLTWH(0, 0, cornerSize, cornerSize),
      180 * 3.1415926535 / 180, // Sudut mulai (radian)
      90 * 3.1415926535 / 180, // Sweep angle (radian)
      false,
      paint,
    );
    // Menggambar garis vertikal dari cornerSize ke cornerRadius
    canvas.drawLine(Offset(0, cornerRadius), Offset(0, cornerSize), paint);

    // Kanan Atas
    canvas.drawLine(Offset(size.width - cornerSize, 0),
        Offset(size.width - cornerRadius, 0), paint);
    canvas.drawArc(
      Rect.fromLTWH(size.width - cornerSize, 0, cornerSize, cornerSize),
      -90 * 3.1415926535 / 180,
      90 * 3.1415926535 / 180,
      false,
      paint,
    );
    canvas.drawLine(Offset(size.width, cornerRadius),
        Offset(size.width, cornerSize), paint);

    // Kiri Bawah
    canvas.drawLine(Offset(0, size.height - cornerRadius),
        Offset(0, size.height - cornerSize), paint);
    canvas.drawArc(
      Rect.fromLTWH(0, size.height - cornerSize, cornerSize, cornerSize),
      90 * 3.1415926535 / 180,
      90 * 3.1415926535 / 180,
      false,
      paint,
    );
    canvas.drawLine(Offset(cornerRadius, size.height),
        Offset(cornerSize, size.height), paint);

    // Kanan Bawah
    canvas.drawLine(Offset(size.width - cornerRadius, size.height),
        Offset(size.width - cornerSize, size.height), paint);
    canvas.drawArc(
      Rect.fromLTWH(size.width - cornerSize, size.height - cornerSize,
          cornerSize, cornerSize),
      0 * 3.1415926535 / 180,
      90 * 3.1415926535 / 180,
      false,
      paint,
    );
    canvas.drawLine(Offset(size.width, size.height - cornerRadius),
        Offset(size.width, size.height - cornerSize), paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
