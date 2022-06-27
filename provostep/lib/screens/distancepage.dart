import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:intl/intl.dart';
import 'package:provostep/screens/homepage.dart';
import 'package:provostep/screens/passi.dart';
import 'package:provostep/screens/steppage.dart';
import 'package:provostep/screens/tabpage.dart';
import 'package:flutter/material.dart';
import 'package:provostep/screens/distancepage.dart';
import 'package:provostep/database/database.dart';
import 'package:provostep/repository/databaseRepository.dart';
import 'package:provider/provider.dart';
import 'package:provostep/database/daos/datadao.dart';
import 'package:provostep/database/entities/activity.dart';

class DistancePage extends StatelessWidget {
  DistancePage({Key? key}) : super(key: key);

  static const route = '/';
  static const routeDisplayName = 'Distancepage';

  final _tooltipBehavior = TooltipBehavior(enable: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('DistancePage')),
      body: Center(
        child: Consumer<DatabaseRepository>(builder: (context, dbr, child) {
          //The logic is to query the DB for the entire list of Meal using dbr.findAllMeals()
          //and then populate the ListView accordingly.
          //We need to use a FutureBuilder since the result of dbr.findAllMeals() is a Future.
          return FutureBuilder(
              initialData: null,
              future: dbr.findAllDistances(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final data = snapshot.data as List<Distance>;
                  /* final datadistance = snapshot.data as List<Distance>;*/

                  return SfCartesianChart(
                    title: ChartTitle(text: 'Distance'),
                    legend: Legend(isVisible: true),
                    tooltipBehavior: _tooltipBehavior,
                    series: <ChartSeries>[
                      LineSeries<DistanceData, double>(
                          name: 'Distance',
                          dataSource: data,
                          xValueMapper: (DistanceData distance, _) =>
                              distance.day,
                          yValueMapper: (DistanceData distance, _) =>
                              distance.distance,
                          dataLabelSettings: DataLabelSettings(isVisible: true),
                          enableTooltip: true)
                    ],
                    primaryXAxis: NumericAxis(
                      edgeLabelPlacement: EdgeLabelPlacement.shift,
                    ),
                    primaryYAxis: NumericAxis(
                        labelFormat: 'M',
                        numberFormat:
                            NumberFormat.simpleCurrency(decimalDigits: 0)),
                  );
                } else {
                  return CircularProgressIndicator();
                }
              });
        }),
      ),
    );
  }
}

List<DistanceData> findAllDistances() {
  final List<DistanceData> chartData = [];
  return chartData;
}

class DistanceData {
  DistanceData(this.day, this.distance);
  final double day;
  final double distance;
}
