import 'dart:async';
import 'dart:io';
import 'package:panthion/models/note.dart';
import 'package:panthion/utils/constants.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = new DatabaseHelper._make();

  factory DatabaseHelper() => _instance;

  static Database _db;

  DatabaseHelper._make();

  Future<Database> get db async {
    if (_db != null) return _db;
    _db = await initDB();
    return _db;
  }

  initDB() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, Constants.DB_NAME);
    var myDb =
        openDatabase(path, version: Constants.DB_VERSION, onCreate: _onCreate);

    return myDb;
  }

  void _onCreate(Database db, int version) async {
    await db.execute(
        "CREATE TABLE ${Constants.TABLE_NAME} (${Constants.COLUMN_ID} INTEGER PRIMARY KEY, "
        "${Constants.COLUMN_TEXT} TEXT, ${Constants.COLUMN_DATE} TEXT);");
  }

  Future<int> insertNote(Note note) async {
    var dbClient = await db;
    int returningId = await dbClient.insert(Constants.TABLE_NAME, note.toMap());
    return returningId;
  }

  Future<List<Note>> getAllNotes() async {
    var dbClient = await db;
    var result = await dbClient.rawQuery(
        "SELECT * FROM ${Constants.TABLE_NAME} ORDER BY ${Constants.COLUMN_DATE} DESC");

    return [for (var n in result.toList()) Note.fromMap(n)];
  }

  Future<int> getCount() async {
    var dbClient = await db;
    int count = Sqflite.firstIntValue(await dbClient
        .rawQuery("SELECT COUNT(*) FROM ${Constants.TABLE_NAME}"));
    return count;
  }

  Future<Note> getSingleItem(int id) async {
    var dbClient = await db;
    var result = await dbClient.rawQuery(
        "SELECT * FROM ${Constants.TABLE_NAME} WHERE ${Constants.COLUMN_ID} = $id");
    if (result == null) return null;
    return new Note.fromMap(result.first);
  }

  Future<int> deleteItem(int id) async {
    var dbClient = await db;
    int count = await dbClient.delete(Constants.TABLE_NAME,
        where: "${Constants.COLUMN_ID} = ?", whereArgs: [id]);
    return count;
  }

  Future<int> updateItem(Note note) async {
    var dbClient = await db;
    int count = await dbClient.update(Constants.TABLE_NAME, note.toMap(),
        where: "${Constants.COLUMN_ID} = ?", whereArgs: [note.id]);

    return count;
  }
}
