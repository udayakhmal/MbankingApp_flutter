class TransactionModel {
  final String name;
  final String date;
  final String amount;
  final String type;

  TransactionModel({
    required this.name,
    required this.date,
    required this.amount,
    required this.type,
  });

  // Metode dari map untuk inisialisasi dari peta data
  factory TransactionModel.fromMap(Map<String, String> data) {
    return TransactionModel(
      name: data['name'] ?? '',
      date: data['date'] ?? '',
      amount: data['amount'] ?? '',
      type: data['type'] ?? '',
    );
  }

  // Metode untuk mengonversi kembali ke map jika diperlukan
  Map<String, String> toMap() {
    return {
      'name': name,
      'date': date,
      'amount': amount,
      'type': type,
    };
  }
}
