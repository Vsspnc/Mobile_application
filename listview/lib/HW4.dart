// import 'package:flutter/material.dart';
// import 'foodmenu.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
     
//         colorScheme: .fromSeed(seedColor: Colors.deepPurple),
//       ),
//       home: const MyHomePage(title: 'Flutter Demo Home Page'),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});
//   final String title;
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   List <Foodmenu> menu = [
//     Foodmenu("กุ้งเผา", "500 บาท"),
//     Foodmenu("กระเผาหมูสับ", "50 บาท")
//   ];
//   void addMenu() {
//     setState(() {
//       menu.add(
//         Foodmenu("เมนูที่ ${menu.length + 1}", "ราคา ${0} บาท"),
//       );
//     });
//   }
//    void removeMenu() {
//     if (menu.isNotEmpty) {
//       setState(() {
//         menu.removeLast();
//       });
//     }
//   }

//   List<Widget> getData (int count){
//     List <Widget> data = [];
//       data.add(Text("", ));
//       for (var i = 0; i <= count; i++) {
//         var menu = ListTile(title: Text("เมนูที่ $i",
//         style: TextStyle(fontSize: 25, color: Colors.blue),
//         ),
//         subtitle: Text("รายละเอียดเมนูที่ $i")
//         );
//         data.add(menu);
//       }
//       return data;
//   }
//   @override
//   Widget build(BuildContext context) {
   
//     return Scaffold(
//       appBar: AppBar(

//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,

//         title: Text(widget.title),
//       ),
//       body: ListView.builder(
//         itemCount: menu.length,
//         itemBuilder: (BuildContext context , int index) {
//           Foodmenu fm = menu[index];
//           return ListTile(
//             title: Text("เมนูที่ ${index + 1}",),
//             subtitle: Text("ชื่ออาหาร: ${fm.name} ราคา: ${fm.price}"),
//           );
//         },
//       ),
//        floatingActionButton: Column(
//         mainAxisAlignment: MainAxisAlignment.end,
//         children: [
//           FloatingActionButton(
//             onPressed: addMenu,
//             child: const Icon(Icons.add),
//             tooltip: "เพิ่มเมนู",
//           ),
//           const SizedBox(height: 10),
//           FloatingActionButton(
//             onPressed: removeMenu,
//             backgroundColor: Colors.red,
//             child: const Icon(Icons.remove),
//             tooltip: "ลบเมนู",
//           ),
//         ], 
//       ),
//     );
//   }
// }
