// lib/core/global_components/color_constants.dart

import 'package:flutter/material.dart';

class ColorConstants {
  // Warna Utama Aplikasi
  static const Color primaryColor = Color(0xFF1E88E5); // Biru
  static const Color primaryLightColor = Color(0xFF64B5F6); // Biru Terang
  static const Color primaryDarkColor = Color(0xFF1565C0); // Biru Gelap

  // Warna untuk Banner Savings
  static const Color bannerColor = Color(0xFF424242); // Abu-abu Gelap

  // Warna untuk Transaksi
  static const Color greenColor = Colors.green; // Hijau untuk transaksi masuk
  static const Color redColor = Colors.red; // Merah untuk transaksi keluar

  // Warna Putih dan Variannya
  static const Color whiteColor = Colors.white; // Putih Murni
  static const Color white70 = Colors.white70; // Putih dengan Opacity 70%

  // Warna Hitam dan Abu-abu
  static const Color blackColor = Colors.black; // Hitam Murni
  static const Color greyColor = Colors.grey; // Abu-abu Murni
  static const Color greyLightColor = Color(0xFFBDBDBD); // Abu-abu Terang
  static const Color greyDarkColor = Color(0xFF616161); // Abu-abu Gelap

  // Warna untuk Ikon dan Teks
  static const Color iconColor = Colors.white; // Warna Ikon Putih
  static const Color iconBackgroundColor =
      Colors.white54; // Warna Latar Belakang Ikon dengan Opacity 54%

  // Warna untuk Shadow
  static Color shadowColor =
      Colors.grey.withOpacity(0.3); // Warna Bayangan dengan Opacity 30%

  // Warna untuk Floating Action Button
  static const Color fabColor = Color(0xFF1E88E5); // Sama dengan primaryColor

  // Warna untuk Border
  static const Color borderColor =
      Colors.white70; // Warna Border Putih dengan Opacity 70%

  // Warna untuk Search Bar
  static const Color searchBarColor =
      Color(0xFFF5F5F5); // Abu-abu sangat terang untuk Search Bar
}
