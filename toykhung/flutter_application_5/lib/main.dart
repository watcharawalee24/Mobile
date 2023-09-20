import 'package:flutter/material.dart';
import 'package:intl/intl.dart';



void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Vat(),
    );
  }
}

class Vat extends StatefulWidget {
  const Vat({super.key});

  @override
  State<Vat> createState() => _VatState();
}

class _VatState extends State<Vat> {
  TextEditingController t = TextEditingController();
  double totalPrice = 0;
  double vat = 0;
  double netprice = 0;
  String status = 'โปรดระบุจำนวนเงิน';
  String status1 = '';
  String status2 = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "VAT 7%",
          style: TextStyle(
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TextField(
              controller: t,
              decoration: InputDecoration(
                hintText: 'Total price',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                print(value);
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              child: Icon(Icons.calculate),
              onPressed: () {
                setState(() {
                  totalPrice = double.tryParse(t.text) ?? 0;
                  vat = totalPrice * 0.07;
                  netprice = totalPrice - vat;
                  status = 'Total Price: ${NumberFormat('###,###.##').format(totalPrice)}';
                  status1 = 'VAT: ${NumberFormat('###,###.##').format(vat)}';
                  status2 = 'Net Price: ${NumberFormat('###,###.##').format(netprice)}';
                });
              },
            ),
            Text(
              "${status}",
              style: TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
                color: Colors.blueGrey,
              ),
            ),
            Text(
              "${status1}",
              style: TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
                color: Colors.blueGrey,
              ),
            ),
            Text(
              "${status2}",
              style: TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
                color: Colors.blueGrey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
