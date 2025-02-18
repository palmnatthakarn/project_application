import 'package:flutter/material.dart';
import 'package:project_application/components/drop_down_field.dart';
import 'package:project_application/components/input_field_num.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/services.dart';
import 'dart:io';

import 'package:project_application/components/input_field_text.dart';
//import 'package:project_application/components/rounded_button.dart';

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
  final _formKey = GlobalKey<FormState>();

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
  bool validateForm() {
    if (dormNameController.text.isEmpty ||
        addressController.text.isEmpty ||
        subdistrictController.text.isEmpty ||
        districtController.text.isEmpty ||
        provinceController.text.isEmpty ||
        phoneController.text.isEmpty ||
        emailController.text.isEmpty ||
        room1CountController.text.isEmpty ||
        room2CountController.text.isEmpty ||
        electricityController.text.isEmpty ||
        waterController.text.isEmpty ||
        advancepaymentController.text.isEmpty ||
        recognizanceController.text.isEmpty) {
      return false; // ข้อมูลไม่ครบ
    }
    return true; // ข้อมูลครบ
  }

  Future<void> _pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
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
            fontSize: 18,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // หัวข้อ "ชื่อหอพัก"
                sectionTitle("ชื่อหอพัก"),
                InputField(
                  controller: dormNameController,
                  hint: "กรอกข้อมูล *",
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'กรุณากรอกชื่อหอพัก';
                    }
                    return null;
                  },
                ),

                Divider(),
                // หัวข้อ "ที่อยู่"
                sectionTitle("ที่อยู่"),
                InputField(
                  controller: addressController,
                  hint: "เลขที่/ถนน/ซอย/อาคาร *",
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'กรุณากรอกที่อยู่';
                    }
                    return null;
                  },
                ),
                InputField(
                  controller: subdistrictController,
                  hint: "ตำบล *",
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'กรุณากรอกที่อยู่';
                    }
                    return null;
                  },
                ),
                InputField(
                  controller: districtController,
                  hint: "อำเภอ *",
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'กรุณากรอกที่อยู่';
                    }
                    return null;
                  },
                ),
                InputField(
                  controller: provinceController,
                  hint: "จังหวัด *",
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'กรุณากรอกที่อยู่';
                    }
                    return null;
                  },
                ),
                InputField(
                  controller: TextEditingController(),
                  hint: "รหัสไปรษณีย์ *",
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(5)
                  ],
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'กรุณากรอกรหัสไปรษณีย์';
                    }
                    return null;
                  },
                ),
                Divider(),
                //--------------------------------------------------------------------
                // หัวข้อ "อัพโหลดรูปภาพ"
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
                                Icon(Icons.camera_alt,
                                    color: Colors.black, size: 40),
                                SizedBox(height: 5),
                                Text("เพิ่มรูปภาพ",
                                    style: TextStyle(color: Colors.black)),
                              ],
                            ),
                          )
                        : null,
                  ),
                ),
                //----------------------------------------------------------
                Divider(),
                // หัวข้อ "จำนวนห้องพัก"
                sectionTitle("จำนวนห้องพัก"),
                SizedBox(height: 5),
                InputField(
                  controller: room1CountController,
                  hint: "จำนวนห้องพัก *",
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(3)
                  ],
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'กรุณากรอกจำนวนห้องพัก';
                    }
                    return null;
                  },
                ),
                InputField(
                  controller: room2CountController,
                  hint: "จำนวนชั้น *",
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(2)
                  ],
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'กรุณากรอกจำนวนชั้น';
                    }
                    return null;
                  },
                ),

                sectionTitle("ประเภทห้องพัก"),
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
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'กรุณาเลือก';
                                }
                                return null;
                              },
                              selectedValue: selectedTpye1Room,
                              items: ["มี", "ไม่มี"],
                              onChanged: (value) {
                                setState(() => selectedTpye1Room = value);
                              }),
                        ),
                        SizedBox(width: 10), // ✅ เพิ่มระยะห่างระหว่างช่อง
                        Expanded(
                          flex: 2, // ✅ กำหนดให้ช่องกรอกราคาแคบลง
                          child: InputFieldNum(
                            controller: roomPriceFanController,
                            hint: "ราคา/เดือน",
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'กรุณากรอกราคา';
                              }
                              return null;
                            },
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly
                            ],
                          ),
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
                          flex: 2,
                          // ✅ กำหนดให้ Dropdown กว้างขึ้นเล็กน้อย
                          child: dropdownField(
                              title: "โปรดเลือก",
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'กรุณาเลือก';
                                }
                                return null;
                              },
                              selectedValue: selectedTpye2Room,
                              items: ["มี", "ไม่มี"],
                              onChanged: (value) {
                                setState(() => selectedTpye2Room = value);
                              }),
                        ),
                        SizedBox(width: 10), // ✅ เพิ่มระยะห่างระหว่างช่อง
                        Expanded(
                          flex: 2, // ✅ กำหนดให้ช่องกรอกราคาแคบลง
                          child: InputFieldNum(
                            controller: roomPriceAriController,
                            hint: "ราคา/เดือน",
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'กรุณากรอกราคา';
                              }
                              return null;
                            },
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Divider(),
                sectionTitle("ค่าสาธารณูปโภค"),
                InputFieldNum(
                  controller: electricityController,
                  hint: "ค่าไฟ/ยูนิต *",
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(2)
                  ],
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'กรุณากรอกราคา';
                    }
                    return null;
                  },
                ),
                InputFieldNum(
                  controller: waterController,
                  hint: "ค่าน้ำ/ยูนิต *",
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(2)
                  ],
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'กรุณากรอกราคา';
                    }
                    return null;
                  },
                ),
                InputFieldNum(
                  controller: internetController,
                  hint: "ค่าอินเตอร์เน็ต/คน(ถ้ามี)",
                ),
                InputField(
                    controller: otherController,
                    hint: "ค่าอื่น ๆ เช่น 'ค่าส่วนกลาง 200 บาท' )"),

                sectionTitle("ค่าใช้จ่าย"),
                InputFieldNum(
                  controller: advancepaymentController,
                  hint: "ค่าจ่ายล่วงหน้า *",
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'กรุณากรอกราคา';
                    }
                    return null;
                  },
                ),
                InputFieldNum(
                  controller: recognizanceController,
                  hint: "ค่าเงินประกัน *",
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'กรุณากรอกราคา';
                    }
                    return null;
                  },
                ),

                Divider(),
                // หัวข้อ "การติดต่อ *"
                sectionTitle("การติดต่อ"),
                InputField(
                  controller: phoneController,
                  hint: "เบอร์โทรศัพท์ *",
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(10)
                  ],
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'กรุณากรอกเบอร์โทรศัพท์';
                    }
                    if (value.length != 10) {
                      return 'เบอร์โทรศัพท์ต้องมี 10 หลัก';
                    }
                    return null;
                  },
                ),
                InputField(
                  controller: emailController,
                  hint: "E-mail *",
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'กรุณากรอกE-mail';
                    }
                    return null;
                  },
                ),

                InputField(controller: lineController, hint: "Line(ถ้ามี)"),

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
                          validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'กรุณาเลือก';
                                }
                                return null;
                              },
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
                          validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'กรุณาเลือก';
                                }
                                return null;
                              },
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
                          validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'กรุณาเลือก';
                                }
                                return null;
                              },
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
                          validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'กรุณาเลือก';
                                }
                                return null;
                              },
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
                          validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'กรุณาเลือก';
                                }
                                return null;
                              },
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
                          validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'กรุณาเลือก';
                                }
                                return null;
                              },
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
                        child: Text("เฟอร์นิเจอร์-ตู้,เตียง,โต๊ะ-เก้าอี้	")),
                    Expanded(
                      flex: 2, // ✅ กำหนดให้ Dropdown กว้างขึ้นเล็กน้อย
                      child: dropdownField(
                          title: "โปรดเลือก",
                          validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'กรุณาเลือก';
                                }
                                return null;
                              },
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
                          validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'กรุณาเลือก';
                                }
                                return null;
                              },
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
                          validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'กรุณาเลือก';
                                }
                                return null;
                              },
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
                          validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'กรุณาเลือก';
                                }
                                return null;
                              },
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
                          validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'กรุณาเลือก';
                                }
                                return null;
                              },
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
                          validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'กรุณาเลือก';
                                }
                                return null;
                              },
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
                          validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'กรุณาเลือก';
                                }
                                return null;
                              },
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
                          validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'กรุณาเลือก';
                                }
                                return null;
                              },
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
                          validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'กรุณาเลือก';
                                }
                                return null;
                              },
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
                          validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'กรุณาเลือก';
                                }
                                return null;
                              },
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
                          validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'กรุณาเลือก';
                                }
                                return null;
                              },
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
                          validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'กรุณาเลือก';
                                }
                                return null;
                              },
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
                          validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'กรุณาเลือก';
                                }
                                return null;
                              },
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
                          validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'กรุณาเลือก';
                                }
                                return null;
                              },
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
                          validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'กรุณาเลือก';
                                }
                                return null;
                              },
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
                          validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'กรุณาเลือก';
                                }
                                return null;
                              },
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
                          validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'กรุณาเลือก';
                                }
                                return null;
                              },
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
                    buildButton("บันทึก", Colors.deepPurple, context),
                  ],
                ),
              ],
            ),
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
    //Size size = MediaQuery.of(context).size;
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 80),
        child: ElevatedButton(
          onPressed: () {
            showConfirmationDialog(context);
          },
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 50),
            backgroundColor: color,
            /*side: const BorderSide(
              color: Color.fromARGB(100, 140, 28, 218), // สีของขอบ
              width: 2.5, // ความหนาของขอบ
            ),*/
          ),
          child: Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontFamily: 'poppins', // ใช้ฟอนต์ที่กำหนด
            ),
          ),
        ),
      ),
    );
  }

  void showConfirmationDialog(BuildContext context) {
    if (!_formKey.currentState!.validate()) {
      return; // หยุดถ้ายังมีข้อมูลที่ไม่ได้กรอก
    }
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

//-----------------------------------------------
//แค่
