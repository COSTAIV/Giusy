import 'package:provostep/screens/homepage.dart';
import 'package:flutter/material.dart';
import 'package:fitbitter/fitbitter.dart';

import 'package:provostep/utils/strings.dart';

class StepPage extends StatelessWidget {
  StepPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('StepPage'),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
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
                  .fetch(FitbitActivityTimeseriesAPIURL.monthWithResource(
                baseDate: DateTime.now(),
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
        ],
      )),
    );
  }
}
  

/*
 @override
 Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text('StepPage')),
      body: Center(
        child: Column(children: <Widget>[
        Container(
          margin: EdgeInsets.all(20),  
                  child: Table(  
                    defaultColumnWidth: FixedColumnWidth(120.0),  
                    border: TableBorder.all(  
                        color: Colors.grey,  
                        style: BorderStyle.solid,  
                        width: 2),
           children: [  
                      TableRow( children: [  
                        Column(children:[Text('Date: ', style: const TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold))]),  
                        Column(children:[Text('Step:', style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold))]),  
           ]),
      ],),)]
      ))
  );
 }
}
*/
 /* @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(title: Text('StepPage')),
          body: Center(
         child: ElevatedButton(
          child: Text('To HomePage'),
          onPressed: () {
            Navigator.pop(context,'step');
          }, 
      
      ),
      ),
    );
  }
}
*/