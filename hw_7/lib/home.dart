import 'package:flutter/material.dart';
import 'rec.dart';
import 'tri.dart';
import 'cir.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0; 

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Geometry Calculator'),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(28),
          child: Text(
            _selectedIndex == 0
                ? 'คำนวณพื้นที่รูปทรงเรขาคณิต'
                : 'คำนวณปริมาตรรูปทรงเรขาคณิต',
            style: TextStyle(
              color: Colors.grey.shade600,
              fontSize: 13,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _buildMenuCard(
              title: 'สี่เหลี่ยม',
              subtitle: _selectedIndex == 0
                  ? 'พื้นที่ = กว้าง × สูง'
                  : 'ปริมาตรทรงสี่เหลี่ยม',
              icon: Icons.crop_square,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) =>
                      RectanglePage(isArea: _selectedIndex == 0),
                ),
              ),
            ),
            _buildMenuCard(
              title: 'สามเหลี่ยม',
              subtitle: _selectedIndex == 0
                  ? 'พื้นที่ = ½ × ฐาน × สูง'
                  : 'ปริมาตรพีระมิด',
              icon: Icons.change_history,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) =>
                      TrianglePage(isArea: _selectedIndex == 0),
                ),
              ),
            ),
            _buildMenuCard(
              title: 'วงกลม',
              subtitle: _selectedIndex == 0
                  ? 'พื้นที่ = πr²'
                  : 'ปริมาตรทรงกลม',
              icon: Icons.circle_outlined,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) =>
                      CirclePage(isArea: _selectedIndex == 0),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.indigo,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.square_foot),
            label: 'Area',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.view_in_ar),
            label: 'Volume',
          ),
        ],
      ),
    );
  }

  Widget _buildMenuCard({
    required String title,
    required String subtitle,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        gradient: LinearGradient(
          colors: [
            Colors.indigo.shade50,
            Colors.indigo.shade100,
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.indigo.withOpacity(0.15),
            blurRadius: 10,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: ListTile(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        leading: CircleAvatar(
          radius: 26,
          backgroundColor: Colors.indigo,
          child: Icon(icon, color: Colors.white, size: 28),
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: onTap,
      ),
    );
  }
}
