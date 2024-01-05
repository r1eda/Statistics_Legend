import 'package:flutter/material.dart';

class Pub extends StatelessWidget {
  String? a, b, c, d;
  Pub({String? a, String? b, String? c, String? d}) {
    this.a = a!;
    this.b = b!;
    this.c = c!;
    this.d = d!;
  }
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ElevatedButton(
        onPressed: () {
          // عند الضغط على الزر، سيتم فتح نافذة منبثقة
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('$b'),
                content: Text('$c'),
                actions: [
                  ElevatedButton(
                    onPressed: () {
                      // عند الضغط على زر الإغلاق، يتم إغلاق النافذة
                      Navigator.of(context).pop();
                    },
                    child: Text('$d'),
                  ),
                ],
              );
            },
          );
        },
        child: Text('$a'),
      ),
    );
  }
}
