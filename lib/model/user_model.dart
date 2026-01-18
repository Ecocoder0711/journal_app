class UserModel {
  final String username;
  final String emailid;
  UserModel({required this.username, required this.emailid});
  Map<String, dynamic> toMap() {
    return {'userName': username, 'emailid': emailid};
  }

  UserModel.fromMap(Map<String, dynamic> map)
    : emailid = map['emailid'],
      username = map['username'];
}
