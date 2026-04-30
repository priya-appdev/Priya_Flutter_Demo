
// import 'package:counter_app/app_demo/riverpod/user/user_state.dart';
// import 'package:path/path.dart';
// import 'package:sqflite/sqflite.dart';

// class UserDatabase {

//   UserDatabase._();

//   static final UserDatabase instance = UserDatabase._();
//   static Database? _db;

//   Future<Database> get database async{
//     if (_db != null) return _db!;
//     _db = await _initDB();
//     return _db!;
//   }

//   Future<Database> _initDB() async{
//     final dbPath = await getDatabasesPath();
//     final path = join(dbPath,'user.db');

//     print('Databas path: $path');

//     return openDatabase(
//       path,
//       version: 1,
//       onCreate: (db, version) async{
//         print('creating user table..');
//         await db.execute(
//           '''
//             CREATE TABLE users(
//               id INTEGER PRIMARY KEY AUTOINCREMENT,
//               firstName TEXT,
//               lastName TEXT,
//               email TEXT UNIQUE,
//               phone TEXT,
//               password TEXT,
//               retypepassword TEXT,
//               country TEXT,
//               state TEXT,
//               city TEXT,
//               streetaddress TEXT,
//               message TEXT
//             )
//           '''
//         );
//       },
//     );
//   }

//   Future<int> insertUser(UserState user) async{
//     final db = await database;
//     final id = await db.insert('users', user.toMap(),conflictAlgorithm: ConflictAlgorithm.replace);
//     print('Insert user (rowId=$id): ${user.toMap()}');
//     return id;
//   }

//   Future<UserState?> getUserByEmail(String email) async{
//     final db = await database;
//     final rows = await db.query(
//       'users',
//       where: 'email = ?',
//       whereArgs: [email],
//       limit: 1
//     );
//     if (rows.isEmpty) return null;
//     return UserState.fromMap(rows.first);
//   }

//   Future<UserState?> login(String email, String password) async{
//     final db = await database;
//     final rows = await db.query(
//       'users',
//       where: 'email = ? AND password = ?',
//       whereArgs: [email,password],
//       limit: 1,
//     );
//     if (rows.isEmpty) return null;
//     return UserState.fromMap(rows.first);
//   }

//   Future<void> updateUser(UserState user) async {

//     if (user.id == null){
//       print('updated called without id - skipping');
//       return;
      
//     }

//     final db = await database;
//     final count = await db.update('users', user.toMap(),
//     where: 'id = ?',
//     whereArgs: [user.id],
//     );
//     print('🔧 updateUser: rows updated=$count, id=${user.id}');
//   }
// }