import 'package:provostep/database/entities/activity.dart';
import 'package:floor/floor.dart';
import 'package:flutter/material.dart';
import 'package:provostep/database/database.dart';

class DatabaseRepository extends ChangeNotifier {
  //The state of the database is just the AppDatabase
  final AppDatabase database;

  //Default constructor
  DatabaseRepository({required this.database});

  //This method wraps the findAllTodos() method of the DAO
  Future<List<Calories>> findAllCaloriess() async {
    final results = await database.Calories.findAllCaloriess();
    return results;
  }
  //findAllTodos
  /* static Future<List<Map<String, dynamic>>> gedata() async{
    final results= await database.stepsdataDao.findAllstepsDatas();
    return results.rawQuery('SELECT * form stepsData'); 
   } */

  //This method wraps the insertTodo() method of the DAO.
  //Then, it notifies the listeners that something changed.
  Future<void> insertCalories(Calories calories) async {
    await database.Calories.insertCalories(calories);
    notifyListeners();
  } //insertTodo

  //This method wraps the deleteTodo() method of the DAO.
  //Then, it notifies the listeners that something changed.
  Future<void> removeCalories(Calories calories) async {
    await database.Calories.deleteCalories(calories);
    notifyListeners();
  } //removeTodo

  //This method wraps the findAllTodos() method of the DAO
  Future<List<Steps>> findAllStepss() async {
    final results = await database.Steps.findAllStepss();
    return results;
  }
  //findAllTodos
  /* static Future<List<Map<String, dynamic>>> gedata() async{
    final results= await database.stepsdataDao.findAllstepsDatas();
    return results.rawQuery('SELECT * form stepsData'); 
   } */

  //This method wraps the insertTodo() method of the DAO.
  //Then, it notifies the listeners that something changed.
  Future<void> insertSteps(Steps steps) async {
    await database.Steps.insertSteps(steps);
    notifyListeners();
  } //insertTodo

  //This method wraps the deleteTodo() method of the DAO.
  //Then, it notifies the listeners that something changed.
  Future<void> removeSteps(Steps steps) async {
    await database.Steps.deleteSteps(steps);
    notifyListeners();
  } //removeTodo

  Future<List<Distance>> findAllDistances() async {
    final results = await database.Distance.findAllDistances();
    return results;
  }
  //findAllTodos

  //This method wraps the insertTodo() method of the DAO.
  //Then, it notifies the listeners that something changed.
  Future<void> insertDistance(Distance distance) async {
    await database.Distance.insertDistance(distance);
    notifyListeners();
  } //insertTodo

  //This method wraps the deleteTodo() method of the DAO.
  //Then, it notifies the listeners that something changed.
  Future<void> removeDistance(Distance distance) async {
    await database.Distance.deleteDistance(distance);
    notifyListeners();
  } //removeTodo

} //DatabaseRepository