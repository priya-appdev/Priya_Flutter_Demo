import 'package:counter_app/app_demo/database/appdatabase.dart';
import 'package:counter_app/app_demo/model/product_model.dart';
import 'package:sqflite/sqflite.dart';

class ProductDao {
  Future<Database> get _db async => AppDatabase.instance.database;

  Future<void> insertProductList(List<Product> products) async {
    final db = await _db;
    final batch = db.batch();
    for (final p in products) {
      batch.insert(
        'products',
        p.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
    await batch.commit(noResult: true);
  }

  Future<List<Product>> getProducts() async {
    final db = await _db;
    final rows = await db.query('products');
    return rows.map((row) => Product.fromMap(row)).toList();
  }

  Future<void> clearProducts() async {
    final db = await _db;
    await db.delete('products');
  }
}
