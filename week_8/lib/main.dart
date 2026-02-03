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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'List Example'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class Data {
  int id;
  String name;
  DateTime t;

  Data(this.id, this.name, this.t);
}

class _MyHomePageState extends State<MyHomePage> {
  String txt = "N/A";
  int img = 0;

  List<Data> mylist = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Radio<int>(
                  value: 1,
                  groupValue: img,
                  onChanged: (value) {
                    setState(() {
                      img = value!;
                    });
                  },
                ),
                const CircleAvatar(
                  radius: 20,
                  backgroundImage:
                      AssetImage('assets/images/Feb 1, 2026 at 8_41 PM.png'),
                )
              ],
            ),

            const Padding(
              padding: EdgeInsets.all(8.0),
              child: TextField(),
            ),

            ElevatedButton(
              onPressed: () {
                setState(() {
                  txt = "Add item Success";
                  mylist.add(Data(img, 'Item ${mylist.length + 1}', DateTime.now()));
                });
              },
              child: const Text("Add Item"),
            ),

            Text(
              txt,
              textScaleFactor: 2,
            ),

            SizedBox(
              width: double.infinity,
              height: 550,
              child: ListView.builder(
                itemCount: mylist.length,
                itemBuilder: (context, index) {
                  return SizedBox(
                    height: 80,
                    child: Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      color: Colors.primaries[
                          index % Colors.primaries.length],
                      child: ListTile(
                        leading: const CircleAvatar(
                          radius: 30,
                          backgroundImage: AssetImage(
                              'assets/images/Feb 1, 2026 at 8_41 PM.png'),
                        ),
                        title: Text("Title Text ${mylist[index].id}"
                        ),
                        subtitle: Text(
                          mylist[index].t.toString()
                        ),
                        trailing: const Icon(Icons.delete_rounded),
                        onTap: () {
                          setState(() {
                            txt = "Title Text ($index) is removed";
                            mylist.removeAt(index);
                          });
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
