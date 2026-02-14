import 'package:flutter/material.dart';
import 'Database_helper.dart';
import 'user.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DatabaseHelper.instance.initDb();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BMI SQLite App',
      home: UserList(),
    );
  }
}

class UserList extends StatefulWidget {
  const UserList({super.key});

  @override
  State<UserList> createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  List<User> _users = [];

  @override
  void initState() {
    super.initState();
    _fetchUsers();
  }

  Future<void> _fetchUsers() async {
    final data = await DatabaseHelper.instance.queryAllUsers();
    setState(() {
      _users = data.map((e) => User.fromMap(e)).toList();
    });
  }

  Future<void> _deleteUser(int id) async {
    await DatabaseHelper.instance.deleteUser(id);
    _fetchUsers();
  }

  Future<void> _deleteAllUsers() async {
    await DatabaseHelper.instance.deleteAllUsers();
    _fetchUsers();
  }

  // ================= ADD USER =================
  void _addUser() {
    final username = TextEditingController();
    final email = TextEditingController();
    final pwd = TextEditingController();
    final weightCtrl = TextEditingController();
    final heightCtrl = TextEditingController();

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Add User'),
        content: SingleChildScrollView(
          child: Column(
            children: [
              TextField(controller: username, decoration: const InputDecoration(labelText: 'Username')),
              TextField(controller: email, decoration: const InputDecoration(labelText: 'Email')),
              TextField(controller: pwd, decoration: const InputDecoration(labelText: 'Password')),
              TextField(controller: weightCtrl, decoration: const InputDecoration(labelText: 'Weight (kg)')),
              TextField(controller: heightCtrl, decoration: const InputDecoration(labelText: 'Height (cm)')),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () async {
              final weight = double.parse(weightCtrl.text);
              final height = double.parse(heightCtrl.text);

              final bmi = User.calculateBMI(weight, height);
              final bmiType = User.determineBmiType(bmi);
              final targetWeight = User.calculateTargetWeight(
                height,
                bmi < 18.5 ? 18.5 : 24.9,
              );

              final user = User(
                username: username.text,
                email: email.text,
                pwd: pwd.text,
                weight: weight,
                height: height,
                bmi: bmi,
                bmiType: bmiType,
                targetWeight: targetWeight,
              );

              await DatabaseHelper.instance.insertUser(user);
              Navigator.pop(context);
              _fetchUsers();
            },
            child: const Text('Save'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
        ],
      ),
    );
  }

  // ================= EDIT USER =================
  void _editUser(User user) {
    final username = TextEditingController(text: user.username);
    final email = TextEditingController(text: user.email);
    final pwd = TextEditingController(text: user.pwd);
    final weightCtrl = TextEditingController(text: user.weight.toString());
    final heightCtrl = TextEditingController(text: user.height.toString());

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Edit User'),
        content: SingleChildScrollView(
          child: Column(
            children: [
              TextField(controller: username, decoration: const InputDecoration(labelText: 'Username')),
              TextField(controller: email, decoration: const InputDecoration(labelText: 'Email')),
              TextField(controller: pwd, decoration: const InputDecoration(labelText: 'Password')),
              TextField(controller: weightCtrl, decoration: const InputDecoration(labelText: 'Weight (kg)')),
              TextField(controller: heightCtrl, decoration: const InputDecoration(labelText: 'Height (cm)')),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () async {
              final weight = double.parse(weightCtrl.text);
              final height = double.parse(heightCtrl.text);

              final bmi = User.calculateBMI(weight, height);
              final bmiType = User.determineBmiType(bmi);
              final targetWeight = User.calculateTargetWeight(
                height,
                bmi < 18.5 ? 18.5 : 24.9,
              );

              final updatedUser = User(
                id: user.id,
                username: username.text,
                email: email.text,
                pwd: pwd.text,
                weight: weight,
                height: height,
                bmi: bmi,
                bmiType: bmiType,
                targetWeight: targetWeight,
              );

              await DatabaseHelper.instance.updateUser(updatedUser);
              Navigator.pop(context);
              _fetchUsers();
            },
            child: const Text('Update'),
          ),
        ],
      ),
    );
  }

  // ================= UI =================
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI User List'),
        backgroundColor: Colors.cyan,
        actions: [
          IconButton(
            icon: const Icon(Icons.delete_forever, color: Colors.red),
            onPressed: _deleteAllUsers,
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: _users.length,
        itemBuilder: (_, i) {
          final u = _users[i];

          final diffText =
            u.bmi < 18.5
                ? "Need to gain ${(u.targetWeight - u.weight).toStringAsFixed(2)} kg"
                : u.bmi > 24.9
                    ? "Need to lose ${(u.weight - u.targetWeight).toStringAsFixed(2)} kg"
                    : "Good Health.";


          final img =
            u.bmi < 18.5
                ? "assets/images/bmi-1.png"
                : u.bmi < 23
                    ? "assets/images/bmi-2.png"
                    : u.bmi < 25
                        ? "assets/images/bmi-3.png"
                        : u.bmi < 30
                            ? "assets/images/bmi-4.png"
                            : "assets/images/bmi-5.png";

          return Card(
            child: ListTile(
              leading: Image.asset(
                img,
                width: 50,
                errorBuilder: (_, __, ___) =>
                  const Icon(Icons.image_not_supported, size: 50),
              ),
              title: Text(u.username),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Weight: ${u.weight} kg"),
                  Text("Height: ${u.height} cm"),
                  Text("BMI: ${u.bmi.toStringAsFixed(2)} (${u.bmiType})"),
                  Text(diffText),
                    Text(
                    "Target weight (Normal BMI): ${u.targetWeight.toStringAsFixed(2)} kg",
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(Icons.edit, color: Colors.blue),
                    onPressed: () => _editUser(u),
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () => _deleteUser(u.id!),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addUser,
        child: const Icon(Icons.add),
      ),
    );
  }
}
