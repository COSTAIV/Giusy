import 'dart:ffi';

import 'package:provostep/database/entities/activity.dart';
import 'package:provostep/repository/databaseRepository.dart';
import 'package:provostep/screens/homepage.dart';
import 'package:provostep/screens/tabpage.dart';
import 'package:provostep/formats.dart';

//import 'package:fitbitter_test/widgets/formSeparator.dart';
//import 'package:fitbitter_test/widgets/formTiles.dart';

import 'package:floor/floor.dart';
import 'package:flutter/material.dart';
import 'package:fitbitter/fitbitter.dart';

import 'package:provostep/utils/strings.dart';
import 'package:provider/provider.dart';

//This is the class that implement the page to be used to edit existing meals and add new meals.
//This is a StatefulWidget since it needs to rebuild when the form fields change.
class PassiPage extends StatelessWidget {
  PassiPage({Key? key}) : super(key: key);

  static const route = '/';
  static const routeDisplayName = 'Passipage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('PassiPage')),
        body: Center(
          child: Consumer<DatabaseRepository>(builder: (context, dbr, child) {
            //The logic is to query the DB for the entire list of Meal using dbr.findAllMeals()
            //and then populate the ListView accordingly.
            //We need to use a FutureBuilder since the result of dbr.findAllMeals() is a Future.
            return FutureBuilder(
              initialData: null,
              future: dbr.findAllStepss(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final datastep = snapshot.data as List<Steps>;
                  final datadistance = snapshot.data as List<Steps>;
                  final datacalories = snapshot.data as List<Steps>;

                  //If the Meal table is empty, show a simple Text, otherwise show the list of meals using a ListView.
                  return datastep.length == 0
                      ? Text('')
                      : ListView.builder(
                          itemCount: datastep.length,
                          itemBuilder: (context, Index) {
                            //Here, we are using a Card to show a Meal
                            return Card(
                              elevation: 5,
                              child: ListTile(
                                title: Text(
                                    'Day : ${Formats.onlyDayDateFormat.format(datastep[Index].day)}'),
                                subtitle: Text(
                                    'Steps : ${datastep[Index].steps}'
                                    /*'Calories : ${datacalories[Index].calories}'
                                    'Distance : ${datadistance[Index].distance}'*/
                                    ),
                                //When a ListTile is tapped, the user is redirected to the MealPage, where it will be able to edit it.
                              ),
                            );
                          });
                } else {
                  return CircularProgressIndicator();
                }
              },
            );
          }),
        ));
  }
}
