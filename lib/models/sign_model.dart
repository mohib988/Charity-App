class SignupUser {
  SignupUser({
    this.username = '',
    this.email = '',
    this.password = '',
    this.confirmPassword = '',
    this.userType = 'User', // added userType initialization
  });

  factory SignupUser.fromJson(Map<String, dynamic> json) {
    return SignupUser(
      username: json['name'] ?? '',
      email: json['email'] ?? '',
      password: json['password'] ?? '',
      confirmPassword: json['confirmPassword'] ?? '',
      userType: json['userType'] ?? 'User', // added userType initialization
    );
  }

  String confirmPassword = '';
  String email = '';
  String password = '';
  String userType = ''; // added userType field
  String username = '';

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['username'] = username;
    data['email'] = email;
    data['password1'] = password;
    data['password2'] = confirmPassword;
    data['user_type'] = userType; // added userType serialization
    return data;
  }
}
