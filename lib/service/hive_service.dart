import 'package:hive/hive.dart';

import '../model/member_model.dart';

class HiveService {
  static var box = Hive.box("pdp_online");

  static void storeUser(Member user) async {
    box.put("user", user.toJson());
  }

  static Member loadUser() {
    var user = Member.fromJson(box.get('user'));
    return user;
  }

  static void removeUser() async {
    box.delete('user');
  }
}
