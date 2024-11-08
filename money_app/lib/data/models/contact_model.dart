class ContactModel {
  final String name;
  final String username;

  ContactModel({required this.name, required this.username});

  // Factory method to create an instance from a Map
  factory ContactModel.fromMap(Map<String, String> data) {
    return ContactModel(
      name: data['name'] ?? '',
      username: data['username'] ?? '',
    );
  }

  // Convert instance back to Map if needed
  Map<String, String> toMap() {
    return {
      'name': name,
      'username': username,
    };
  }
}
