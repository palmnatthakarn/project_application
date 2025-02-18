import 'package:flutter/material.dart';

class dropdownField extends StatelessWidget {
  final String title;
  final String? selectedValue;
  final List<String> items;
  final ValueChanged<String?> onChanged;
  final String? Function(String?)? validator;

  const dropdownField({
    super.key,
    required this.title,
    required this.selectedValue,
    required this.items,
    required this.onChanged,
    this.validator, // ✅ เพิ่ม validator เพื่อรองรับการตรวจสอบ
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 6),
      child: FormField<String>(
        validator: validator, // ✅ ใช้ validator ที่ส่งเข้ามา
        builder: (FormFieldState<String> state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 40, // ✅ ปรับความสูงของ dropdown ให้เหมาะสม
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(
                    color: state.hasError ? Colors.red : Colors.transparent, // ✅ กรอบแดงถ้าไม่ได้เลือก
                    width: 1,
                  ),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    isExpanded: true,
                    hint: Text(
                      title,
                      style: TextStyle(fontSize: 14, color: Colors.black54),
                    ),
                    value: selectedValue,
                    items: items.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value, style: TextStyle(fontSize: 14)),
                      );
                    }).toList(),
                    onChanged: (newValue) {
                      onChanged(newValue);
                      state.didChange(newValue); // ✅ อัปเดตค่าใน FormFieldState
                    },
                    icon: Icon(Icons.arrow_drop_down, size: 20),
                  ),
                ),
              ),
              if (state.hasError) // ✅ แสดงข้อความ error ใต้ dropdown
                Padding(
                  padding: const EdgeInsets.only(left: 8, top: 4),
                  child: Text(
                    state.errorText ?? "",
                    style: TextStyle(color: Colors.red, fontSize: 12),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}
