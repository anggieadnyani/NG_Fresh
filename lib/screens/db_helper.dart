import 'package:sqflite/sqflite.dart' as sql;
import 'package:sqflite/sqlite_api.dart';

class SQLHelper {
  // Fungsi untuk membuat tabel database jika belum ada
  static Future<void> createTables(sql.Database database) async {
    await database.execute("""CREATE TABLE data(
      id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
      title TEXT,
      desc TEXT,
      imageUrl TEXT, 
      createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
    )""");
  }

  // Fungsi untuk membuka atau membuat database baru
  static Future<sql.Database> db() async {
    return sql.openDatabase(
      "database_name.db",
      version: 1,
      onCreate: (sql.Database database, int version) async {
        await createTables(database);
      }
    );
  }

  // Fungsi untuk menambahkan data baru ke dalam tabel
  static Future<int> createData(String title, String? desc, String imageUrl) async {
    final db = await SQLHelper.db();

    final data = {'title': title, 'desc': desc, 'imageUrl': imageUrl}; // Tambah imageUrl ke data
    final id = await db.insert('data', data, conflictAlgorithm: sql.ConflictAlgorithm.replace);

    return id;
  }

  // Fungsi untuk mendapatkan semua data dari tabel
  static Future<List<Map<String, dynamic>>> getAllData() async {
    final db = await SQLHelper.db();
    return db.query('data', orderBy: 'id');
  }

  // Fungsi untuk mendapatkan satu data berdasarkan ID dari tabel
  static Future<List<Map<String, dynamic>>> getSingleData(int id) async {
    final db = await SQLHelper.db();
    return db.query('data', where: "id = ?", whereArgs: [id], limit: 1);
  }

  // Fungsi untuk memperbarui data yang ada dalam tabel berdasarkan ID
  static Future<int> updateData(int id, String title, String? desc, String imageUrl) async {
    final db = await SQLHelper.db();
    final data = {
      'title': title,
      'desc': desc,
      'imageUrl': imageUrl,
      'createdAt': DateTime.now().toString()
    };
    final result = await db.update('data', data, where: "id = ?", whereArgs: [id]);
    return result;
  }

  // Fungsi untuk menghapus data dari tabel berdasarkan ID
  static Future<void> deleteData(int id) async {
    final db = await SQLHelper.db();
    try {
      await db.delete('data', where: "id = ?", whereArgs: [id]);
    } catch (e) {
      // Handle error jika terjadi
    }
  }
}
