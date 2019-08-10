/// email : "freritmg12@gmail.com"
/// password : 1234

class Login {

  String email;
  String password;

  static Login fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    Login loginBean = Login();
    loginBean.email = map['email'];
    loginBean.password = map['password'];
    return loginBean;
  }

  Map toJson() => {
    "email": email,
    "password": password,
  };
}