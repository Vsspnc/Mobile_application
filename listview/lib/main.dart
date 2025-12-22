import 'package:flutter/material.dart';
import 'foodmenu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 214, 131, 6)),
      ),
      home: const MyHomePage(title: 'Food Menu List'),
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
  List <Foodmenu> menu = [
    Foodmenu("กระเพราหมูสับ",50,"assets/images/m1.jpg","อาหารจานเดียว"),
    Foodmenu("ผัดไทกุ้งสุก", 50,"assets/images/m2.jpg","อาหารจานเดียว"),
    Foodmenu("ซูชิ", 60,"assets/images/m3.jpg","อาหารญี่ปุ่น"),
    Foodmenu("บาร์บีคิว", 70,"assets/images/m4.jpg","ย่าง"),
    Foodmenu("ซาลาเปา", 40,"assets/images/m5.jpg","นึ่ง"),
    Foodmenu("กุ้งเผา", 250,"assets/images/m6.jpg","ย่าง"),
    Foodmenu("ต้มมะระ", 50,"assets/images/m7.jpg","ต้ม"),
    Foodmenu("ปลาทอดกรอบ", 90,"assets/images/m8.jpg","ทอด"),
    Foodmenu("แหนมเนือง", 155,"assets/images/m9.jpg","ทอด"),
    Foodmenu("แฮมเบอร์เกอร์", 130,"assets/images/m10.jpg","Fast Food"),
    Foodmenu("ผัดพริกแกง", 60,"assets/images/m11.jpg","ผัด"),
    Foodmenu("ผัดคะน้า", 50,"assets/images/m12.jpg","ผัด"),
    Foodmenu("ผัดกะหล่ำปลีหมูกรอบ", 70,"assets/images/m13.jpg","ผัด"),
    Foodmenu("ผัดผงกะหรี่", 80,"assets/images/m14.jpg","ผัด"),
    Foodmenu("ปลาทอดผัดขึ้นช่าย", 75,"assets/images/m15.jpg","ทอด"),
    Foodmenu("ผัดขี้เมา", 65,"assets/images/m16.jpg","ผัด"),
    Foodmenu("ไข่เจียว", 30,"assets/images/m17.jpg","ทอด"),
    Foodmenu("สุกี้", 35,"assets/images/m18.jpg","ต้ม"),
    Foodmenu("ยำ", 25,"assets/images/m19.jpg","ยำ"),
    Foodmenu("ข้าวต้มกุ้ง", 60,"assets/images/m20.jpg","ต้ม"),
  ];
  List<Widget> getData (int count){
    List <Widget> data = [];
      data.add(Text("", ));
      for (var i = 0; i <= count; i++) {
        var menu = ListTile(title: Text("เมนูที่ $i",
        style: TextStyle(fontSize: 25, color: const Color.fromARGB(255, 250, 103, 6)),
        ),
        subtitle: Text("รายละเอียดเมนูที่ $i")
        );
        data.add(menu);
      }
      return data;
  }
  int _counter = 0;
  int _sumprice = 0;
  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: AppBar(

        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text(widget.title),
      ),
      body: ListView.builder(
        itemCount: menu.length,
        itemBuilder: (BuildContext context , int index) {
          Foodmenu fm = menu[index];
          return ListTile(
            leading: Image.asset(fm.img, width: 50, height: 50, fit: BoxFit.cover,),
            title: Text("เมนูที่ ${index + 1}  " + fm.name , style: TextStyle(fontSize: 30, color: const Color.fromARGB(255, 218, 143, 4))),
            subtitle: Text("ราคา: ${fm.price}" + " ประเภท: ${fm.type}", style: TextStyle(fontSize: 20, color: const Color.fromARGB(255, 53, 35, 14))),
            onTap: (){
              setState(() {
                _counter++;
                _sumprice += fm.price;
                
              });

              showDialog(context: context, 
              builder: (context) => AlertDialog(
                title: Text(
                  "คุณเลือกเมนู คือ ${fm.name}"
                  +"\nเลือกไปแล้ว $_counter จาน" +
                "\nราคาทั้งหมด: ${_sumprice} บาท"),
              ));
            },
          );
        },
      ),
    );
  }
}
