class Users {
  final String userid;

  Users({required this.userid});
}

class UserRole {
  final String userid;
  final String role;
  final String username;
  final List courses;

  UserRole(
      {required this.userid,
      required this.role,
      required this.username,
      required this.courses});
}
