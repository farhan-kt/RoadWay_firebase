class UserModal {
  String? uId;
  String? userName;
  String? email;

  UserModal({
    required this.uId,
    required this.userName,
    required this.email,
  });

  factory UserModal.fromJson(Map<String, dynamic> json) {
    return UserModal(
        uId: json['userId'], userName: json['name'], email: json['email']);
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': uId,
      'name': userName,
      'email': email,
    };
  }
}
