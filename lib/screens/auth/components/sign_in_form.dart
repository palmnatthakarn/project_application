import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:project_application/components/already_have_account_check.dart';
import 'package:project_application/components/rounded_button.dart';
import 'package:project_application/screens/Profile_user/profileuser_screen.dart';
//import 'package:project_application/screens/Start_user/start_screen.dart';
import 'package:project_application/screens/Type/type_screen.dart';
import 'package:project_application/screens/Welcome/welcome_screen.dart';
//import 'package:project_application/screens/auth/sign_up_screen.dart';
//import 'package:project_application/screens/auth/start_user_screen.dart';
//import 'package:project_application/screens/Start_user/start_screen.dart';
//import 'package:project_application/screens/auth/sign_in_screen.dart';

class SignInForm extends StatefulWidget {
  final Widget? child;

  const SignInForm({Key? key, this.child}) : super(key: key);

  @override
  _SignInFormState createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      //color: Colors.black,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 0.0,
                            vertical:
                                20.0), // กำหนด padding แนวนอน 20, แนวตั้ง 10
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
                    height: size.height * 0.04,
                  ),
                  Text(
                    "Welcome Back",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        color: Colors.white),
                  ),
                  const Text(
                    "Log In !",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 60,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.16,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30.0), // ✅ กำหนด padding ด้านซ้าย-ขวา 20.0
                    child: Column(
                      children: [
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
                        const SizedBox(
                            height: 15), // ✅ เพิ่มระยะห่างระหว่างช่องป้อนข้อมูล

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
                  SizedBox(height: size.height * 0.09),
                  RoundedButton(
                    text: "LOGIN",
                    press: () {
                       Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return ProfileUserScreen();
                      },
                    ),
                  );
                    },
                  ),
                  const SizedBox(height: 10),
                  AlreadyHaveAccountCheck(
                    login: true,
                    press: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return const TypeScreen();
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
