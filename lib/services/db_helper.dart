import 'dart:io';
import 'package:note_app/models/mycard.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  /// singlton
  DBHelper._();
  static final DBHelper dbHelper = DBHelper._();

  Database? myDatabase;
  String? tableName = 'Nots';

  /// initial database
  initDB() async {
    myDatabase = await connectToDB();
  }

  /// create table
  createTable(Database db) async {
    await db.execute(
        'CREATE TABLE $tableName (id INTEGER PRIMARY KEY AUTOINCREMENT,title TEXT,sub_title TEXT)');
  }

  /// connect to db
  Future<Database> connectToDB() async {
    Directory appDocDir = await getApplicationDocumentsDirectory();
    String appDocPath = appDocDir.path;
    String dbPath = join(appDocPath, 'nots.db');
    Database database = await openDatabase(dbPath, version: 1,
        onCreate: (Database db, int version) async {
      createTable(db);
    });
    return database;
  }

// deal with db table
  addTask(MyNote _note) async {
    try {
      int id = await myDatabase!.insert(tableName!, _note.toJson());
    } on Exception catch (e) {
      print(e);
    }
  }

  Future<List<MyNote>> getAllTasks() async {
    List<MyNote> notes = [];
    List<Map<String, dynamic>> allTasks = await myDatabase!.query(tableName!);
    allTasks.forEach((element) {
      MyNote newTask = MyNote.fromJson(element);
      notes.add(newTask);
    });

    return notes;
  }

  deleteTask(int? id) async {
    await myDatabase!.delete(tableName!, where: 'id=?', whereArgs: [id]);
  }

  getTaskById(int? id) {
    return myDatabase!.query(tableName!, where: 'id=?', whereArgs: [id]);
  }

  updateTask(MyNote _myNotes) async {
    int value = await myDatabase!.update(tableName!, _myNotes.toJson(),
        where: 'id=?', whereArgs: [_myNotes.id]);
    print(value);
  }
}
