class LoginUser {
  final String username;
  final String hpno;
  final String email;
  final String ci;
  final String dn;

  LoginUser({
    required this.username,
    required this.hpno,
    required this.email,
    required this.ci,
    required this.dn,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['username'] = username;
    data['hpno'] = hpno;
    data['email'] = email;
    data['ci'] = ci;
    data['dn'] = dn;
    return data;
  }
}