import 'package:sqflite/sqflite.dart' as sql;

class SQL_Functions {

  ///creating database
  static Future<sql.Database>openOrCreateDb() async{
    return sql.openDatabase('users',version: 1,onCreate: (sql.Database db , int version)async{
      await createTable(db);
    }
    );
  }

  static Future<void> createTable(sql.Database db) async {
    await db.execute(
        'CREATE TABLE userdata (id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, name TEXT, email TEXT, password TEXT)');
  }








  static Future<int> addUser(String name, String email, String password) async{
    var db = await SQL_Functions.openOrCreateDb();  /// to open DAtabase
    var data = {'name' : name ,'email': email , 'password' : password}; // here keys are column names and values are from textformfield
    var id = db.insert('userdata', data);        /// or  var id  =db.insert('userdata',{'name' : name ,'email': email , 'password' : password});
    return id;


  }
  /// to check the  users email and password exist in table
  static Future<List<Map>> checkUserExist(String email, String password) async{
    var db = await SQL_Functions.openOrCreateDb();
    final data = await db.rawQuery("SELECT * FROM userdata WHERE email = '$email' AND password = '$password'");
    if(data.isNotEmpty){
      return data;
    }
    else{
      return data;
    }

  }
  /// to check the user is already registered
  static Future<List<Map>> checkUserAlreadyRegistered(String email) async{
    var db = await SQL_Functions.openOrCreateDb();
    final user = await db.rawQuery("SELECT * FROM userdata WHERE email = '$email'");
    if(user.isNotEmpty){
      return user;
    }
    else{
      return user;
    }
  }

  ///to read all the details from database
  static Future<List<Map<String,dynamic>>>All_Users_data() async{
    var db = await SQL_Functions.openOrCreateDb();
    final allusers = await db.rawQuery("SELECT * FROM userdata");
    return allusers;
  }

  ///to delete a user
  static Future<void>delete_user(int id) async{
    var db = await SQL_Functions.openOrCreateDb();
    db.delete('userdata',where: 'id = ?',whereArgs: [id] );

  }

  static Future<int> updateData(int id ,String uname, String uemail) async{
    var db = await SQL_Functions.openOrCreateDb();
    final newdata = {
      'name' : uname,
      'email' : uemail,
    };
     final newid = await db.update('userdata', newdata ,where: 'id = ?',whereArgs: [id] );
     return newid;
  }



}