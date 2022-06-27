import 'package:provostep/database/entities/activity.dart';
import 'package:provostep/repository/databaseRepository.dart';
import 'package:provostep/screens/homepage.dart';
import 'package:floor/floor.dart';
import 'package:flutter/material.dart';
import 'package:fitbitter/fitbitter.dart';

import 'package:provostep/utils/strings.dart';
import 'package:provider/provider.dart';
import 'package:provostep/screens/passi.dart';
import 'package:provostep/screens/distancepage.dart';

class TabPage extends StatelessWidget {
  TabPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('TabPage'),
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: Text('Fetch steps data'),
              onPressed: () async {
                Navigator.pushNamed(context, 'passipag');
                //Instantiate a proper data manager
                FitbitActivityTimeseriesDataManager
                    fitbitActivityTimeseriesDataManager =
                    FitbitActivityTimeseriesDataManager(
                  clientID: Strings.fitbitClientID,
                  clientSecret: Strings.fitbitClientSecret,
                  type: 'calories',
                );
                //Fetch data
                final caloriesData = await fitbitActivityTimeseriesDataManager
                    .fetch(FitbitActivityTimeseriesAPIURL.dateRangeWithResource(
                  startDate: DateTime.now().subtract(const Duration(days: 100)),
                  endDate: DateTime.now(),
                  userID: '7ML2XV',
                  resource: fitbitActivityTimeseriesDataManager.type,
                )) as List<FitbitActivityTimeseriesData>;
                // Use them as you want
                print(caloriesData);
                for (var i = 0; i < caloriesData.length - 1; i++) {
                  DateTime? data = caloriesData.elementAt(i).dateOfMonitoring;
                  double? calorie = caloriesData.elementAt(i).value;
                  print(Calories(data!, calorie!).calories.toString());
                  print(Calories(data, calorie).day.toString());
                  await Provider.of<DatabaseRepository>(context, listen: false)
                      .insertCalories(Calories(data, calorie));
                }
                List prova = await Provider.of<DatabaseRepository>(context,
                        listen: false)
                    .findAllCaloriess();
                for (var i = 0; i < prova.length; i++) {
                  //print(prova.elementAt(i).dateofMonitoring.toString());
                  print(prova.elementAt(i).calories.toString());

                  print('calorie $prova.elementAt(i).calories.toString()');
                }
              },
            ),
            ElevatedButton(
              child: Text('Fetch distance data'),
              onPressed: () async {
                Navigator.pushNamed(context, 'distancepag');
                //Instantiate a proper data manager
                FitbitActivityTimeseriesDataManager
                    fitbitActivityTimeseriesDataManager =
                    FitbitActivityTimeseriesDataManager(
                  clientID: Strings.fitbitClientID,
                  clientSecret: Strings.fitbitClientSecret,
                  type: 'distance',
                );
                //Fetch data
                final DistanceData = await fitbitActivityTimeseriesDataManager
                    .fetch(FitbitActivityTimeseriesAPIURL.dateRangeWithResource(
                  startDate: DateTime.now().subtract(const Duration(days: 100)),
                  endDate: DateTime.now(),
                  userID: '7ML2XV',
                  resource: fitbitActivityTimeseriesDataManager.type,
                )) as List<FitbitActivityTimeseriesData>;
                // Use them as you want
                print(DistanceData);
                for (var i = 0; i < DistanceData.length - 1; i++) {
                  DateTime? data = DistanceData.elementAt(i).dateOfMonitoring;
                  double? distanza = DistanceData.elementAt(i).value;
                  print(Distance(data!, distanza!).distance.toString());
                  print(Distance(data, distanza).day.toString());
                  await Provider.of<DatabaseRepository>(context, listen: false)
                      .insertDistance(Distance(data, distanza));
                }
                List prova2 = await Provider.of<DatabaseRepository>(context,
                        listen: false)
                    .findAllDistances();
                for (var i = 0; i < prova2.length; i++) {
                  //print(prova.elementAt(i).dateofMonitoring.toString());
                  print(prova2.elementAt(i).distance.toString());

                  print(' $prova2.elementAt(i).distance.toString()');
                }
              },
            ),
            ElevatedButton(
                child: Text('Fetch steps data'),
                onPressed: () async {
                  Navigator.pushNamed(context, 'passipag');

                  //Instantiate a proper data manager
                  FitbitActivityTimeseriesDataManager
                      fitbitActivityTimeseriesDataManager =
                      FitbitActivityTimeseriesDataManager(
                    clientID: Strings.fitbitClientID,
                    clientSecret: Strings.fitbitClientSecret,
                    type: 'steps',
                  );
                  //Fetch data
                  final stepsData =
                       await fitbitActivityTimeseriesDataManager.fetch(
                          FitbitActivityTimeseriesAPIURL.dateRangeWithResource(
                    startDate:
                        DateTime.now().subtract(const Duration(days: 100)),
                    endDate: DateTime.now(),
                    userID: '7ML2XV',
                    resource: fitbitActivityTimeseriesDataManager.type,
                  )) as List<FitbitActivityTimeseriesData>;

                  // Use them as you want

                  print(stepsData);
                  for (var i = 0; i < stepsData.length - 1; i++) {
                    DateTime? data = stepsData.elementAt(i).dateOfMonitoring;
                    double? passi = stepsData.elementAt(i).value;

                    print(Steps(
                      data!,
                      passi!,
                    ).steps.toString());
                    print(Steps(data, passi).day.toString());
                    await Provider.of<DatabaseRepository>(context,
                            listen: false)
                        .insertSteps(Steps(data, passi));
                  }
                  List prova3 = await Provider.of<DatabaseRepository>(context,
                          listen: false)
                      .findAllStepss();
                  for (var i = 0; i < prova3.length; i++) {
                    //print(prova3.elementAt(i).dateofMonitoring.toString());
                    print(prova3.elementAt(i).steps.toString());
                    print('passi $prova3.elementAt(i).steps.toString()');
                  }
                }),

            /*  FitbitActivityTimeseriesDataManager
                      fitbitActivityTimeseriesDataManager =
                      FitbitActivityTimeseriesDataManager(
                    clientID: Strings.fitbitClientID,
                    clientSecret: Strings.fitbitClientSecret,
                    type: 'distance' 'steps' 'calories',
                  );

                  //Fetch data
                  final caloriesData =
                      await fitbitActivityTimeseriesDataManager.fetch(
                          FitbitActivityTimeseriesAPIURL.dateRangeWithResource(
                    startDate:
                        DateTime.now().subtract(const Duration(days: 100)),
                    endDate: DateTime.now(),
                    userID: '7ML2XV',
                    resource: fitbitActivityTimeseriesDataManager.type,
                  )) as List<FitbitActivityTimeseriesData>;
                  final stepsData = await fitbitActivityTimeseriesDataManager
                      .fetch(FitbitActivityTimeseriesAPIURL
                          .threeMonthsWithResource(
                    baseDate: DateTime.now(),
                    userID: '7ML2XV',
                    resource: fitbitActivityTimeseriesDataManager.type,
                  )) as List<FitbitActivityTimeseriesData>;
                  final distanceData = await fitbitActivityTimeseriesDataManager
                      .fetch(FitbitActivityTimeseriesAPIURL
                          .threeMonthsWithResource(
                    baseDate: DateTime.now(),
                    userID: '7ML2XV',
                    resource: fitbitActivityTimeseriesDataManager.type,
                  )) as List<FitbitActivityTimeseriesData>;
                  // Use them as you want
                  print(caloriesData);
                  print(stepsData);
                  print(distanceData);
                  for (var i = 0; i < caloriesData.length - 1; i++) {
                    DateTime? data = caloriesData.elementAt(i).dateOfMonitoring;
                    double? calorie = caloriesData.elementAt(i).value;
                    double? passi = stepsData.elementAt(i).value;
                    double? distanza = distanceData.elementAt(i).value;

                    print(Dati(data!, calorie!, passi!, distanza!)
                        .calories
                        .toString());
                    print(Dati(data, calorie, passi, distanza).day.toString());
                    print(
                        Dati(data, calorie, passi, distanza).steps.toString());
                    print(Dati(data, calorie, passi, distanza).day.toString());
                    print(Dati(data, calorie, passi, distanza)
                        .distance
                        .toString());
                    print(Dati(data, calorie, passi, distanza).day.toString());

                    await Provider.of<DatabaseRepository>(context,
                            listen: false)
                        .insertSteps(Dati(data, calorie, passi, distanza));

                    List prova = await Provider.of<DatabaseRepository>(context,
                            listen: false)
                        .findAllDatis();
                    for (var i = 0; i < prova.length; i++) {
                      //print(prova.elementAt(i).dateofMonitoring.toString());
                      print(prova.elementAt(i).calories.toString());

                      print('calorie $prova.elementAt(i).calories.toString()');
                    }
                  }
                },
                child: Text('Fetch calories data')),*/
          ],
        )));
  }
}
