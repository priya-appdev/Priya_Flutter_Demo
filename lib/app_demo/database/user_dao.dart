import 'package:counter_app/app_demo/database/appdatabase.dart';
import 'package:counter_app/app_demo/riverpod/user/user_state.dart';
import 'package:sqflite/sqflite.dart';

class UserDao {
  Future<Database> get _db async => AppDatabase.instance.database;

  Future<int> insertUser(UserState user) async {
    final db = await _db;
    final id = await db.insert(
      'users',
      user.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    return id;
  }

  Future<UserState?> getUserByEmail(String email) async {
    final db = await _db;
    final rows = await db.query(
      'users',
      where: 'email = ?',
      whereArgs: [email],
      limit: 1,
    );
    if (rows.isEmpty) return null;
    return UserState.fromMap(rows.first);
  }

  Future<UserState?> login(String email, String password) async {
    final db = await _db;
    final rows = await db.query(
      'users',
      where: 'email = ? AND password = ?',
      whereArgs: [email, password],
      limit: 1,
    );
    if (rows.isEmpty) return null;
    return UserState.fromMap(rows.first);
  }

  Future<void> updateUser(UserState user) async {
    if (user.id == null) return;
    final db = await _db;
    await db.update(
      'users',
      user.toMap(),
      where: 'id = ?',
      whereArgs: [user.id],
    );
  }
}
