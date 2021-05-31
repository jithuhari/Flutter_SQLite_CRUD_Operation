

import 'package:sqflite/sqflite.dart';
import 'package:sqlite_project/database/database_connection.dart';

class Repository{

   DatabaseConnection? _databaseConnection;

  Repository(){

    _databaseConnection = DatabaseConnection();

  }

  static Database? _database;

  Future<Database?> get database async{
    if (_database!=null) return _database;
    _database = await _databaseConnection!.setDatabase();
    return _database;
  }

  // insert data

  insertData(table, data) async{
    var connection = await database;
    return await connection!.insert(table,data);
  }

  // Read Data from db

  readData(table) async {
    var connection = await database;
    return await connection!.query(table);
  }

  //Read data by id
  readDataById(table , itemId) async{
    var connection = await database;
    return await connection!.query(table, where: 'id=?',whereArgs:[itemId]);
  }

  //Update data
  updateData(table, data) async{
    var connection = await database;
    return await connection!.update(table, data,where: 'id=?',whereArgs: [data['id']]);
  }  


}