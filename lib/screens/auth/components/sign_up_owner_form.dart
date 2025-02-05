import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:project_application/components/already_have_account_check.dart';
import 'package:project_application/components/rounded_button.dart';
import 'package:project_application/screens/Start_owner/start_screen.dart';
import 'package:project_application/screens/Welcome/welcome_screen.dart';
import 'package:project_application/screens/auth/sign_in_screen.dart';
//import 'package:project_application/screens/Start_user/start_screen.dart';
//import 'package:project_application/screens/auth/sign_up_screen.dart';

class SignUpOwnerForm extends StatefulWidget {
  final Widget? child;

  const SignUpOwnerForm({Key? key, this.child}) : super(key: key);

  @override
  _SignUpOwnerFormState createState() => _SignUpOwnerFormState();
}

class _SignUpOwnerFormState extends State<SignUpOwnerForm> {
  final _formKey = GlobalKey<FormState>();
  //bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0.0),
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: SizedBox(
            height: size.height * 1.9,
            width: size.width * 1.9,
            child: Container(
              // color: Colors.pink,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      //color: Colors.black,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 0.0,vertical:20.0), // กำหนด padding แนวนอน 20, แนวตั้ง 10
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
                  SizedBox(
                    height: size.height * 0.05,
                  ),
                  Container(
                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.center, // จัดข้อความชิดซ้าย
                      children: [
                        Text(
                          "Hello",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 5), // เพิ่มระยะห่างระหว่างข้อความ
                        Text(
                          "Create Account (Owner)",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.14,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric( horizontal:20.0), // กำหนด padding ให้ควบคุม TextFormField ทั้งหมด
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 20.0), // เพิ่ม padding ด้านบน
                          child: Row(
                            children: [
                              Expanded(
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    prefixIcon: Icon(Icons.person),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    labelText: 'First Name',
                                  ),
                                ),
                              ),
                              SizedBox(
                                  width: size.width *
                                      0.02), // ระยะห่างระหว่างช่อง First Name & Last Name
                              Expanded(
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    labelText: 'Last Name',
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        SizedBox(
                            height:
                                size.height * 0.02), // เพิ่มระยะห่างระหว่างช่อง

                        TextFormField(
                          validator: RequiredValidator(
                              errorText: "This field is required"),
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.person),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            labelText: 'User Name',
                          ),
                        ),

                        SizedBox(height: size.height * 0.02),

                        TextFormField(
                          obscureText: true,
                          validator: RequiredValidator(
                              errorText: "Password is required"),
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.lock),
                            suffixIcon: Icon(Icons.visibility),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            labelText: "Password",
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  const SizedBox(height: 30),
                  RoundedButton(
                    text: "Sign Up",
                    press: () {
                      Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return StartOwnerScreen();
                      },
                    ),
                  );
                    },
                  ),
                  const SizedBox(height: 10),
                  AlreadyHaveAccountCheck(
                    login: false,
                    press: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return const SignInScreen();
                      }));
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
