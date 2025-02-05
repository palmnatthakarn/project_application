import 'package:flutter/material.dart';
import 'package:project_application/components/rounded_button.dart';
import 'package:project_application/constants.dart';
import 'package:project_application/screens/Type/components/background.dart';
import 'package:project_application/screens/Welcome/welcome_screen.dart';
import 'package:project_application/screens/auth/sign_up_owner_screen%20.dart';
import 'package:project_application/screens/auth/sign_up_screen.dart';

//import 'package:project_test/Screens/Welcome/welcome_screen.dart';

class Body extends StatelessWidget {
  final Widget? child;

  const Body({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Background(
        child: Stack(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Container(
            //color: Colors.black,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 0.0,
                  vertical: 20.0), // กำหนด padding แนวนอน 20, แนวตั้ง 10
              child: IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return WelcomeScreen();
                      },
                    ),
                  );
                },
                icon: const Icon(Icons.west),
                color: Colors.white,
                iconSize: 30.0,
              ),
            ),
          ),
        ),
        Center(
          child: SingleChildScrollView(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(
                "โปรด",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 55,
                    fontFamily: 'NotoSansThai',
                    color: Colors.white),
              ),
              Text(
                "เลือกประเภทผู้ใช้",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                    fontFamily: 'NotoSansThai',
                    color: Colors.white),
              ),
              SizedBox(
                height: size.height * 0.4,
              ),
            ]),
          ),
        ),
        Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            SizedBox(
              height: size.height * 0.1,
            ),
            RoundedButton(
              text: "บุคคลทั่วไป",
              color: Colors.white,
              textColor: kPrimaryColor,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const SignUpScreen(); // เพิ่ม child ให้กับ SignUpScreen
                    },
                  ),
                );
              },
              fontFamily: 'NotoSansThai',
            ),
            //
            RoundedButton(
              text: "เจ้าของหอพัก",
              color: Colors.white,
              textColor: kPrimaryColor,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const SignUpOwnerScreen(); //ถึงตรงนี้
                    },
                  ),
                );
              },
              fontFamily: 'NotoSansThai',
            ),
          ]),
        ),
      ],
    ));
  }
}


 




 //ทำถึงตรงนี้
