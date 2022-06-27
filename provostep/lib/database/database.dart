import 'dart:async';
import 'package:provostep/database/typeConverters/dataTimeConverter.dart';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

//Here, we are importing the entities and the daos of the database
import 'package:provostep/database/daos/datadao.dart';
import 'package:provostep/database/entities/activity.dart';

import 'daos/datadao.dart';
import 'entities/activity.dart';

//The generated code will be in database.g.dart
part 'database.g.dart';

//Here we are saying that this is the first version of the Database and it has just 1 entity, i.e., Todo
@TypeConverters([DateTimeConverter])
@Database(version: 1, entities: [Calories, Steps, Distance])
abstract class AppDatabase extends FloorDatabase {
  //Add all the daos as getters here
  CaloriesDao get Calories;
  StepsDao get Steps;
  DistanceDao get Distance;
}//AppDatabase