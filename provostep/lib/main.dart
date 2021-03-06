import 'package:provostep/screens/homepage.dart';
import 'package:provostep/screens/passi.dart';
import 'package:provostep/screens/steppage.dart';
import 'package:provostep/screens/tabpage.dart';
import 'package:flutter/material.dart';
import 'package:provostep/screens/distancepage.dart';
import 'package:provostep/database/database.dart';
import 'package:provostep/repository/databaseRepository.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  //This is a special method that use WidgetFlutterBinding to interact with the Flutter engine.
  //This is needed when you need to interact with the native core of the app.
  //Here, we need it since when need to initialize the DB before running the app.
  WidgetsFlutterBinding.ensureInitialized();

  //This opens the database.
  final AppDatabase database =
      await $FloorAppDatabase.databaseBuilder('app_database.db').build();
  //This creates a new DatabaseRepository from the AppDatabase instance just initialized
  final databaseRepository = DatabaseRepository(database: database);
  //Here, we run the app and we provide to the whole widget tree the instance of the DatabaseRepository.
  //That instance will be then shared through the platform and will be unique.
  runApp(ChangeNotifierProvider<DatabaseRepository>(
    create: (context) => databaseRepository,
    child: MyApp(),
  ));
} //main

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //This specifies the app entrypoint
      initialRoute: 'home',
      //initialRoute: HomePage.route,
      //This maps names to the set of routes within the app
      routes: {
        //HomePage.route: (context) => HomePage(),
        'home': (context) => HomePage(),
        'step': (context) => StepPage(),
        'tab': (context) => TabPage(),
        'passipag': (context) => PassiPage(),
        'distancepag': (context) => DistancePage(),
      },
    );
  } //build
}

class GraficoPage {} //MyApp