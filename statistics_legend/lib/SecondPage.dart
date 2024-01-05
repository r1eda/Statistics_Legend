import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
// import 'app_colors.dart';
import 'Func.dart';

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Data Analysis'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Chart',
                  style: TextStyle(
                      // color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'A histogram of data and its frequency',
                  style: TextStyle(
                      // color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
                // Text(
                //   'Chart',
                //   style: TextStyle(
                //       // color: Colors.black,
                //       fontSize: 15,
                //       fontWeight: FontWeight.bold),
                // ),
                LineChar1(
                  data: data,
                  f: f,
                ),
              ]),
        ),
      ),
    );
  }
}

//char 1
class LineChar1 extends StatefulWidget {
  final List<double> data;
  final List<double> f;

  const LineChar1({
    Key? key,
    required this.data,
    required this.f,
  }) : super(key: key);

  @override
  State<LineChar1> createState() => _LineChar1State();
}

class _LineChar1State extends State<LineChar1> {
  List<Color> gradientColors = [
    Colors.cyan,
    Colors.blue,
  ];

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.70,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 18,
          vertical: 24,
        ),
        child: LineChart(
          mainData(),
        ),
      ),
    );
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 16,
    );

    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: Text('${value.toInt()}', style: style),
    );
  }

  Widget leftTitleWidgets(double value, TitleMeta meta, List<double> f) {
    const style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 15,
    );

    String text;
    if (f.contains(value)) {
      text = '${value.toInt()}';
    } else {
      text = '${value.toInt()}';
    }

    return Text(text, style: style, textAlign: TextAlign.left);
  }

  LineChartData mainData() {
    return LineChartData(
      gridData: FlGridData(
        show: true,
        drawVerticalLine: true,
        horizontalInterval: 1,
        verticalInterval: 1,
        getDrawingHorizontalLine: (_) => const FlLine(
          color: Colors.grey,
          strokeWidth: 1,
        ),
        getDrawingVerticalLine: (_) => const FlLine(
          color: Colors.grey,
          strokeWidth: 1,
        ),
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            interval: 1,
            getTitlesWidget: bottomTitleWidgets,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            interval: 1,
            getTitlesWidget: (value, meta) =>
                leftTitleWidgets(value, meta, widget.f),
            reservedSize: 42,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: true,
        border: Border.all(color: Colors.black),
      ),
      minX: widget.data.reduce((min, value) => min > value ? value : min),
      maxX: widget.data.reduce((max, value) => max < value ? value : max),
      minY: widget.f.reduce((min, value) => min > value ? value : min),
      maxY: widget.f.reduce((max, value) => max < value ? value : max),
      lineBarsData: [
        LineChartBarData(
          spots: List.generate(
            widget.data.length,
            (index) => FlSpot(widget.data[index], widget.f[index]),
          ),
          isCurved: true,
          gradient: LinearGradient(
            colors: gradientColors,
          ),
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: const FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              colors: gradientColors
                  .map((color) => color.withOpacity(0.3))
                  .toList(),
            ),
          ),
        ),
      ],
    );
  }
}
