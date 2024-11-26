class ContactMessage {
  String? name;
  String? email;
  String? message;

  ContactMessage({this.name, this.email, this.message});

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'message': message,
    };
  }
}
