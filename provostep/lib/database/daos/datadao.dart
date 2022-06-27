import 'package:provostep/database/entities/activity.dart';
import 'package:floor/floor.dart';

//Here, we are saying that the following class defines a dao.

@dao
abstract class CaloriesDao {
  //Query #1: SELECT -> this allows to obtain all the entries of the Todo table
  @Query('SELECT * FROM Calories')
  Future<List<Calories>> findAllCaloriess();

  //Query #2: INSERT -> this allows to add a Todo in the table
  @Insert(onConflict: OnConflictStrategy.ignore)
  Future<void> insertCalories(Calories calories);

  //Query #3: DELETE -> this allows to delete a Todo from the table
  @delete
  Future<void> deleteCalories(Calories calories);
} //TodoDao

@dao
abstract class StepsDao {
  //Query #1: SELECT -> this allows to obtain all the entries of the Todo table
  @Query('SELECT * FROM Steps')
  Future<List<Steps>> findAllStepss();

  //Query #2: INSERT -> this allows to add a Todo in the table
  @Insert(onConflict: OnConflictStrategy.ignore)
  Future<void> insertSteps(Steps steps);

  //Query #3: DELETE -> this allows to delete a Todo from the table
  @delete
  Future<void> deleteSteps(Steps steps);
} //TodoDao

@dao
abstract class DistanceDao {
  //Query #1: SELECT -> this allows to obtain all the entries of the Todo table
  @Query('SELECT * FROM Distance')
  Future<List<Distance>> findAllDistances();

  //Query #2: INSERT -> this allows to add a Todo in the table
  @Insert(onConflict: OnConflictStrategy.ignore)
  Future<void> insertDistance(Distance distance);

  //Query #3: DELETE -> this allows to delete a Todo from the table
  @delete
  Future<void> deleteDistance(Distance distance);
}//TodoDao
