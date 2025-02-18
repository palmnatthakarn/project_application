import 'package:flutter/material.dart';

class ManageDormsScreen extends StatefulWidget {
  @override
  _ManageDormsScreenState createState() => _ManageDormsScreenState();
}

class _ManageDormsScreenState extends State<ManageDormsScreen> {
  List<Map<String, String>> dorms = [];

  void confirm(int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("ยืนยันการลบ"),
          content:
              Text("คุณแน่ใจหรือไม่ว่าต้องการลบ ${dorms[index]["name"]} ?"),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text("ยกเลิก"),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  dorms.removeAt(index);
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

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'จัดการหอพัก',
            style: TextStyle(
                color: Colors.white,
                fontSize: 18), // เปลี่ยนสีตัวหนังสือเป็นสีขาว
          ),
          backgroundColor: Colors.deepPurple,
          iconTheme: IconThemeData(color: Colors.white),
        ),
        body: dorms.isEmpty
            ? Center(
                child: Text(
                  "ไม่มีผู้ใช้",
                  style: TextStyle(color: Colors.grey, fontSize: 18),
                ),
              )
            : ListView.builder(
                itemCount: dorms.length,
                itemBuilder: (context, index) {
                  return Card(
                    // color: const Color.fromARGB(255, 249, 243, 250), // พื้นหลังสีม่วงอ่อน
                    margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    child: Padding(
                      padding: EdgeInsets.all(12),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(Icons.apartment,
                              color: Colors.purple, size: 30), // ไอคอนอาคาร
                          SizedBox(width: 12), // ระยะห่างระหว่างไอคอนและข้อความ
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  dorms[index]["name"]!,
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  "ที่ตั้ง: ${dorms[index]["location"]}",
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.black54),
                                      
                                ),
                                
                              ],
                               
                            ),
                            
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ));
  }
}
