import 'package:flutter/material.dart';

class ManageUsersScreen extends StatefulWidget {
  @override
  _ManageUsersScreenState createState() => _ManageUsersScreenState();
}

class _ManageUsersScreenState extends State<ManageUsersScreen> {
  List<Map<String, String>> users = [
    {"name": "ผู้ใช้ 1", "email": "user1@example.com"},
    {"name": "ผู้ใช้ 2", "email": "user2@example.com"},
    {"name": "ผู้ใช้ 3", "email": "user3@example.com"},
  ];

  void _editUser(int index) {
    TextEditingController nameController =
        TextEditingController(text: users[index]["name"]);
    TextEditingController emailController =
        TextEditingController(text: users[index]["email"]);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("แก้ไขข้อมูลผู้ใช้"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: InputDecoration(labelText: "ชื่อผู้ใช้"),
              ),
              TextField(
                controller: emailController,
                decoration: InputDecoration(labelText: "อีเมล"),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text("ยกเลิก"),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  users[index]["name"] = nameController.text;
                  users[index]["email"] = emailController.text;
                });
                Navigator.pop(context);
              },
              child: Text("บันทึก"),
            ),
          ],
        );
      },
    );
  }

  void _deleteUser(int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("ยืนยันการลบ"),
          content:
              Text("คุณแน่ใจหรือไม่ว่าต้องการลบ ${users[index]["name"]} ?"),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text("ยกเลิก"),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  users.removeAt(index);
                });
                Navigator.pop(context);
              },
              child: Text("ลบ", style: TextStyle(color: Colors.white)),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'จัดการผู้ใช้',
          style: TextStyle(
              color: Colors.white, fontSize: 18, fontFamily: 'poppins'),
        ),
        backgroundColor: Colors.deepPurple,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: users.isEmpty
          ? Center(
              child: Text(
                "ไม่มีผู้ใช้",
                style: TextStyle(color: Colors.grey, fontSize: 18),
              ),
            )
          : ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: ListTile(
                   
                    title: Text(users[index]["name"]!),
                    subtitle: Text(users[index]["email"]!),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: Icon(Icons.edit, color: const Color.fromARGB(255, 63, 63, 63)),
                          onPressed: () => _editUser(index),
                        ),
                        IconButton(
                          icon: Icon(Icons.delete, color: const Color.fromARGB(255, 63, 63, 63)),
                          onPressed: () => _deleteUser(index),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
