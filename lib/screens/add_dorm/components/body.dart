import 'package:flutter/material.dart';
import 'package:project_application/components/drop_down_field.dart';
import 'package:project_application/components/input_field.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

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
  File? _image;
  String? selectedProvince;
  String? selectedDistrict;
  String? selectedSubDistrict;
  String? selectedDaysStart;
  String? selectedDaysLatest;
  String? selectedDaysBussiness;
  String? selectedDaysBuilding;
  String? selectedTpye1Room;
  String? selectedTpye2Room;
  String? selected1,
      selected2,
      selected3,
      selected4,
      selected5,
      selected6,
      selected7,
      selected8,
      selected9,
      selected10,
      selected11,
      selected12,
      selected13,
      selected14,
      selected15,
      selected16,
      selected17,
      selected18,
      selected19,
      selected20,
      selected21,
      selected22,
      selected23,
      selected24,
      selected25;

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
  final TextEditingController subdistrictController = TextEditingController();
  final TextEditingController districtController = TextEditingController();
  final TextEditingController provinceController = TextEditingController();

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

  Future<void> _pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "ข้อมูลหอพักของฉัน",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontFamily: 'poppins',
          ),
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
              inputField(controller: dormNameController, hint: "กรอกข้อมูล"),
              Divider(),
              // หัวข้อ "ที่อยู่"
              sectionTitle("ที่อยู่ *"),
              inputField(
                  controller: addressController, hint: "เลขที่/ถนน/ซอย/อาคาร"),
              inputField(controller: subdistrictController, hint: "ตำบล"),
              inputField(controller: districtController, hint: "อำเภอ"),
              inputField(controller: provinceController, hint: "จังหวัด"),
              inputField(
                  controller: TextEditingController(), hint: "รหัสไปรษณีย์"),
              Divider(),
