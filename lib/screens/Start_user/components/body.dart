import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:project_application/screens/Profile_user/profileuser_screen.dart';
import 'package:project_application/screens/Start_user/components/background.dart';
import 'package:project_application/screens/auth/sign_in_screen.dart';

class Body extends StatelessWidget {
  final Widget child;

  const Body({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Background(
      child: GestureDetector(
        onVerticalDragEnd: (details) {
          if (details.primaryVelocity! < 0) {
            // ปัดขึ้นเพื่อไปหน้าถัดไป
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProfileUserScreen(),
              ),
            );
          }
        },
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 0.0, vertical: 20.0),
                child: IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SignInScreen(),
                      ),
                    );
                  },
                  icon: const Icon(Icons.west),
                  color: Colors.white,
                  iconSize: 30.0,
                ),
              ),
            ),
            Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: size.height * 0.1),
                    Text(
                      "มาเริ่มหาหอที่ใช่",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 40,
                        fontFamily: 'NotoSansThai',
                        color: Colors.white,
                      ),
                    ).animate().slideY(begin: 1.0, end: 0.0, duration: 800.ms),
                    Text(
                      "ในสไตล์ของคุณกัน",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 40,
                        fontFamily: 'NotoSansThai',
                        color: Colors.white,
                      ),
                    ).animate().slideY(begin: 1.0, end: 0.0, duration: 800.ms),
                    SizedBox(height: size.height * 0.4),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 60.0),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Spacer(),
                    SizedBox(height: size.height * 0.7), // ลดช่องว่างให้อยู่ใกล้กับปุ่ม Start
                    Animate(
                      effects: [
                        MoveEffect(begin: Offset(0, 10), end: Offset(0, -10), duration: 800.ms),
                        FadeEffect(begin: 0.5, end: 1.0, duration: 800.ms), // เอฟเฟกต์สว่างขึ้น-มืดลง
                      ],
                      onComplete: (controller) => controller.repeat(reverse: true), // ทำซ้ำไปเรื่อยๆ
                      child: Icon(
                        Icons.expand_less_sharp,
                        color: Colors.white,
                        size: 40,
                      ),
                    ),
                    SizedBox(height: 10), // เพิ่มช่องว่างเล็กน้อยระหว่างไอคอนกับปุ่ม Start
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProfileUserScreen(),
                          ),
                        );
                      },
                      child: Text(
                        "Start",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontFamily: 'NotoSansThai',
                        ),
                      )
                          .animate()
                          .slideY(begin: 1.0, end: 0.0, duration: 800.ms),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
