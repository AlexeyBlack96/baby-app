import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as prefix1;
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/rendering.dart';
import 'package:insta_clone/src/models/baseAuth.dart';
import 'package:insta_clone/src/models/baby.dart';


class ChartTab extends StatefulWidget {
  @override
  final Baby baby;
  final String type;
  ChartTab({Key key, @required this.baby, this.type}) : super(key: key);
  _ChartTab createState() => _ChartTab();
}

class _ChartTab extends State<ChartTab> with SingleTickerProviderStateMixin {
  TabController _tabController;
  ScrollController _scrollController;
  
  List<charts.Series<TestChart, String>> _seriesPieDate = new List<charts.Series<TestChart, String>>();

  _generateionData(){
    var pieData=[
      new TestChart("test", 2, prefix1.Color(0xFF42A5F5)),
      new TestChart("test2", 0, prefix1.Color(0xFF990099)),
      new TestChart("test3", 5, prefix1.Color(0xFF109618)),
      new TestChart("test4", 7, prefix1.Color(0xFFfdbe19)),
      new TestChart("test5", 3, prefix1.Color(0xFFdc3812)),
    ];
    _seriesPieDate.add(
      charts.Series(
        data: pieData, 
        domainFn: (TestChart test, _)=> test.test,
        measureFn: (TestChart test, _)=> test.test2,
        colorFn: (TestChart test, _)=>
          charts.ColorUtil.fromDartColor(test.color),
        id: "Test",
        labelAccessorFn: (TestChart row, _)=>'${row.test}',
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _generateionData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
          child: charts.BarChart(
            _seriesPieDate,
            animate: true,
            animationDuration: Duration(seconds: 1),
            behaviors: [
              
            ],
            barGroupingType: charts.BarGroupingType.grouped,
          ),
        );
      
  }
}

  class TestChart{
    String test;
    int test2;
    prefix1.Color color;
    
    TestChart(this.test, this.test2, this.color);
  }
