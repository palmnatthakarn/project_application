import 'package:flutter/material.dart';
import 'package:project_application/components/rounded_button.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProfileScreen(),
    );
  }
}

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Profile",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          IconButton(
            icon: Image.asset('assets/icons/chat.png',
                width: 24, // กำหนดขนาดรูป
                height: 24,
                color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Avatar Profile
              Stack(
                clipBehavior: Clip.none,
                children: [
                  CircleAvatar(
                    radius: 60,
                    backgroundColor: Colors.grey[300],
                    backgroundImage: AssetImage("assets/profile.jpg"),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: GestureDetector(
                      onTap: () => {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => EditProfileScreen()))
                      },
                      child: Container(
                        width: 35,
                        height: 35,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white, // พื้นหลังสีขาว
                          border: Border.all(
                              color: Colors.grey, width: 1), // ขอบสีเทา
                        ),
                        child: Icon(
                          Icons.edit,
                          size: 18,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),

              // Name & ID
              Text(
                "Charlotte King",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(
                "@johnkinggraphics",
                style: TextStyle(color: Colors.grey),
              ),
              SizedBox(height: 10),

              // Edit Profile Button
              SizedBox(height: 60),
              // Dorm Name Input
              Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: Container(
                    height: 50,
                    width: 300,
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      "chat",
                      style: TextStyle(fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 40),

              // Add Dorm Button
            ],
          ),
        ),
      ),
    );
  }
}
//--------------------------------------------------------

class EditProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.black, // สีพื้นหลังเข้ม
      appBar: AppBar(
        title: Text("แก้ไขโปรไฟล์", style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(10),
        children: [
          _buildMenuItem(
            title: "แก้ไขข้อมูลส่วนตัว",
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => EditProfilePage()),
            ),
          ),
          _buildMenuItem(
            title: "เปลี่ยนรหัสผ่าน",
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ChangePasswordScreen()),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem({required String title, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 5),
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title, style: TextStyle(color: Colors.black, fontSize: 16)),
            Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 18),
          ],
        ),
      ),
    );
  }
}
//----------------------------------------

// สร้างหน้า "แก้ไขข้อมูลส่วนตัว"
class EditProfilePage extends StatefulWidget {
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("แก้ไขข้อมูลส่วนตัว",
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                fontFamily: 'poppins')),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                // เพิ่มฟังก์ชันเลือกไฟล์ภาพ
              },
              child: Stack(
                alignment: Alignment.bottomRight,
                children: [
                  CircleAvatar(
                    radius: 60,
                    backgroundImage: AssetImage('assets/profile.jpg'),
                  ),
                  Container(
                    padding: EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white, // พื้นหลังสีขาว
                      border:
                          Border.all(color: Colors.grey, width: 1), // ขอบสีเทา
                    ),
                    child:
                        Icon(Icons.camera_alt, color: Colors.black, size: 20),
                  )
                ],
              ),
            ),
            SizedBox(height: 20),
            Text("@johnkinggraphics"),
            SizedBox(height: 10),
            Row(
              children: [
                Expanded(child: _buildTextField("Frirst Name", "Charlotte ")),
                SizedBox(width: 10),
                Expanded(child: _buildTextField("Last Name", "King")),
              ],
            ),
            SizedBox(height: 10),
            _buildTextField("Username", "@johnkinggraphics"),
            SizedBox(
              height: size.height * 0.3,
            ),
            RoundedButton(
              text: "บันทึก",
              press: () {
                showConfirmationDialog(context);
              },
              fontFamily: 'Poppins',
            )
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String label, String hint, {bool isPassword = false}) {
    return TextField(
      obscureText: isPassword,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        filled: true,
        fillColor: Colors.grey[200],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 12),
      ),
    );
  }

  void showConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("ยืนยันการบันทึก"),
          content: Text("คุณแน่ใจหรือไม่ว่าข้อมูลถูกต้อง?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // ปิด Popup
              },
              child: Text("Cancel", style: TextStyle(color: Colors.black)),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(); // ปิด Popup
                saveData(context); // ✅ เรียกฟังก์ชันบันทึกข้อมูล
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
              child: Text("OK", style: TextStyle(color: Colors.white)),
            ),
          ],
        );
      },
    );
  }

  void saveData(BuildContext context) {
    print("📌 บันทึกข้อมูลสำเร็จ!");
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("บันทึกข้อมูลสำเร็จ!"),
        backgroundColor: Colors.green,
      ),
    );
  }
}

//-----------------------------------------
// สร้างหน้า "เปลี่ยนรหัสผ่าน"

class ChangePasswordScreen extends StatefulWidget {
  @override
  _ChangePasswordScreenState createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "รหัสผ่าน",
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, fontFamily: 'Poppins'),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(height: 20),
            _buildTextField("รหัสผ่านปัจจุบัน"),
            SizedBox(height: 10),
            _buildTextField("รหัสผ่านใหม่"),
            SizedBox(height: 10),
            _buildTextField("ยืนยันรหัสผ่าน"),
            SizedBox(height: size.height * 0.4),
            RoundedButton(
              text: "บันทึก",
              press: () {
                showConfirmationDialog(context);
              },
              fontFamily: 'Poppins',
            )
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String label) {
    return TextField(
      obscureText: true, // ✅ ซ่อนรหัสผ่าน
      decoration: InputDecoration(
        labelText: label,
        filled: true,
        fillColor: Colors.grey[200],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 12),
      ),
    );
  }

  void showConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("ยืนยันการบันทึก"),
          content: Text("คุณแน่ใจหรือไม่ว่าข้อมูลถูกต้อง?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // ปิด Popup
              },
              child: Text("Cancel", style: TextStyle(color: Colors.black)),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(); // ปิด Popup
                saveData(context); // ✅ เรียกฟังก์ชันบันทึกข้อมูล
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
              child: Text("OK", style: TextStyle(color: Colors.white)),
            ),
          ],
        );
      },
    );
  }

  void saveData(BuildContext context) {
    print("📌 บันทึกข้อมูลสำเร็จ!");
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("บันทึกข้อมูลสำเร็จ!"),
        backgroundColor: Colors.green,
      ),
    );
  }
}
