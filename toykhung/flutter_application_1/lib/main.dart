import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: CounterArea(),
    );
  }
}

class CounterArea extends StatefulWidget {
  const CounterArea({super.key});

  @override
  State<CounterArea> createState() => _CounterAreaState();
}

class _CounterAreaState extends State<CounterArea> {
  TextEditingController h = TextEditingController();
  TextEditingController w = TextEditingController();
  int height = 0;
  int weight = 0;
  double bmi = 0;
  String status = 'ป้อนข้อมูล';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Simple BMI",
          style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blueGrey,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TextField(
              controller: h,
              decoration: InputDecoration(
                hintText: 'ความสูง(cm)',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                print(value);
              },
            ),
            TextField(
              controller: w,
              decoration: InputDecoration(
                hintText: 'นำ้หนัก(Kg)',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                print(value);
              },
            ),
            Text(
              "${status}",
              style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueGrey),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.calculate),
          backgroundColor: Colors.blueGrey,
          onPressed: () {
            print("Clicked");
             setState(() {
            height = int.tryParse(h.text) ?? 0;
            weight = int.tryParse(w.text) ?? 0;

            if (height != 0 && weight != 0) {
               bmi = weight / ((height / 100) * (height / 100));

              if (bmi <= 18.5) {
                status = 'ขี้ก้าง';
              } else if (bmi <= 24.9) {
                status = 'หุ่นดี';
              } else if (bmi <= 29.9) {
                status = 'อวบอั๋น';
              } else {
                status = 'หุ่นหมี';
              }
            } else {
              status = 'ข้อมูลต้องเป็นตัวเลข';
            }
            });

            // child: Icon(Icons.add,color: Colors.greenAccent),
          }),
    );
  }
}
