import 'package:flutter/material.dart';

class inputField extends StatelessWidget {
  const inputField({
    super.key,
    required this.controller,
    required this.hint,
  });

  final TextEditingController controller;
  final String hint;

  @override
  Widget build(BuildContext context) {
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
}