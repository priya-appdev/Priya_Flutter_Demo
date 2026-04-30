// import 'package:counter_app/app_demo/model/product_model.dart';
// import 'package:path/path.dart';
// import 'package:sqflite/sqflite.dart';

// class ProductDatabse {
//   ProductDatabse._();

//   static final ProductDatabse instance = ProductDatabse._();
//   static Database? _db;

//   Future<Database> get database async{
//     if (_db != null) return _db!;
//     _db = await _initDB();
//     return _db!;
//   }

//   Future<Database> _initDB() async{
//     final dbPath = await getDatabasesPath();
//     final path = join(dbPath,'products.db');
//     return openDatabase(
//       path,
//       version: 1,
//       onCreate: (db, version) async{
//         await db.execute('''
//             CREATE TABLE products(
//               id INTEGER PRIMARY KEY,
//               title TEXT,
//               price REAL,
//               description TEXT,
//               thumbnail TEXT
//             )
//         ''');
//       },
//     );
//   }

//   Future<void> insertProductList(List<Product> products) async{
//     final db = await database;
//     final batch = db.batch();
//     for( final p in products){
//       batch.insert('products', p.toMap(),
//       conflictAlgorithm: ConflictAlgorithm.replace,
//       );
//     }
//     await batch.commit(noResult: true);
//   }

//   Future<List<Product>> getProducts() async{
//     final db = await database;
//     final rows = await db.query('products');
//     return rows.map((row) => Product.fromMap(row)).toList();
//   }

//   Future<void> clearProdcut() async{
//     final db = await database;
//     await db.delete('products');
//   }
// }
