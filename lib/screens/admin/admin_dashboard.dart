import 'package:flutter/material.dart';

class AdminDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Admin Dashboard',
          style: TextStyle(
              color: Colors.white, fontSize: 18),
        ),
        backgroundColor: Colors.deepPurple,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            AdminMenuItem(
              title: "จัดการหอพัก",
              icon: Icons.apartment,
              onTap: () {
                Navigator.pushNamed(context, '/manageDorms');
              },
            ),
            AdminMenuItem(
              title: "จัดการผู้ใช้",
              icon: Icons.people,
              onTap: () {
                Navigator.pushNamed(context, '/manageUsers');
              },
            ),
          ],
        ),
      ),
    );
  }
}

class AdminMenuItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  const AdminMenuItem(
      {required this.title, required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: ListTile(
        leading: Icon(icon, color: Colors.deepPurple),
        title: Text(title, style: TextStyle(fontWeight: FontWeight.bold,fontFamily: 'poppins')),
        trailing: Icon(
          Icons.arrow_forward_ios,
        ),
        onTap: onTap,
      ),
    );
  }
}
