// Step 1: Path helper functions ke liye package import kiya ja raha hai (jaise folders ko join karna)
import 'dart:math';

import 'package:path/path.dart';

// Step 2: SQLite database use karne ke liye sqflite package import kiya ja raha hai
import 'package:sqflite/sqflite.dart';

import '../models/task.dart';

// Step 3: Database ki tamam services ko handle karne ke liye ek class banayi gayi hai
class DatabaseServices {

  // Step 4: Singleton pattern ka use karte hue class ka single instance (object) banaya jo poori app mein ek hi rahega
  static final DatabaseServices instance = DatabaseServices._constructor();

  // Step 5: Database ka ek private variable banaya jo shuru mein null (?) hoga
  static Database? _db;

  // Step 6: Table ka naam string variable mein save kiya taake spelling ki galti na ho
  final String _taskTableName = "tasks";

  // Step 7: Column 'id' ka naam variable mein save kiya
  final String _taskIdColumnName = "id";

  // Step 8: Column 'content' (task ka text) ka naam variable mein save kiya
  final String _taskContentColumnName = "content";

  // Step 9: Column 'status' (task complete hai ya nahi) ka naam variable mein save kiya
  final String _taskStatusColumnName = "status";

  // Step 10: Private constructor banaya taake class ke bahar se koi naya object na bana sake
  DatabaseServices._constructor();

  // Step 11: Database ko safe tareeqe se access karne ke liye getter function banaya
  Future<Database> get database async{

    // Step 12: Agar database pehle se bana hua (not null) hai to wahi return kar do
    if (_db != null)
      return _db!;

    // Step 13: Agar database nahi bana hua to 'getDatabase()' function ko call karke database create karo
    _db = await getDatabase();

    // Step 14: Naya bana hua database return kar do (bang '!' operator ka matlab hai ke ab yeh null nahi hai)
    return _db!;
  }


  // Step 15: Database ko initialize aur create karne ka main function
  Future<Database> getDatabase() async{

    // Step 16: System se wo folder path liya jahan databases save hoti hain
    final databaseDirPath = await getDatabasesPath();

    // Step 17: Folder path aur database ke naam ("master_db.db") ko aapas mein jod (join) diya
    final databasePath = join(databaseDirPath, "master_db.db");

    // Step 18: Database ko open kiya, agar pehle se nahi bana hoga to 'onCreate' trigger hoga
    final database = await openDatabase(
        databasePath,
        version: 1,

        // Step 19: Jab database pehli baar banega to yeh function chalega aur table create karega
        onCreate: (db,version){

          // Step 20: SQL query chalayi ja rahi hai table banane ke liye
          db.execute(''' 
        CREATE TABLE $_taskTableName ( 
          $_taskIdColumnName INTEGER PRIMARY KEY, -- 'id' column ko primary key banaya jo unique hogi
          $_taskContentColumnName TEXT NOT NULL,  -- 'content' column ko text banaya jo khali nahi ho sakta
          $_taskStatusColumnName INTEGER NOT NULL -- 'status' column ko integer banaya (jaise 0 ya 1)
        ) 
        ''');
        }
    );

    // Step 21: Successfully khula hua ya naya bana hua database return kar diya
    return database;
  }

  void addTask(String content,) async{
    final db = await database;
    await db .insert(
        _taskTableName,
        {
          _taskContentColumnName: content,
          _taskStatusColumnName: 0,
        },
    );
  }

  Future<List<Task>> getTask ()async{
    final db = await database;
    final data = await db.query(_taskTableName);
    List<Task> tasks = data
        .map(
            (e) => Task(
                id: e["id"] as int,
                status: e["status"] as int,
                content: e["content"] as String),
        )
        .toList();
    return tasks;
  }
  void updateTaskStatus(int id, int status) async{
    final db = await database;
    await db.update(_taskTableName, {
      _taskStatusColumnName: status,
    },
      where: '$_taskIdColumnName = ?',
      whereArgs: [id],
    );
  }

  void deleteTask(int id) async{
    final db = await database; 
    await db.delete(
      _taskTableName,

      where: "$_taskIdColumnName = ?",
      whereArgs: [id],
    );
  }
}