import 'package:flutter/material.dart';
import 'package:project_application/components/drop_down_field.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AddDormScreen(),
    );
  }
}

class AddDormScreen extends StatefulWidget {
  @override
  _AddDormScreenState createState() => _AddDormScreenState();
}

class _AddDormScreenState extends State<AddDormScreen> {
  String? selectedProvince;
  String? selectedDistrict;
  String? selectedSubDistrict;
  String? selectedDaysStart;
  String? selectedDaysLatest;
  String? selectedDaysBussiness;
  String? selectedDaysBuilding;
  String? selectedTpye1Room;
  String? selectedTpye2Room;
  final TextEditingController dormNameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController buildingTypeController = TextEditingController();
  final TextEditingController businessTypeController = TextEditingController();
  final TextEditingController billingDateController = TextEditingController();
  final TextEditingController paymentDueController = TextEditingController();
  final TextEditingController floorCountController = TextEditingController();
  final TextEditingController room1CountController = TextEditingController();

  final TextEditingController room2CountController = TextEditingController();
  final TextEditingController priceRoomController = TextEditingController();
  final TextEditingController recognizanceController = TextEditingController();
  final TextEditingController advancepaymentController =
      TextEditingController();
  final TextEditingController electricityController = TextEditingController();
  final TextEditingController waterController = TextEditingController();
  final TextEditingController lineController = TextEditingController();
  final TextEditingController internetController = TextEditingController();
  final TextEditingController otherController = TextEditingController();
  final TextEditingController roomPriceFanController = TextEditingController();
  final TextEditingController roomPriceAriController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "ข้อมูลหอพักของฉัน",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.purple,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // หัวข้อ "ชื่อหอพัก"
              sectionTitle("ชื่อหอพัก *"),
              inputField(dormNameController, "กรอกข้อมูล"),
              Divider(),
              // หัวข้อ "ที่อยู่"
              sectionTitle("ที่อยู่ *"),
              inputField(addressController, "เลขที่/ถนน/ซอย/อาคาร"),
              SizedBox(height: 5),
              dropdownField(title: "จังหวัด *", selectedValue: selectedProvince, items: ["กรุงเทพ", "เชียงใหม่", "ภูเก็ต"], onChanged: (value) {
                setState(() => selectedProvince = value);
              }),
              dropdownField(title: "เขต/อำเภอ *", selectedValue: selectedDistrict, items: ["เขต 1", "เขต 2"], onChanged: (value) {
                setState(() => selectedDistrict = value);
              }),
              dropdownField(title: "แขวง/ตำบล", selectedValue: selectedSubDistrict, items: ["ตำบล 1", "ตำบล 2"], onChanged: (value) {
                setState(() => selectedSubDistrict = value);
              }),
              inputField(TextEditingController(), "รหัสไปรษณีย์"),
              Divider(),

