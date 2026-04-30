import 'package:counter_app/app_demo/model/cart_model.dart';
import 'package:counter_app/app_demo/model/product_model.dart';
import 'package:counter_app/app_demo/riverpod/user/user_state.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class AppDatabase{

  AppDatabase._();
  static final AppDatabase instance = AppDatabase._();
  static Database? _db;

  Future<Database> get database async{
    if (_db != null) return _db!;
    _db = await _initDB();
    return _db!;
  }

  Future<Database> _initDB() async{

    final dbPath = await getDatabasesPath();
    final path = join(dbPath,'app.db');
    print('AppDatabase path: $path');

    return openDatabase(
      path,
      version: 1,
      onCreate: (db,version) async{
        print('onCreate firing — creating all tables');
        await db.execute(
          '''
            CREATE TABLE  users(
              id INTEGER PRIMARY KEY AUTOINCREMENT,
              firstName TEXT,
              lastName TEXT,
              email TEXT UNIQUE,
              phone TEXT,
              password TEXT,
              country TEXT,
              state TEXT,
              city TEXT,
              streetaddress TEXT,
              message TEXT
            )
          '''
        );
        await db.execute(
          '''
            CREATE TABLE products(
              id INTEGER PRIMARY KEY,
              title TEXT,
              price REAL,
              description TEXT,
              thumbnail TEXT
            )
          '''
        );

        await db.execute(
          '''
            CREATE TABLE carts(
              id INTEGER PRIMARY KEY,
              userId INTEGER,
              total REAL,
              discountedTotal REAL,
              totalProducts INTEGER
            )
          '''
        );

        await db.execute(
          '''
            CREATE TABLE cart_products(
              rowId INTEGER PRIMARY KEY AUTOINCREMENT,
              cartId INTEGER,
              productId INTEGER,
              title TEXT,
              price REAL,
              quantity INTEGER,
              thumbnail TEXT,
              FOREIGN KEY (cartId) REFERENCES carts(id) ON DELETE CASCADE
            )
          '''
        );

      }
    );
  }
}

class UserDao{

  Future<Database> get _db async => AppDatabase.instance.database;

  Future<int> insertUser(UserState user) async{

    final db = await _db;
    return db.insert('users', user.toMap(),conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<UserState?> login(String email,String password) async{
    final db = await _db;
    final rows = await db.query('users',
        where: 'email = ? AND password = ?',
        whereArgs: [email,password],limit: 1
    );
    if (rows.isEmpty) return null;
    return UserState.fromMap(rows.first);
  }

}

class ProductDao{

  Future<Database> get _db async => AppDatabase.instance.database;

  Future<void> insertProductList(List<Product> products) async{

    final db = await _db;
    final batch = db.batch();

    for (final p in products){
      batch.insert('products', p.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace
      );
    }
    await batch.commit(noResult: true);
  }

  Future<List<Product>> getProducts() async{
    final db = await _db;
    final rows = await db.query('products');
    return rows.map(Product.fromMap).toList();
  }
}

class CartDao{

  Future<Database> get _db async => AppDatabase.instance.database;

  Future<void> insertCartList(List<Cart> carts) async{

    final db = await _db;
    final batch = db.batch();

    for( final cart in carts){
      batch.insert('carts', cart.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace
    );

    batch.delete('cart_products',
      where: 'cartId = ?',whereArgs: [cart.id]
    );

    for (final p in cart.products){
      batch.insert('cart_products', p.toMap(cart.id));
    }

   }
   await batch.commit(noResult: true);
  }

  Future<List<Cart>> getCarts() async{

    final db = await _db;
    final cartsRows = await db.query('carts');

    final result = <Cart>[];
    for (final row in cartsRows){
      final productRows = await db.query(
        'cart_products',
        where: 'cartId = ?',
        whereArgs: [row['id']],
      );
      final products = productRows.map((r) => CartProduct.fromMap(r)).toList();
      result.add(Cart.fromMap(row,products));
    }
    return result;
  }


}