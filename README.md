# Aplikasi Keuangan Flutter

Aplikasi Flutter yang modern dan elegan untuk mengelola keuangan, melakukan pembayaran, dan memindai kode QR untuk transaksi finansial. Aplikasi ini memiliki beberapa layar untuk menampilkan saldo, aktivitas terbaru, kontak, pemindaian kode QR, dan pengiriman uang.

![MbangkingApp Photo](https://github.com/user-attachments/assets/be5e4f5e-eea2-4deb-a51b-33dab03166bf)

![MbangkingApp Video](https://github.com/user-attachments/assets/171d9568-4977-4c27-aed4-4e3cd1ad6e82)

## Fitur

1. **Dashboard**:
   - Menampilkan saldo terkini.
   - Menunjukkan transaksi dan pembayaran terbaru.
   - Memiliki banner yang menampilkan pencapaian penghematan terkini.
   - Tombol untuk melakukan pembayaran baru.

2. **Layar Kirim dan Bayar**:
   - Memungkinkan pencarian kontak atau penambahan kontak baru.
   - Menyediakan tab untuk menyaring kontak berdasarkan "Semua" atau "Favorit".
   - Menampilkan daftar kontak terbaru dan kontak yang tersedia.
   - Tombol untuk membuka pemindai kode QR.

3. **Pemindai Kode QR**:
   - Memungkinkan pengguna untuk memindai kode QR untuk melakukan pembayaran atau membagikan kode QR mereka sendiri.
   - Menyertakan opsi untuk mengakses kode QR pengguna secara langsung.

4. **Kirim Uang**:
   - Menyediakan layar untuk memasukkan jumlah uang yang akan dikirim.
   - Menampilkan kontak yang tersedia dan keypad gaya kalkulator untuk memasukkan nominal.

5. **Kode QR Saya**:
   - Menampilkan kode QR pengguna.
   - Opsi untuk membagikan kode QR guna menerima pembayaran.

## Instalasi

1. **Kloning repositori**:

    ```bash
    git clone https://github.com/yourusername/flutter-finance-app.git
    cd flutter-finance-app
    ```

2. **Install dependencies**:

    ```bash
    flutter pub get
    ```

3. **Jalankan aplikasi**:

    ```bash
    flutter run
    ```

## Struktur Folder

Struktur proyek diatur sebagai berikut:

- **models/**: Berisi model data untuk berbagai komponen, seperti `ContactModel`.
- **screens/**: Berisi file layar utama untuk setiap bagian aplikasi, termasuk `DashboardScreen`, `PaymentScreen`, dan `SendMoneyScreen`.
- **widgets/**: Berisi komponen widget yang dapat digunakan kembali di beberapa layar, termasuk `PaymentHeader`, `TabFilter`, `ContactList`, dan lainnya.
- **core/global_components/**: Berisi komponen global seperti `color_constants.dart` untuk konsistensi warna dan tema.

## Tinjauan Kode

### 1. `DashboardScreen`

Menampilkan saldo pengguna, pengirim terbaru, dan aktivitas terkini. Berisi komponen-komponen berikut:

- **DashboardHeader**: Menampilkan informasi pengguna, saldo, dan tab navigasi.
- **BannerSavings**: Menampilkan pesan tentang pencapaian penghematan terkini.
- **RecentSendSection**: Menampilkan daftar kontak yang baru-baru ini berinteraksi dengan pengguna.
- **CurrentActivitySection**: Menampilkan transaksi terkini.

### 2. `PaymentScreen`

Layar ini memungkinkan pencarian dan pemilihan kontak untuk pembayaran. Termasuk:

- **PaymentHeader**: Header dengan profil pengguna, ikon notifikasi, dan tab navigasi.
- **Search Field**: `TextField` untuk mencari atau menambahkan kontak baru.
- **TabFilter**: Menyediakan opsi untuk menyaring kontak berdasarkan "Semua" atau "Favorit".
- **ContactList**: Menampilkan daftar kontak terbaru dan kontak lainnya.

### 3. `SendMoneyScreen`

Memungkinkan pengguna untuk mengirim uang kepada kontak yang dipilih.

- **Recipient Info**: Menampilkan informasi kontak yang dipilih.
- **Amount Input**: Keypad gaya kalkulator untuk memasukkan jumlah uang.
- **Account Selector**: Memungkinkan pemilihan akun yang akan digunakan untuk pengiriman dana.

### 4. `QRCodeScannerScreen` dan `MyQRCodeScreen`

Memungkinkan pemindaian kode QR untuk pembayaran dan menampilkan kode QR pengguna untuk menerima dana.

## Widgets

1. **PaymentHeader** - Menampilkan header yang dapat dikustomisasi dengan tab.
2. **TabFilter** - Menyediakan bar filter untuk "Semua" dan "Favorit".
3. **ContactList** - Widget daftar untuk menampilkan kontak.
4. **BannerSavings** - Menampilkan banner untuk pencapaian penghematan terkini.
5. **RecentSendSection** - Menampilkan pengirim terbaru untuk akses cepat.

## Models

1. **ContactModel** - Mendefinisikan struktur data untuk kontak, termasuk nama dan nama pengguna.


## Berkontribusi

1. Fork repositori ini.
2. Buat branch fitur Anda: `git checkout -b feature/FiturAnda`.
3. Commit perubahan Anda: `git commit -m 'Tambahkan fitur tertentu'`.
4. Push ke branch: `git push origin feature/FiturAnda`.
5. Buka pull request.


