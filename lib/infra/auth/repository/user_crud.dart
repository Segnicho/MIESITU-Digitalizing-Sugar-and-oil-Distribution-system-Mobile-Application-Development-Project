import 'package:labpract/domain/auth/entity/auth_model.dart';
import 'package:labpract/infra/auth_local_storage.dart';

class UserDB {
  static final dbProvider = UserDBProvider.usrProvider;

  Future<int> createUser(User user) async {
    final db = await dbProvider.database;
    var usr = db.insert(userTable, user.toDBjson());
    return usr;
  }

  Future<int> deleteUser(int id) async {
    final db = await dbProvider.database;
    var result =
        await db.delete(userTable, where: "id = ?", whereArgs: [id]);
    return result;
  }
  
  // Future<void> update(int id) async {
  //   final db = await dbProvider.database;
  //   var result =
  //       await db.update(userTable, where: "id = ?", whereArgs: [id]);

  // }


  Future<bool> checkUser(int id) async {
    final db = await dbProvider.database;
    try {
      List<Map> users =
          await db.query(userTable, where: 'id = ?', whereArgs: [id]);
      if (users.isNotEmpty) {
        return true;
      } else {
        return false;
      }
    } catch (error) {
      return false;
    }
  }
}
