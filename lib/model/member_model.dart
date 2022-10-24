class Member {
  String? id;
  String? email;
  String? password;

  Member(this.id, this.email, this.password);

  Member.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        email = json['email'],
        password = json['password'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'email': email,
        'password': password,
      };
}
