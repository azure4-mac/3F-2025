import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

Future<Database> getDatabase() async {
  String dbPath = join(await getDatabasesPath(), 'dogs.db');
  sqfliteFfiInit();
  return openDatabase(
    dbPath,
    version: 1,
    onCreate: (Database db, int version) async {
      await db.execute('''
        CREATE TABLE dogs(
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          name TEXT,
          idade INTEGER
        )
      ''');
    },
  );
}
