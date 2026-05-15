class AppUser {
  final String uid;
  final String firstName;
  final String lastName;
  final String email;

  AppUser({
    required this.uid,
    required this.firstName,
    required this.lastName,
    required this.email,
  });

  Map<String, dynamic> toMap() {
    return {
      "uid": uid,
      "firstName": firstName,
      "lastName": lastName,
      "email": email,
      "role": "user",
      "createdAt": DateTime.now().toString(),
    };
  }
}