import 'package:flutter/material.dart';
import 'package:project_application/screens/auth/components/sign_in_form.dart';

class SignInScreen extends StatelessWidget {
  final Widget? child;

  const SignInScreen({
    this.child, // กำหนดให้เป็น optional parameter
    Key? key,
  }) : super(key: key);

  @override
Widget build(BuildContext context) {
  Size size = MediaQuery.of(context).size;
  return Scaffold(  // เพิ่ม Scaffold ห่อ SignUpScreen เพื่อให้ Material widget ทำงานได้
    body: Container(
      height: size.height,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: -150,
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: const Color.fromARGB(255, 59, 59, 59).withOpacity(0.5),
                    blurRadius: 30,
                    spreadRadius: 10,
                    offset: Offset(0, 5),
                  ),
                ],
                borderRadius: BorderRadius.circular(500),
              ),
              child: Image.asset(
                "assets/images/13.png",
                width: size.width * 1.2,
              ),
            ),
          ),
          child ?? SignInForm(),  // ใช้ SignUpForm เป็นค่าเริ่มต้นหากไม่มี child
        ],
      ),
    ),
  );
}
}