              // หัวข้อ "ตำแหน่งหอพัก"
              sectionTitle("ตำแหน่งหอพัก"),
              Container(
                height: 150,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Icon(Icons.location_on, color: Colors.black, size: 40),
                ),
              ),
              Divider(),
              // หัวข้อ "จำนวนห้องพัก"
              sectionTitle("จำนวนห้องพัก *"),
              SizedBox(height: 5),
              inputField(room1CountController, "จำนวนห้องพัก"),
              inputField(room2CountController, "จำนวนชั้น "),
              sectionTitle("ประเภทห้องพัก *"),

              Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start, // ✅ จัดให้ข้อความชิดซ้าย
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 2), // ✅ เพิ่มระยะห่างเล็กน้อย
                    child: Text(
                      "ห้องพัดลม",
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 2, // ✅ กำหนดให้ Dropdown กว้างขึ้นเล็กน้อย
                        child: dropdownField(title: "โปรดเลือก", selectedValue: selectedTpye1Room, items: ["มี", "ไม่มี"], onChanged: (value) {
                            setState(() => selectedTpye1Room = value);
                          }),
                      ),
                      SizedBox(width: 10), // ✅ เพิ่มระยะห่างระหว่างช่อง
                      Expanded(
                        flex: 2, // ✅ กำหนดให้ช่องกรอกราคาแคบลง
                        child: inputField(roomPriceFanController, "ราคา/เดือน"),
                      ),
                    ],
                  ),
                ],
              ),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 2), 
                    child: Text("ห้องแอร์"),
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 2, // ✅ กำหนดให้ Dropdown กว้างขึ้นเล็กน้อย
                        child: dropdownField(title: "โปรดเลือก", selectedValue: selectedTpye2Room, items: ["มี", "ไม่มี"], onChanged: (value) {
                            setState(() => selectedTpye2Room = value);
                          }),
                      ),
                      SizedBox(width: 10), // ✅ เพิ่มระยะห่างระหว่างช่อง
                      Expanded(
                        flex: 2, // ✅ กำหนดให้ช่องกรอกราคาแคบลง
                        child: inputField(roomPriceAriController, "ราคา/เดือน"),
                      ),
                    ],
                  ),
                ],
              ),
              Divider(),
              sectionTitle("ค่าสาธารณูปโภค *"),
              inputField(electricityController, "ค่าไฟ/ยูนิต"),
              inputField(waterController, "ค่าน้ํา/หน่วย"),
              inputField(internetController, "ค่าอินเตอร์เน็ต"),
              inputField(otherController, "ค่าอื่นๆ"),

              sectionTitle("ค่าใช้จ่าย *"),
              inputField(advancepaymentController, "ค่าจ่ายล่วงหน้า"),
              inputField(recognizanceController, "ค่าเงินประกัน"),
              dropdownField(title: "วันที่ทำบิลค่าเช่า", selectedValue: selectedDaysStart, items: [
                "วันที่ 1 ของทุกเดือน",
                "วันที่ 2 ของทุกเดือน",
                "วันที่ 3 ของทุกเดือน",
                "วันที่ 4 ของทุกเดือน",
                "วันที่ 5 ของทุกเดือน",
                "วันที่ 6 ของทุกเดือน",
                "วันที่ 7 ของทุกเดือน",
                "วันที่ 8 ของทุกเดือน",
                "วันที่ 9 ของทุกเดือน",
                "วันที่ 10 ของทุกเดือน",
                "วันที่ 11 ของทุกเดือน",
                "วันที่ 12 ของทุกเดือน",
                "วันที่ 13 ของทุกเดือน",
                "วันที่ 14 ของทุกเดือน",
                "วันที่ 15 ของทุกเดือน",
                "วันที่ 16 ของทุกเดือน",
                "วันที่ 17 ของทุกเดือน",
                "วันที่ 18 ของทุกเดือน",
                "วันที่ 19 ของทุกเดือน",
                "วันที่ 20 ของทุกเดือน",
                "วันที่ 21 ของทุกเดือน",
                "วันที่ 22 ของทุกเดือน",
                "วันที่ 23 ของทุกเดือน",
                "วันที่ 24 ของทุกเดือน",
                "วันที่ 25 ของทุกเดือน",
                "วันที่ 26 ของทุกเดือน",
                "วันที่ 27 ของทุกเดือน",
                "วันที่ 28 ของทุกเดือน",
                "วันที่ 29 ของทุกเดือน",
                "วันที่ 30 ของทุกเดือน"
              ], onChanged: (value) {
                setState(() => selectedDaysStart = value);
              }),
              dropdownField(title: "วันที่สิ้นสุดการชำระเงิน", selectedValue: selectedDaysLatest, items: [
                "วันที่ 1 ของทุกเดือน",
                "วันที่ 2 ของทุกเดือน",
                "วันที่ 3 ของทุกเดือน",
                "วันที่ 4 ของทุกเดือน",
                "วันที่ 5 ของทุกเดือน",
                "วันที่ 6 ของทุกเดือน",
                "วันที่ 7 ของทุกเดือน",
                "วันที่ 8 ของทุกเดือน",
                "วันที่ 9 ของทุกเดือน",
                "วันที่ 10 ของทุกเดือน",
                "วันที่ 11 ของทุกเดือน",
                "วันที่ 12 ของทุกเดือน",
                "วันที่ 13 ของทุกเดือน",
                "วันที่ 14 ของทุกเดือน",
                "วันที่ 15 ของทุกเดือน",
                "วันที่ 16 ของทุกเดือน",
                "วันที่ 17 ของทุกเดือน",
                "วันที่ 18 ของทุกเดือน",
                "วันที่ 19 ของทุกเดือน",
                "วันที่ 20 ของทุกเดือน",
                "วันที่ 21 ของทุกเดือน",
                "วันที่ 22 ของทุกเดือน",
                "วันที่ 23 ของทุกเดือน",
                "วันที่ 24 ของทุกเดือน",
                "วันที่ 25 ของทุกเดือน",
                "วันที่ 26 ของทุกเดือน",
                "วันที่ 27 ของทุกเดือน",
                "วันที่ 28 ของทุกเดือน",
                "วันที่ 29 ของทุกเดือน",
                "วันที่ 30 ของทุกเดือน"
              ], onChanged: (value) {
                setState(() => selectedDaysLatest = value);
              }),

              Divider(),
              // หัวข้อ "การติดต่อ *"
              sectionTitle("การติดต่อ *"),
              inputField(phoneController, "เบอร์โทรศัพท์"),
              inputField(emailController, "E-mail"),
              inputField(lineController, "Line(ถ้ามี)"),

              sectionTitle("ประเภทอาคาร *"),
              dropdownField(title: "ประเภทอาคาร", selectedValue: selectedDaysBuilding, items: ["หอพัก", "อพาร์ทเมนท์"], onChanged: (value) {
                setState(() => selectedDaysBuilding = value);
              }),

              sectionTitle("ประเภทธุรกิจ *"),
              dropdownField(title: "ประเภทธุรกิจ", selectedValue: selectedDaysBussiness, items: ["บุคคลธรรมดา", "บริษัท/หจก"], onChanged: (value) {
                setState(() => selectedDaysBussiness = value);
              }),

              Divider(),

              SizedBox(height: 20),

              SizedBox(height: 20),

              // ปุ่ม "บันทึก" และ "แก้ไข"
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildButton("บันทึก", Colors.purple),
                  buildButton("แก้ไข", Colors.deepPurple),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget สำหรับแสดงหัวข้อแต่ละส่วน
  Widget sectionTitle(String title) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          title,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  // Widget สำหรับช่องกรอกข้อมูล
  Widget inputField(TextEditingController controller, String hint) {
    return Padding(
      padding: EdgeInsets.only(bottom: 2),
      child: SizedBox(
        height: 36, // ✅ กำหนดความสูงของช่องกรอกข้อมูล
        child: TextField(
          controller: controller,
          style: TextStyle(fontSize: 14), // ✅ ลดขนาดตัวอักษร
          decoration: InputDecoration(
            hintText: hint,
            filled: true,
            fillColor: Colors.grey[200],
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: BorderSide.none,
            ),
            contentPadding: EdgeInsets.symmetric(
                vertical: 6, horizontal: 10), // ✅ ลด padding ด้านใน
          ),
        ),
      ),
    );
  }

  // Widget สำหรับสร้างปุ่ม
  Widget buildButton(String text, Color color) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8),
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(vertical: 14),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            backgroundColor: Colors.transparent,
            elevation: 5,
          ).copyWith(
            backgroundColor: MaterialStateProperty.resolveWith(
              (states) => null,
            ),
            shadowColor: MaterialStateProperty.all(Colors.transparent),
          ),
          child: Ink(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [color, Colors.purpleAccent],
              ),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Container(
              alignment: Alignment.center,
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 14),
              child: Text(
                text,
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}


