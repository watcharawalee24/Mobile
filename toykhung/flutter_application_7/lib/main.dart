import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_application_7/weatherToday';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: weather(),
    );
  }
}

class weather extends StatefulWidget {
  const weather({super.key});

  @override
  State<weather> createState() => _weatherState();
}

class _weatherState extends State<weather> {
  @override
  void initState() {
    super.initState();
    print('init');
    getData();
  }

  WeatherToday result = WeatherToday();
//สำคัญ!! lat,longข้างล่างนี้เป็นของพิกัดของแต่ละจังหวัด เป็นเปลี่ยน และ Bearer ส่วนของตรงนี้เพื่อนจะต้องเปลี่ยนเป็นของตัวเองเช่นกัน เอามาจากเว็บที่อ.ให้มา ต้องลงทะเบียนให้เรียร้อบ
  Future<void> getData() async {
    print("get data");
    double lat = 7.1875;
    double long = 100.5954;
    
    DateTime currentDate = DateTime.now();
    String date = currentDate.toIso8601String().split('T')[0];
    String fields = "tc_max, tc_min, rh, rain, ws10m, wd10m, cond";
    String apistr = "/nwpapi/v1/forecast/location/daily/at?";
    apistr += "lat=$lat&lon=$long&date=$date&fields=$fields";
    var url = Uri.https('data.tmd.go.th', apistr);
    var response = await http.get(url, headers: {
      HttpHeaders.acceptHeader: 'application/json',
      HttpHeaders.authorizationHeader:
          'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6IjA5YTEzZTZiNGZiMDc0NDk4NzQyNGUwYWFkOWNlYTA4YjJhNDUxZDE2NTgwOGI1MGJkYjAyOGJjZTJjMjA1Y2VhMWQ3ODZkNTUwMDRlYzE5In0.eyJhdWQiOiIyIiwianRpIjoiMDlhMTNlNmI0ZmIwNzQ0OTg3NDI0ZTBhYWQ5Y2VhMDhiMmE0NTFkMTY1ODA4YjUwYmRiMDI4YmNlMmMyMDVjZWExZDc4NmQ1NTAwNGVjMTkiLCJpYXQiOjE2OTE0MjM4ODUsIm5iZiI6MTY5MTQyMzg4NSwiZXhwIjoxNzIzMDQ2Mjg1LCJzdWIiOiIyNjcxIiwic2NvcGVzIjpbXX0.fyH_yfl2WwB9IvW_qDseOV0-ZFqY-xPVM__vX3tNx66bAFYeGzEyL9_w39UdQiSA4gN178U0U1rhR91KGbLsExrhBhu_smZKvzGQVSkolY-eJi0oQqnngZACU_nKEDwXySuGCxchCWcqTG9H3LfP8bJzqQhmO1gzk0-HYAqlfHbthl2SYcmvsX6qhN1mwz4VXF0ZVI7pzy2hqn8tvFdyflFXJ6l4MKilRC7txrgT2I6BqBNzmuNu26bZQLgMvQqQKPduiKXC8t1W3t4-hEqbCbAUEHqgm3Uib1etKrnwLhB7ToF8XSorTYz5-ymEhIm2qp3wfVEgXKIMm67DYYVma1Baj9VwB94AzeQ6tJWXc9ra3Vk5cDLP_l1R8pLjfS2Q4nXPhYjF140XRZa1f5OCwakudN_ubV9iJNiSQ6kgp-en7qFIYxGlP8gzGDTvXxXQc7XqVWxd8ub1XKM04NcV1Yknl8R1gd1lqkiCr1wd7PnFF33Sv8J76TNgN0MYAh5dFQa81aMubKadjiLUf3Ox7I52DlLyRk7LuzlBphUnbtPhVOA0FnAriXc_lbGxusP5e8xUCmFfrE62l0VfLdvOyUdY9oIUQ-84dtr7YcWNCqkPAa-qdss3rIQ7p7zxKDkT9UiDMHF_-eh7DtP63XR16yrjS_LsFLpj3YX9xgdKmeA'
    });

    setState(() {
      result = weatherTodayFromJson(response.body);
    });
    print(response.body);
  }

//ในส่วนของตรงนี้เป็น โค้ดที่ระบุสภาพอากาศในข้อสุดท้ายจะจัดเรียงเอาไปต้องตรงไหนก็ได้ไม่จำกัด แต่ว่างให้ถูกอย่าให้error
  Map<int, String> weatherConditions = {
    1: 'ท้องฟ้าแจ่มใส (Clear)',
    2: 'มีเมฆบางส่วน (Partly cloudy)',
    3: 'เมฆเป็นส่วนมาก (Cloudy)',
    4: 'มีเมฆมาก (Overcast)',
    5: 'ฝนตกเล็กน้อย (Light rain)',
    6: 'ฝนปานกลาง (Moderate rain)',
    7: 'ฝนตกหนัก (Heavy rain)',
    8: 'ฝนฟ้าคะนอง (Thunderstorm)',
    9: 'อากาศหนาวจัด (Very cold)',
    10: 'อากาศหนาว (Cold)',
    11: 'อากาศเย็น (Cool)',
    12: 'อากาศร้อนจัด (Very hot)',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('สภาพอากาศ',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.yellow),),
        backgroundColor: Colors.deepPurple,
      ),
      body: 
      ListView(
        children: [
          ListTile(
            subtitle: Image.network(
              'https://i.pinimg.com/564x/7b/80/8a/7b808a48fa2c1c0b1505b1a5430e6ea9.jpg',
            ),
          ),
          ListTile(
            title: const Text(
              'สงขลาาาาา',
              style: TextStyle(fontWeight: FontWeight.bold,color: Colors.purple),
            ),
            subtitle: Text(
                '${result.weatherForecasts?[0].location?.lat ?? "..."},${result.weatherForecasts?[0].location?.lon ?? "..."}',),
          ),
          ListTile(
            title: Text(
              'อุณหภูมิสูงสุด',
              style: TextStyle(fontWeight: FontWeight.bold,color: Colors.purple),
            ),
            subtitle: Text(
                '${result.weatherForecasts?[0].forecasts?[0].data?.tcMax ?? "..."}°C'),
          ),
          ListTile(
            title: Text(
              'อุณหภูมิต่ำสุด',
              style: TextStyle(fontWeight: FontWeight.bold,color: Colors.purple),
            ),
            subtitle: Text(
                '${result.weatherForecasts?[0].forecasts?[0].data?.tcMin ?? "..."}°C'),
          ),
          ListTile(
            title: Text(
              'ความชื้นสัมพัทธ์เฉลี่ย',
              style: TextStyle(fontWeight: FontWeight.bold,color: Colors.purple),
            ),
            subtitle: Text(
              '${result.weatherForecasts?[0].forecasts?[0].data?.rh ?? "..."}%',
            ),
          ),
          ListTile(
            title: Text(
              'ปริมาณฝนรวม 24 ชม.',
              style: TextStyle(fontWeight: FontWeight.bold,color: Colors.purple),
            ),
            subtitle: Text(
              '${result.weatherForecasts?[0].forecasts?[0].data?.rain ?? "..."} mm',
            ),
          ),
          ListTile(
            title: Text(
              'ความเร็วลมสูงสุด',
              style: TextStyle(fontWeight: FontWeight.bold,color: Colors.purple),
            ),
            subtitle: Text(
              '${result.weatherForecasts?[0].forecasts?[0].data?.ws10M ?? "..."} m/s',
            ),
          ),
          ListTile(
            title: Text(
              'สภาพอากาศโดยทั่วไป',
              style: TextStyle(fontWeight: FontWeight.bold,color: Colors.purple),
            ),
            subtitle: Text(
                '${weatherConditions[result.weatherForecasts?[0].forecasts?[0].data?.cond ?? 0] ?? "ไม่ทราบสภาพอากาศ"}'),
          ),
        ],
      ),
    );
  }
}
