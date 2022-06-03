import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

const userTable = 'userTable';

class UserDBProvider {
  static final UserDBProvider usrProvider = UserDBProvider();
  late Database _database;

  void initDB(Database database, int version) async {
    await database.execute("CREATE TABLE $userTable ("
        "email TEXT PRIMARY KEY, "
        "username TEXT, "
        "accesstoken TEXT ,"
        "first_name TEXT,"
        "refreshtoken TEXT, "
        "last_name TEXT, "
        ")");
  }

  Future<Database> get database async {
    if (_database != null) {
      return _database;
    }
    _database = await createDatabase();
    return _database;
  }

  createDatabase() async {
    Directory filesDirectory = await getApplicationDocumentsDirectory();
    String path = join(filesDirectory.path, "User.db");

    var database = await openDatabase(
      path,
      version: 1,
      onCreate: initDB,
    );
    return database;
  }
}
