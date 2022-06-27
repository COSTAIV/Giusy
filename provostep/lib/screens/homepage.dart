import 'package:fitbitter/fitbitter.dart';
import 'package:flutter/material.dart';
import 'package:provostep/utils/strings.dart';

import 'package:provostep/screens/steppage.dart';
import 'package:provostep/screens/tabpage.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Homepage'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async {
                // Authorize the app
                String? userId = await FitbitConnector.authorize(
                    context: context,
                    clientID: Strings.fitbitClientID,
                    clientSecret: Strings.fitbitClientSecret,
                    redirectUri: 'example://fitbit/auth',
                    callbackUrlScheme: 'example');
              },
              child: Text('Authorize'),
            ),
            ElevatedButton(
              onPressed: () async {
                //Instantiate a proper data manager
                FitbitActivityTimeseriesDataManager
                    fitbitActivityTimeseriesDataManager =
                    FitbitActivityTimeseriesDataManager(
                  clientID: Strings.fitbitClientID,
                  clientSecret: Strings.fitbitClientSecret,
                  type: 'steps',
                );
                //Fetch data
                final stepsData = await fitbitActivityTimeseriesDataManager
                    .fetch(FitbitActivityTimeseriesAPIURL.dayWithResource(
                  date: DateTime.now().subtract(Duration(days: 1)),
                  userID: '7ML2XV',
                  resource: fitbitActivityTimeseriesDataManager.type,
                )) as List<FitbitActivityTimeseriesData>;
                // Use them as you want
                final snackBar = SnackBar(
                    content: Text(
                        'Yesterday you walked ${stepsData[0].value} steps!'));
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                print(stepsData);
              },
              child: Text('Fetch step data'),
            ),
            /*
              ElevatedButton(
              onPressed: () async {
                //Instantiate a proper data manager
                FitbitActivityTimeseriesDataManager
                    fitbitActivityTimeseriesDataManager =
                    FitbitActivityTimeseriesDataManager(
                  clientID: Strings.fitbitClientID,
                  clientSecret: Strings.fitbitClientSecret,
                  type: 'distance',
                );
              //Fetch data
                final distanceData = await fitbitActivityTimeseriesDataManager
                    .fetch(FitbitActivityTimeseriesAPIURL.dayWithResource(
                  date: DateTime.now().subtract(Duration(days: 1)),
                  userID: '7ML2XV',
                  resource: fitbitActivityTimeseriesDataManager.type,
                )) as List<FitbitActivityTimeseriesData>;
               // Use them as you want
                final snackBar = SnackBar(
                    content: Text(
                        'Yesterday you walked ${distanceData[0].value} Km!'));
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                print(distanceData);
              },
              child: Text('Fetch distance data'),
            ),
            ElevatedButton(
              onPressed: () async {
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
                    .fetch(FitbitActivityTimeseriesAPIURL.dayWithResource(
                  date: DateTime.now().subtract(Duration(days: 1)),
                  userID: '7ML2XV',
                  resource: fitbitActivityTimeseriesDataManager.type,
                )) as List<FitbitActivityTimeseriesData>;
               // Use them as you want
                final snackBar = SnackBar(
                    content: Text(
                        'Yesterday you burn ${caloriesData[0].value} calories!'));
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                print(caloriesData);
              },
              child: Text('Fetch calories data'),
            ),
            ElevatedButton(
              onPressed: () async {
                //Instantiate a proper data manager
                FitbitActivityTimeseriesDataManager
                    fitbitActivityTimeseriesDataManager =
                    FitbitActivityTimeseriesDataManager(
                  clientID: Strings.fitbitClientID,
                  clientSecret: Strings.fitbitClientSecret,
                  type: 'steps',
                );
              //Fetch data
                final stepsData = await fitbitActivityTimeseriesDataManager
                    .fetch(FitbitActivityTimeseriesAPIURL.weekWithResource(
                  baseDate: DateTime.now(),
                  userID: '7ML2XV',
                  resource: fitbitActivityTimeseriesDataManager.type,
                )) as List<FitbitActivityTimeseriesData>;
               // Use them as you want
                final snackBar = SnackBar(
                    content: Text(
                        'This week you made ${stepsData[0].value} steps!'));
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                print(stepsData);
              },
              child: Text('Fetch step week data'),
            ),
            ElevatedButton(
              onPressed: () async {
                //Instantiate a proper data manager
                FitbitSleepDataManager
                    fitbitActivityDataManager =
                    FitbitSleepDataManager(
                  clientID: Strings.fitbitClientID,
                  clientSecret: Strings.fitbitClientSecret,
                  
                    );
              //Fetch data
                final sleepData = await fitbitActivityDataManager.fetch(
                  FitbitSleepAPIURL.withUserIDAndDay(
                  date: DateTime.now().subtract(Duration(days:2)),
                  userID: '7ML2XV',
                )) as List<FitbitSleepDataManager>;
                print(sleepData);
              },
              child: Text('Fetch sleep data'),
            ),
            //Instantiate a proper data manager
                    
             ElevatedButton(
              onPressed: () async {
                //Instantiate a proper data manager
                FitbitActivityTimeseriesDataManager
                    fitbitActivityTimeseriesDataManager =
                    FitbitActivityTimeseriesDataManager(
                  clientID: Strings.fitbitClientID,
                  clientSecret: Strings.fitbitClientSecret,
                  type: 'steps',
                );
              //Fetch data
                final stepsData = await fitbitActivityTimeseriesDataManager
                    .fetch(FitbitActivityTimeseriesAPIURL.threeMonthsWithResource( 
                  baseDate: DateTime.now(),
                  userID: '7ML2XV',
                  resource: fitbitActivityTimeseriesDataManager.type,
                )) as List<FitbitActivityTimeseriesData>;
               // Use them as you want
                final snackBar = SnackBar(
                    content: Text(
                        'This month you made ${stepsData[0].value} steps!'));
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                print(stepsData);
              },
              child: Text('Fetch step monthly data'),
            ),
              */

            ElevatedButton(
                child: Text('To StepPage'),
                onPressed: () async {
                  Navigator.pushNamed(context, 'step');
                }),
            ElevatedButton(
              child: Text('To Fetch'),
              onPressed: () async {
                Navigator.pushNamed(context, 'tab');

                /*  FitbitActivityTimeseriesDataManager
                    fitbitActivityTimeseriesDataManager =
                    FitbitActivityTimeseriesDataManager(
                  clientID: Strings.fitbitClientID,
                  clientSecret: Strings.fitbitClientSecret,
                  type: 'steps',
                );
                  //Fetch data
                final stepsData = await fitbitActivityTimeseriesDataManager
                    .fetch(FitbitActivityTimeseriesAPIURL.dayWithResource(
                  date: DateTime.now().subtract(Duration(days: 1)),
                  userID: '7ML2XV',
                  resource: fitbitActivityTimeseriesDataManager.type,
                )) as List<FitbitActivityTimeseriesData>;
               // Use them as you want
                final snackBar = SnackBar(
                    content: Text(
                        'Yesterday you walked ${stepsData[0].value} steps!'));
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                print(stepsData); */
              },
            ),
            ElevatedButton(
              onPressed: () async {
                await FitbitConnector.unauthorize(
                  clientID: Strings.fitbitClientID,
                  clientSecret: Strings.fitbitClientSecret,
                );
              },
              child: Text('Unauthorize'),
            ),
          ],
        ),
      ),
    );
  } //build

} //HomePage



/*
            ElevatedButton(
              onPressed: () async{
              FitbitActivityTimeseriesDataManager
        fitbitActivityTimeseriesDataManager =
        FitbitActivityTimeseriesDataManager(
            clientID: '238BNY',
            clientSecret: 'dd7247d592606afdfd2c3b08191b3076',
            type: 'steps', 
        );
        final stepsData= await fitbitActivityTimeseriesDataManager.fetch(
          FitbitActivityTimeseriesAPIURL.dayWithResource(
            date: DateTime.now().subtract(Duration(days:0)),
            userID: '238BNY',
            resource: fitbitActivityTimeseriesDataManager.type,
          )
          ) as List<FitbitActivityTimeseriesData>;
          print(stepsData);          
  },
  child: Text('Fetch data')),*/

  