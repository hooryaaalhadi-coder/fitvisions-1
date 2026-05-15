class AdminService {
  static const String adminEmail = "admin@fitvisions.com";
  static const String adminPassword = "Admin123";

  static bool login({
    required String email,
    required String password,
  }) {
    return email.trim() == adminEmail &&
        password.trim() == adminPassword;
  }
}