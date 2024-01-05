//اخر اصدار
import 'package:flutter/material.dart';
import 'SecondPage.dart';
import 'Pub.dart';
import 'Func.dart';
// import 'FuncEdit.dart';
// import 'package:shared_preferences/shared_preferences.dart';

SizedBox sizef() {
  return SizedBox(height: 15, width: 5);
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Analysis Statistics',
      // theme: ThemeData(
      //   primarySwatch: Colors.blue,
      // ),
      theme: ThemeData.light(), // استخدام الثيم الأبيض
      darkTheme: ThemeData.dark(), // استخدام الثيم الأسود
      // theme: ThemeData.light().copyWith(
      //   // تعديل ألوان النصوص
      //   textTheme: TextTheme(
      //     headline1: TextStyle(color: Colors.black), // للعنوان
      //     bodyText1: TextStyle(color: Colors.black), // لنصوص الجسم
      //     // قم بتعيين ألوان أخرى حسب الحاجة
      //   ),
      //   // تعديل ألوان الأزرار
      //   buttonTheme: ButtonThemeData(
      //     textTheme: ButtonTextTheme.primary,
      //     buttonColor: Colors.blue, // لون الزر
      //   ),
      // ),
      // darkTheme: ThemeData.dark().copyWith(
      //   // تعديل ألوان النصوص في وضع الظلام
      //   textTheme: TextTheme(
      //     headline1: TextStyle(color: Colors.white),
      //     bodyText1: TextStyle(color: Colors.white),
      //   ),
      //   // تعديل ألوان الأزرار في وضع الظلام
      //   buttonTheme: ButtonThemeData(
      //     textTheme: ButtonTextTheme.primary,
      //     buttonColor: Colors.indigo,
      //   ),
      // ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController dataController = TextEditingController();
  TextEditingController fController = TextEditingController();
  void addData() {
    String inputValue = dataController.text;
    if (inputValue.isNotEmpty) {
      double value = double.parse(inputValue);
      setState(() {
        data.add(value);
        dataController.clear();
      });
    }
  }

  void addDataF() {
    String inputValue = fController.text;

    // قبل إضافة القيمة، تحقق إذا كانت القيمة غير فارغة وإلا قم بتعيين قيمة افتراضية (1.0)
    double value = inputValue.isNotEmpty ? double.parse(inputValue) : 1.0;

    setState(() {
      f.add(value);
      fController.clear();
    });
  }

  void setData() {
    addData();
    addDataF();
  }

  void setDataof0() {
    data.clear();
    f.clear();
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    double mean = data.isNotEmpty ? calculateMean(data, f) : 0.0;

    // حساب الوسيط (Median)
    double median = data.isNotEmpty ? calculateMedian(data, f) : 0.0;

    // حساب المتوسط الهندسي (Geometric Mean)
    double geometricMean =
        data.isNotEmpty ? calculateGeometricMean(data, f) : 0.0;

    // حساب الانحراف المعياري (Standard Deviation)
    double standardDeviation =
        data.isNotEmpty ? calculateStandardDeviation(data, f) : 0.0;

    // حساب المتوسط التناسبي (Harmonic Mean)
    double harmonicMean =
        data.isNotEmpty ? calculateHarmonicMean(data, f) : 0.0;

    // حساب الانحراف المتوسط (Mean Deviation)
    double meanDeviation =
        data.isNotEmpty ? calculateMeanDeviation(data, f) : 0.0;

    return Scaffold(
      // backgroundColor: Color.fromARGB(205, 251, 255, 0),
      appBar: AppBar(
        // backgroundColor: Color.fromARGB(157, 255, 221, 0),
        title: Text('Analysis Statistics'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                controller: dataController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Enter value X :'),
              ),
              TextField(
                controller: fController,
                keyboardType: TextInputType.number,
                decoration:
                    InputDecoration(labelText: 'Enter value frequency :'),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: setData,
                child: Text('Add values'),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: setDataof0,
                child: Text('Delete values'),
              ),
              SizedBox(height: 20),
              Text(
                'Select result values : ',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Pub(
                          a: "Mean",
                          b: "The resulting :",
                          c: "$mean",
                          d: "Close",
                        ),
                        sizef(),
                        Pub(
                          a: "Median",
                          b: "The resulting :",
                          c: "$median",
                          d: "Close",
                        ),
                        sizef(),
                      ],
                    ),
                    sizef(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Pub(
                          a: "Geometric Mean",
                          b: "The resulting :",
                          c: "$geometricMean",
                          d: "Close",
                        ),
                        sizef(),
                        Pub(
                          a: "Standard Deviation",
                          b: "The resulting :",
                          c: "$standardDeviation",
                          d: "Close",
                        ),

                        // Pub(
                        //   a: "A",
                        //   b: "B",
                        //   c: "C",
                        //   d: "D",
                        // ),
                      ],
                    ),
                    sizef(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Pub(
                          a: "Harmonic Mean",
                          b: "The resulting :",
                          c: "$harmonicMean",
                          d: "Close",
                        ),
                        sizef(),
                        Pub(
                          a: "Mean Deviation",
                          b: "The resulting :",
                          c: "$meanDeviation",
                          d: "Close",
                        ),
                      ],
                    ),
                    sizef(),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              // افتح صفحة جديدة عند النقر على الزر
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SecondPage()),
                              );
                            },
                            child: Text('Chart'),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              DataTable(
                  columns: [
                    DataColumn(label: Text('No.')),
                    DataColumn(label: Text('X')),
                    DataColumn(label: Text('F')),
                  ],
                  rows: List.generate(
                    data.length,
                    (index) => DataRow(
                      cells: [
                        DataCell(Text((index + 1).toString())),
                        DataCell(Text(data[index].toString())),
                        DataCell(Text(f[index].toString())),
                        // DataCell(Text((f.isEmpty ? 1.0 : f[index]).toString())),
                      ],
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
