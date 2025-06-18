import 'package:flutterapplication1/database/db.dart';
import 'package:flutterapplication1/model/dogmodel.dart';
import 'package:sqflite/sqflite.dart';

//Insert
Future<int> insertDog(Dog dog) async {
  final Database db = await getDatabase();
  return db.insert("dogs", dog.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace);
}

//findAll()
Future<List<Map>> findAll() async {
  final Database db = await getDatabase();
  return db.query('dogs');
}

//DeleteByID
Future<int> deleteById(int id) async {
  final Database db = await getDatabase();
  return db.delete('dogs', where: 'id = ?', whereArgs: [id]);
}
