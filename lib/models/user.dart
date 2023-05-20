class User {
  String username;
  String email;
  String password;
  User(this.username, this.email, this.password);

  User.fromJson(Map<String, dynamic> json)
      : username = json['username'],
        email = json['email'],
        password = json['password'];
  Map<String, dynamic> toJson() => {
        'username': username,
        'email': email,
        'password': password,
      };
}