//--------------------------------------------------------------------
              // หัวข้อ "ตำแหน่งหอพัก"
             sectionTitle("อัพโหลดรูปภาพ"),
              GestureDetector(
                onTap: _pickImage,
                child: Container(
                  height: 150,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(10),
                    image: _image != null
                        ? DecorationImage(
                            image: FileImage(_image!),
                            fit: BoxFit.cover,
                          )
                        : null,
                  ),
                  child: _image == null
                      ? Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.camera_alt, color: Colors.black, size: 40),
                              SizedBox(height: 5),
                              Text("เพิ่มรูปภาพ", style: TextStyle(color: Colors.black)),
                            ],
                          ),
                        )
                      : null,
                ),
              ),
 //----------------------------------------------------------
              Divider(),
              // หัวข้อ "จำนวนห้องพัก"
              sectionTitle("จำนวนห้องพัก *"),
              SizedBox(height: 5),
              inputField(
                  controller: room1CountController, hint: "จำนวนห้องพัก"),
              inputField(controller: room2CountController, hint: "จำนวนชั้น "),
              sectionTitle("ประเภทห้องพัก *"),

              Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start, // ✅ จัดให้ข้อความชิดซ้าย
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: 2), // ✅ เพิ่มระยะห่างเล็กน้อย
                    child: Text(
                      "ห้องพัดลม",
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 2, // ✅ กำหนดให้ Dropdown กว้างขึ้นเล็กน้อย
                        child: dropdownField(
                            title: "โปรดเลือก",
                            selectedValue: selectedTpye1Room,
                            items: ["มี", "ไม่มี"],
                            onChanged: (value) {
                              setState(() => selectedTpye1Room = value);
                            }),
                      ),
                      SizedBox(width: 10), // ✅ เพิ่มระยะห่างระหว่างช่อง
                      Expanded(
                        flex: 2, // ✅ กำหนดให้ช่องกรอกราคาแคบลง
                        child: inputField(
                            controller: roomPriceFanController,
                            hint: "ราคา/เดือน"),
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
                        child: dropdownField(
                            title: "โปรดเลือก",
                            selectedValue: selectedTpye2Room,
                            items: ["มี", "ไม่มี"],
                            onChanged: (value) {
                              setState(() => selectedTpye2Room = value);
                            }),
                      ),
                      SizedBox(width: 10), // ✅ เพิ่มระยะห่างระหว่างช่อง
                      Expanded(
                        flex: 2, // ✅ กำหนดให้ช่องกรอกราคาแคบลง
                        child: inputField(
                            controller: roomPriceAriController,
                            hint: "ราคา/เดือน"),
                      ),
                    ],
                  ),
                ],
              ),
              Divider(),
              sectionTitle("ค่าสาธารณูปโภค *"),
              inputField(
                  controller: electricityController, hint: "ค่าไฟ/ยูนิต"),
              inputField(controller: waterController, hint: "ค่าน้ํา/หน่วย"),
              inputField(
                  controller: internetController, hint: "ค่าอินเตอร์เน็ต"),
              inputField(controller: otherController, hint: "ค่าอื่นๆ"),

              sectionTitle("ค่าใช้จ่าย *"),
              inputField(
                  controller: advancepaymentController,
                  hint: "ค่าจ่ายล่วงหน้า"),
              inputField(
                  controller: recognizanceController, hint: "ค่าเงินประกัน"),

              Divider(),
              // หัวข้อ "การติดต่อ *"
              sectionTitle("การติดต่อ *"),
              inputField(controller: phoneController, hint: "เบอร์โทรศัพท์"),
              inputField(controller: emailController, hint: "E-mail"),
              inputField(controller: lineController, hint: "Line(ถ้ามี)"),

              Divider(),

              sectionTitle("สิ่งอำนวยความสะดวก "),
              SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                      flex: 1, // ✅ กำหนดให้ช่องกรอกราคาแคบลง
                      child: Text("อินเตอร์เน็ต")),
                  Expanded(
                    flex: 2, // ✅ กำหนดให้ Dropdown กว้างขึ้นเล็กน้อย
                    child: dropdownField(
                        title: "โปรดเลือก",
                        selectedValue: selected1,
                        items: ["มี", "ไม่มี"],
                        onChanged: (value) {
                          setState(() => selected1 = value);
                        }),
                  ),
                  // ✅ เพิ่มระยะห่างระหว่างช่อง
                ],
              ),
              Row(
                children: [
                  Expanded(
                      flex: 1, // ✅ กำหนดให้ช่องกรอกราคาแคบลง
                      child: Text("เครื่องทำน้ำอุ่น	")),
                  Expanded(
                    flex: 2, // ✅ กำหนดให้ Dropdown กว้างขึ้นเล็กน้อย
                    child: dropdownField(
                        title: "โปรดเลือก",
                        selectedValue: selected2,
                        items: ["มี", "ไม่มี"],
                        onChanged: (value) {
                          setState(() => selected2 = value);
                        }),
                  ),
                  // ✅ เพิ่มระยะห่างระหว่างช่อง
                ],
              ),
              Row(
                children: [
                  Expanded(
                      flex: 1, // ✅ กำหนดให้ช่องกรอกราคาแคบลง
                      child: Text("อนุญาตให้เลี้ยงสัตว์	")),
                  Expanded(
                    flex: 2, // ✅ กำหนดให้ Dropdown กว้างขึ้นเล็กน้อย
                    child: dropdownField(
                        title: "โปรดเลือก",
                        selectedValue: selected3,
                        items: ["มี", "ไม่มี"],
                        onChanged: (value) {
                          setState(() => selected3 = value);
                        }),
                  ),
                  // ✅ เพิ่มระยะห่างระหว่างช่อง
                ],
              ),
              Row(
                children: [
                  Expanded(
                      flex: 1, // ✅ กำหนดให้ช่องกรอกราคาแคบลง
                      child: Text("บริการเครื่องซักผ้า")),
                  Expanded(
                    flex: 2, // ✅ กำหนดให้ Dropdown กว้างขึ้นเล็กน้อย
                    child: dropdownField(
                        title: "โปรดเลือก",
                        selectedValue: selected4,
                        items: ["มี", "ไม่มี"],
                        onChanged: (value) {
                          setState(() => selected4 = value);
                        }),
                  ),
                  // ✅ เพิ่มระยะห่างระหว่างช่อง
                ],
              ),
              // ------------   ------------
              Row(
                children: [
                  Expanded(
                      flex: 1, // ✅ กำหนดให้ช่องกรอกราคาแคบลง
                      child: Text("ตู้เย็น")),
                  Expanded(
                    flex: 2, // ✅ กำหนดให้ Dropdown กว้างขึ้นเล็กน้อย
                    child: dropdownField(
                        title: "โปรดเลือก",
                        selectedValue: selected5,
                        items: ["มี", "ไม่มี"],
                        onChanged: (value) {
                          setState(() => selected5 = value);
                        }),
                  ),
                  // ✅ เพิ่มระยะห่างระหว่างช่อง
                ],
              ),
              Row(
                children: [
                  Expanded(
                      flex: 1, // ✅ กำหนดให้ช่องกรอกราคาแคบลง
                      child: Text("ระเบียง	")),
                  Expanded(
                    flex: 2, // ✅ กำหนดให้ Dropdown กว้างขึ้นเล็กน้อย
                    child: dropdownField(
                        title: "โปรดเลือก",
                        selectedValue: selected6,
                        items: ["มี", "ไม่มี"],
                        onChanged: (value) {
                          setState(() => selected6 = value);
                        }),
                  ),
                  // ✅ เพิ่มระยะห่างระหว่างช่อง
                ],
              ),
              Row(
                children: [
                  Expanded(
                      flex: 1, // ✅ กำหนดให้ช่องกรอกราคาแคบลง
                      child: Text("เฟอร์นิเจอร์-ตู้,เตียง,โต๊ะ-เกาอี้	")),
                  Expanded(
                    flex: 2, // ✅ กำหนดให้ Dropdown กว้างขึ้นเล็กน้อย
                    child: dropdownField(
                        title: "โปรดเลือก",
                        selectedValue: selected7,
                        items: ["มี", "ไม่มี"],
                        onChanged: (value) {
                          setState(() => selected7 = value);
                        }),
                  ),
                  // ✅ เพิ่มระยะห่างระหว่างช่อง
                ],
              ),
              Row(
                children: [
                  Expanded(
                      flex: 1, // ✅ กำหนดให้ช่องกรอกราคาแคบลง
                      child: Text("Keycard")),
                  Expanded(
                    flex: 2, // ✅ กำหนดให้ Dropdown กว้างขึ้นเล็กน้อย
                    child: dropdownField(
                        title: "โปรดเลือก",
                        selectedValue: selected8,
                        items: ["มี", "ไม่มี"],
                        onChanged: (value) {
                          setState(() => selected8 = value);
                        }),
                  ),
                  // ✅ เพิ่มระยะห่างระหว่างช่อง
                ],
              ),
              //----------------------------------
              Row(
                children: [
                  Expanded(
                      flex: 1, // ✅ กำหนดให้ช่องกรอกราคาแคบลง
                      child: Text("CCTV")),
                  Expanded(
                    flex: 2, // ✅ กำหนดให้ Dropdown กว้างขึ้นเล็กน้อย
                    child: dropdownField(
                        title: "โปรดเลือก",
                        selectedValue: selected9,
                        items: ["มี", "ไม่มี"],
                        onChanged: (value) {
                          setState(() => selected9 = value);
                        }),
                  ),
                  // ✅ เพิ่มระยะห่างระหว่างช่อง
                ],
              ),
              Row(
                children: [
                  Expanded(
                      flex: 1, // ✅ กำหนดให้ช่องกรอกราคาแคบลง
                      child: Text("สแกนลายนิ้วมือ	")),
                  Expanded(
                    flex: 2, // ✅ กำหนดให้ Dropdown กว้างขึ้นเล็กน้อย
                    child: dropdownField(
                        title: "โปรดเลือก",
                        selectedValue: selected10,
                        items: ["มี", "ไม่มี"],
                        onChanged: (value) {
                          setState(() => selected10 = value);
                        }),
                  ),
                  // ✅ เพิ่มระยะห่างระหว่างช่อง
                ],
              ),
              Row(
                children: [
                  Expanded(
                      flex: 1, // ✅ กำหนดให้ช่องกรอกราคาแคบลง
                      child: Text("ที่จอดรถยนต์		")),
                  Expanded(
                    flex: 2, // ✅ กำหนดให้ Dropdown กว้างขึ้นเล็กน้อย
                    child: dropdownField(
                        title: "โปรดเลือก",
                        selectedValue: selected11,
                        items: ["มี", "ไม่มี"],
                        onChanged: (value) {
                          setState(() => selected11 = value);
                        }),
                  ),
                  // ✅ เพิ่มระยะห่างระหว่างช่อง
                ],
              ),
              Row(
                children: [
                  Expanded(
                      flex: 1, // ✅ กำหนดให้ช่องกรอกราคาแคบลง
                      child: Text("ที่จอดรถจักรยาน/จักรยานยนต์")),
                  Expanded(
                    flex: 2, // ✅ กำหนดให้ Dropdown กว้างขึ้นเล็กน้อย
                    child: dropdownField(
                        title: "โปรดเลือก",
                        selectedValue: selected12,
                        items: ["มี", "ไม่มี"],
                        onChanged: (value) {
                          setState(() => selected12 = value);
                        }),
                  ),
                  // ✅ เพิ่มระยะห่างระหว่างช่อง
                ],
              ),
              Row(
                children: [
                  Expanded(
                      flex: 1, // ✅ กำหนดให้ช่องกรอกราคาแคบลง
                      child: Text("เคเบิลทีวี/ดาวเทียม")),
                  Expanded(
                    flex: 2, // ✅ กำหนดให้ Dropdown กว้างขึ้นเล็กน้อย
                    child: dropdownField(
                        title: "โปรดเลือก",
                        selectedValue: selected13,
                        items: ["มี", "ไม่มี"],
                        onChanged: (value) {
                          setState(() => selected13 = value);
                        }),
                  ),
                  // ✅ เพิ่มระยะห่างระหว่างช่อง
                ],
              ),
              Row(
                children: [
                  Expanded(
                      flex: 1, // ✅ กำหนดให้ช่องกรอกราคาแคบลง
                      child: Text("อนุญาตให้สูบบุหรี่ในห้องพัก	")),
                  Expanded(
                    flex: 2, // ✅ กำหนดให้ Dropdown กว้างขึ้นเล็กน้อย
                    child: dropdownField(
                        title: "โปรดเลือก",
                        selectedValue: selected14,
                        items: ["มี", "ไม่มี"],
                        onChanged: (value) {
                          setState(() => selected14 = value);
                        }),
                  ),
                  // ✅ เพิ่มระยะห่างระหว่างช่อง
                ],
              ),
              Row(
                children: [
                  Expanded(
                      flex: 1, // ✅ กำหนดให้ช่องกรอกราคาแคบลง
                      child: Text("รปภ.")),
                  Expanded(
                    flex: 2, // ✅ กำหนดให้ Dropdown กว้างขึ้นเล็กน้อย
                    child: dropdownField(
                        title: "โปรดเลือก",
                        selectedValue: selected15,
                        items: ["มี", "ไม่มี"],
                        onChanged: (value) {
                          setState(() => selected15 = value);
                        }),
                  ),
                  // ✅ เพิ่มระยะห่างระหว่างช่อง
                ],
              ),
              Row(
                children: [
                  Expanded(
                      flex: 1, // ✅ กำหนดให้ช่องกรอกราคาแคบลง
                      child: Text("สระว่ายน้ำ	")),
                  Expanded(
                    flex: 2, // ✅ กำหนดให้ Dropdown กว้างขึ้นเล็กน้อย
                    child: dropdownField(
                        title: "โปรดเลือก",
                        selectedValue: selected16,
                        items: ["มี", "ไม่มี"],
                        onChanged: (value) {
                          setState(() => selected16 = value);
                        }),
                  ),
                  // ✅ เพิ่มระยะห่างระหว่างช่อง
                ],
              ),
              //----------------------------------
              Row(
                children: [
                  Expanded(
                      flex: 1, // ✅ กำหนดให้ช่องกรอกราคาแคบลง
                      child: Text("โรงยิม/ฟิตเนส	")),
                  Expanded(
                    flex: 2, // ✅ กำหนดให้ Dropdown กว้างขึ้นเล็กน้อย
                    child: dropdownField(
                        title: "โปรดเลือก",
                        selectedValue: selected17,
                        items: ["มี", "ไม่มี"],
                        onChanged: (value) {
                          setState(() => selected17 = value);
                        }),
                  ),
                  // ✅ เพิ่มระยะห่างระหว่างช่อง
                ],
              ),
              Row(
                children: [
                  Expanded(
                      flex: 1, // ✅ กำหนดให้ช่องกรอกราคาแคบลง
                      child: Text("ร้านทำผม-เสริมสวย	")),
                  Expanded(
                    flex: 2, // ✅ กำหนดให้ Dropdown กว้างขึ้นเล็กน้อย
                    child: dropdownField(
                        title: "โปรดเลือก",
                        selectedValue: selected18,
                        items: ["มี", "ไม่มี"],
                        onChanged: (value) {
                          setState(() => selected18 = value);
                        }),
                  ),
                  // ✅ เพิ่มระยะห่างระหว่างช่อง
                ],
              ),
              Row(
                children: [
                  Expanded(
                      flex: 1, // ✅ กำหนดให้ช่องกรอกราคาแคบลง
                      child: Text("ลิฟต์	")),
                  Expanded(
                    flex: 2, // ✅ กำหนดให้ Dropdown กว้างขึ้นเล็กน้อย
                    child: dropdownField(
                        title: "โปรดเลือก",
                        selectedValue: selected19,
                        items: ["มี", "ไม่มี"],
                        onChanged: (value) {
                          setState(() => selected19 = value);
                        }),
                  ),
                  // ✅ เพิ่มระยะห่างระหว่างช่อง
                ],
              ),
              Row(
                children: [
                  Expanded(
                      flex: 1, // ✅ กำหนดให้ช่องกรอกราคาแคบลง
                      child: Text("ร้านค้า")),
                  Expanded(
                    flex: 2, // ✅ กำหนดให้ Dropdown กว้างขึ้นเล็กน้อย
                    child: dropdownField(
                        title: "โปรดเลือก",
                        selectedValue: selected20,
                        items: ["มี", "ไม่มี"],
                        onChanged: (value) {
                          setState(() => selected20 = value);
                        }),
                  ),
                  // ✅ เพิ่มระยะห่างระหว่างช่อง
                ],
              ),

              Row(
                children: [
                  Expanded(
                      flex: 1, // ✅ กำหนดให้ช่องกรอกราคาแคบลง
                      child: Text("ร้านอาหาร")),
                  Expanded(
                    flex: 2, // ✅ กำหนดให้ Dropdown กว้างขึ้นเล็กน้อย
                    child: dropdownField(
                        title: "โปรดเลือก",
                        selectedValue: selected21,
                        items: ["มี", "ไม่มี"],
                        onChanged: (value) {
                          setState(() => selected21 = value);
                        }),
                  ),
                  // ✅ เพิ่มระยะห่างระหว่างช่อง
                ],
              ),

              Row(
                children: [
                  Expanded(
                      flex: 1, // ✅ กำหนดให้ช่องกรอกราคาแคบลง
                      child: Text("เตาปรุงอาหาร	")),
                  Expanded(
                    flex: 2, // ✅ กำหนดให้ Dropdown กว้างขึ้นเล็กน้อย
                    child: dropdownField(
                        title: "โปรดเลือก",
                        selectedValue: selected23,
                        items: ["มี", "ไม่มี"],
                        onChanged: (value) {
                          setState(() => selected23 = value);
                        }),
                  ),
                  // ✅ เพิ่มระยะห่างระหว่างช่อง
                ],
              ),
              Row(
                children: [
                  Expanded(
                      flex: 1, // ✅ กำหนดให้ช่องกรอกราคาแคบลง
                      child: Text("อนุญาตให้ทำอาหาร")),
                  Expanded(
                    flex: 2, // ✅ กำหนดให้ Dropdown กว้างขึ้นเล็กน้อย
                    child: dropdownField(
                        title: "โปรดเลือก",
                        selectedValue: selected24,
                        items: ["มี", "ไม่มี"],
                        onChanged: (value) {
                          setState(() => selected24 = value);
                        }),
                  ),
                  // ✅ เพิ่มระยะห่างระหว่างช่อง
                ],
              ),

              SizedBox(height: 20),

              SizedBox(height: 20),

              // ปุ่ม "บันทึก" และ "แก้ไข"
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildButton("บันทึก", Colors.purple, context),
                  buildButton("แก้ไข", Colors.deepPurple, context),
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
          style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.bold, fontFamily: 'poppins'),
        ),
      ),
    );
  }

  // Widget สำหรับสร้างปุ่ม
  Widget buildButton(String text, Color color, BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8),
        child: ElevatedButton(
          onPressed: () {
            showConfirmationDialog(context);
          },
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
//-----------------------------------------------
//อัพรูป
