import 'package:flutter/material.dart';
import 'package:flutter_application_3/covid_today_result.dart';
import 'package:http/http.dart'as http;
import 'covid_today_result.dart';
void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: CovidToday()
    );
  }
}

class CovidToday extends StatefulWidget {
  const CovidToday({super.key});

  @override
  State<CovidToday> createState() => _CovidTodayState();
}

class _CovidTodayState extends State<CovidToday> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('init state');
    getData();
  }
  CovidTodayResult result = CovidTodayResult();
  Future<void>getData() async{
    print('get data');
    var url =Uri.https("covid19.th-stat.com","/api/open/today");
    var response = await http.get(url);

    setState(() {
      result = covidTodayResultFromJson(response.body);
    });
    print(response.body);
    return;
  }




  
  @override
  Widget build(BuildContext context) {
    print('build state');
    return Scaffold(appBar: AppBar
    (title: Text('CovidToday',style: TextStyle(fontSize: 25.00,fontWeight: FontWeight.bold,color: Colors.white),),
          backgroundColor: Colors.green,
    
    ),
        body: ListView(
          children:[
            ListTile(
              title: Text("กำลังรักษาตัว",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18.00),),
              subtitle: Text("${result.hospitalized}",style: TextStyle(color: Colors.blue),),
            ),
            ListTile(
              title: Text("ผู้ป่วยหายแล้ว",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18.00),),
              subtitle: Text("${result.recovered}",style: TextStyle(color: Colors.green),),
            ),
            ListTile(
              title: Text("ผู้เสียชีวิต",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18.00),),
              subtitle: Text("${result.deaths}",style: TextStyle(color: Colors.red),),
            ),
            ListTile(
              title: Text("ผู้ป่วยสะสม",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18.00),),
              subtitle: Text("${result.confirmed}",style: TextStyle(color: Colors.deepPurpleAccent),),
            ),
          ]
        ),
      );
  }
}
