import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: Myhome());
  }
}

class Myhome extends StatefulWidget {
  const Myhome({super.key});

  @override
  State<Myhome> createState() => _MyhomeState();
}

class _MyhomeState extends State<Myhome> {
  @override
  Widget build(BuildContext context) {
    List<Contact> contractList = [
      Contact("Watcharawalee", "099-193-4113", "https://i.pinimg.com/564x/43/b1/c9/43b1c9f45a233d3af8dc222324048793.jpg",''),
      Contact('Pattaraporn', '089-733-4290', 'https://i.pinimg.com/736x/b8/df/42/b8df423d6de55fe4309715a097b12502.jpg',''),
      Contact('Arissara', '099-998-8015', 'https://i.pinimg.com/736x/e4/85/f0/e485f0d8ac29d199289ca6a6534b34c8.jpg',''),
    ];
    return Scaffold(
        appBar: AppBar(
          title: Text('Contec List',style: TextStyle(fontSize: 20.00,fontWeight: FontWeight.bold,color: Colors.black),),
          backgroundColor: Colors.orangeAccent,
        ),
        body: ListView.builder(
            itemCount: contractList.length,
            itemBuilder: (context, index) {
              Contact item = contractList[index];
              return ListTile(
                title: Text(item.name),
                subtitle: Text(item.phonnumber),
                leading: Image.network(item.lIcon),
                trailing: Text(item.tIcon),
              );
            }));
  }
}

class Contact {
  String name = '';
  String phonnumber = '';
  String lIcon = '';
  String tIcon = '';
  Contact(this.name, this.phonnumber, this.lIcon, this.tIcon);
}
