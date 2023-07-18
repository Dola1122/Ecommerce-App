import 'package:ecommerce_app/model/cart_product_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class CartDatabaseHelper {
  static Database? _database;

  static Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }

    _database = await _initDatabase();
    return _database!;
  }

  static Future<Database> _initDatabase() async {
    final path = await getDatabasesPath();
    final databasePath = join(path, 'cart_database.db');

    return openDatabase(
      databasePath,
      version: 2,
      onCreate: (db, version) {
        return db.execute(
          '''
          CREATE TABLE cart_products(
            name TEXT,
            image TEXT,
            price REAL,
            quantity INTEGER,
            productId TEXT
          )
          ''',
        );
      },
    );
  }

  static Future<List<CartProductModel>> getCartProducts() async {
    final db = await database;
    final List<Map<String, dynamic>> cartData = await db.query('cart_products');

    return cartData
        .map((productData) => CartProductModel.fromJson(productData))
        .toList();
  }

  static Future<void> saveCartProduct(CartProductModel cartProduct) async {
    final db = await database;
    await db.insert('cart_products', cartProduct.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static Future<void> updateCartProduct(CartProductModel cartProduct) async {
    final db = await database;
    await db.update(
      'cart_products',
      cartProduct.toJson(),
      where: 'productId = ?',
      whereArgs: [cartProduct.productId],
    );
  }

  static Future<void> deleteCartProduct(String productId) async {
    final db = await database;
    await db.delete(
      'cart_products',
      where: 'productId = ?',
      whereArgs: [productId],
    );
  }
}
