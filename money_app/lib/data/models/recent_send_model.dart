class RecentSendModel {
  final String name;
  final String avatar;

  RecentSendModel({required this.name, required this.avatar});

  // Metode dari map untuk inisialisasi dari peta data
  factory RecentSendModel.fromMap(Map<String, String> data) {
    return RecentSendModel(
      name: data['name'] ?? '',
      avatar: data['avatar'] ?? '',
    );
  }

  // Metode untuk mengonversi kembali ke map jika diperlukan
  Map<String, String> toMap() {
    return {
      'name': name,
      'avatar': avatar,
    };
  }
}
