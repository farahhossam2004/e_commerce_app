import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart' as sql;
import 'package:sqflite/sqflite.dart';

class SQLHelper {
// first initilaization of the db (in main)
  static Future<Database> initDb() async {
    return sql.openDatabase(
      'products.db', // Database name
      version: 1, // Version number
      onCreate: (Database database, int version) async {
        await createTable(database);
      },
    );
  }

  // create table
  static Future<void> createTable(Database database) async {
    await database.execute("""
      CREATE TABLE products(
        id TEXT PRIMARY KEY NOT NULL,
        title TEXT NOT NULL,
        description TEXT,
        image TEXT,
        quantity INTEGER NOT NULL,
        price REAL NOT NULL
      )
    """);

    await database.execute("""
      CREATE TABLE wishlist(
        id INTEGER PRIMARY KEY NOT NULL,
        title TEXT NOT NULL,
        price REAL,
      description TEXT,
      category TEXT,
      image TEXT
      )
    """);
    debugPrint("Table Created");
  }

  // add product to the table
  static Future<int> add(String productId, String name, String description,
      String imageUrl, int quantity, double price) async {
    final db = await SQLHelper.initDb();
    final data = {
      'id': productId,
      'title': name,
      'description': description,
      'image': imageUrl,
      'quantity': quantity,
      'price': price
    };
    final id = await db.insert('products', data,
        conflictAlgorithm: ConflictAlgorithm.replace);
    debugPrint("Product Added");
    return id;
  }

  // get all products
  static Future<List<Map<String, dynamic>>> get() async {
    final db = await SQLHelper.initDb();
    return db.query('products', orderBy: "id");
  }

  // get product by id
  static Future<List<Map<String, dynamic>>> getByProductId(
      String productId) async {
    final db = await SQLHelper.initDb();
    return db.query('products', where: "id = ?", whereArgs: [productId]);
  }

  // update product
  static Future<int> update(String productId, String name, String description,
      String imageUrl, int quantity, double price) async {
    final db = await SQLHelper.initDb();
    final data = {
      'title': name,
      'description': description,
      'image': imageUrl,
      'quantity': quantity,
      'price': price
    };
    final result = await db
        .update('products', data, where: "id = ?", whereArgs: [productId]);
    return result;
  }

  // delete a product
  static Future<void> delete(String productId) async {
    final db = await SQLHelper.initDb();
    try {
      await db.delete("products", where: "id = ?", whereArgs: [productId]);
    } catch (err) {
      debugPrint("Something went wrong: $err");
    }
  }

// add to wishlist table
  static Future<int> addToWishList(String productId, String name,
      String description, String imageUrl, double price) async {
    final db = await SQLHelper.initDb();
    final data = {
      'id': productId,
      'title': name,
      'description': description,
      'image': imageUrl,
      'price': price
    };
    final id = await db.insert('wishlist', data,
        conflictAlgorithm: ConflictAlgorithm.replace);
    debugPrint("Product Added");
    return id;
  }

// get wishlist
  static Future<List<Map<String, dynamic>>> getWishList() async {
    final db = await SQLHelper.initDb();
    return db.query('wishlist', orderBy: "id");
  }

  // delete from wishlist
  static Future<void> deleteFromWishlist(String productId) async {
    final db = await SQLHelper.initDb();
    try {
      await db.delete("wishlist", where: "id = ?", whereArgs: [productId]);
    } catch (err) {
      debugPrint("Something went wrong: $err");
    }
  }

  // bool to check if the product already exists in the wishlist 
  static Future<bool> isInWishlist(String productId) async {
    final db = await SQLHelper.initDb();
    final result = await db.query(
      'wishlist',
      where: 'id = ?',
      whereArgs: [productId],
    );
    return result.isNotEmpty;
    // l result byrg3 3la shkl map 
    // lw msh empty yb2a keda l product mogod w hyrg3 1 y3ne true 
  }
}
