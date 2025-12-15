import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
     
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  List<Widget> getData (int count){
    List <Widget> data = [];
     data.add(Text(
      'กดปุ่ม เพิ่มค่า ตัวเลข ',style: TextStyle(fontSize: 20, color: Colors.red),
      )
      );
      data.add(Text(
        _counter.toString(),
        style: TextStyle(fontSize: 30, color: Colors.red),
      ));
      for (var i = 0; i <= count; i++) {
        var menu = ListTile(title: Text("เมนูที่ $i",
        style: TextStyle(fontSize: 25, color: Colors.blue),
        ),
        subtitle: Text("รายละเอียดเมนูที่ $i")
        );
        data.add(menu);
      }
      return data;
  }
  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: AppBar(

        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text(widget.title),
      ),
      body: ListView.builder(
        itemCount: 20,
        itemBuilder: (BuildContext context , int index) {
          return ListTile(
            title: Text("เมนูที่ ${index + 1}",),
          );
        },
      ),
    );
  }
}
