import 'package:flutter/material.dart';
import 'package:flutter_tickets_booking_agency/Navigationbar/Main_page.dart';
import 'package:flutter_tickets_booking_agency/Screen/logIn_controller.dart';
import 'package:flutter_tickets_booking_agency/Screen/singup.dart';
import 'package:flutter_tickets_booking_agency/Screen/user_model.dart';
import 'package:flutter_tickets_booking_agency/appstyle.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class LogIn extends StatelessWidget {
  LogIn({super.key});
  final TextEditingController username = TextEditingController();
  final TextEditingController password = TextEditingController();
  final LoginController _loginController = LoginController();

  GlobalKey<FormState> formstate = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            backgroundColor: const Color(0XFFE1EDFF),
            elevation: 0.0,
            title: SizedBox(
              child: Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.only(left: 7, top: 3),
                child:
                    Text("Welcome to Viawise!", style: Styles.headLineStyle11),
              ),
            )),
        body: Container(
            color: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: ListView(children: [
              const SizedBox(height: 0),
              Container(
                margin: const EdgeInsets.only(left: 5),
                child: Text(
                    "We are happy to see you again! What is the next\n destination? ",
                    textAlign: TextAlign.center,
                    style: Styles.headLineStyle12),
              ),
              const SizedBox(height: 37),
              Form(
                key: formstate,
                child: Column(
                  children: [
                    TextFormField(
                      controller: username,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "The field is empty";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          fillColor: const Color(0XFFF4F7FA),
                          filled: true,
                          hintText: ("Enter your e-mail"),
                          hintStyle: Styles.headLineStyle7,
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 30),
                          label: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 9),
                            child: Text("E-mail", style: Styles.headLineStyle8),
                          ),
                          suffixIcon: const Padding(
                            padding: EdgeInsets.only(right: 26),
                            child: Icon(
                              Icons.email_outlined,
                              color: Colors.grey,
                            ),
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30))),
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 25),
                    ),
                    TextFormField(
                      controller: password,
                      validator: (value) {
                        if (value!.length > 12) {
                          return "Minmium length is 12 characters";
                        }
                        if (value.isEmpty) {
                          return "The field is empty";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          fillColor: const Color(0XFFF4F7FA),
                          filled: true,
                          hintText: ("Enter your password"),
                          hintStyle: Styles.headLineStyle7,
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 30),
                          label: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 9),
                            child:
                                Text("Password", style: Styles.headLineStyle8),
                          ),
                          suffixIcon: MaterialButton(
                              onPressed: () {},
                              padding: const EdgeInsets.only(right: 0),
                              child: IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.visibility),
                                color: Colors.grey,
                              )),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30))),
                    ),
                    const SizedBox(height: 10),
                    Column(
                      children: [
                        Container(
                          alignment: Alignment.centerRight,
                          child: MaterialButton(
                              minWidth: 15,
                              onPressed: () {},
                              child: Text("Forgot password?",
                                  style: Styles.headLineStyle8)),
                        ),
                        const SizedBox(height: 15),
                        Container(
                            width: 350,
                            height: 45,
                            decoration: BoxDecoration(
                              color: const Color(0xFF1765FC),
                              borderRadius: BorderRadius.circular(150),
                            ),
                            child: MaterialButton(
                                onPressed: () {
                                  if (formstate.currentState!.validate()) {
                                    User user = User(
                                      username: username.text,
                                      password: password.text,
                                    );
                                    _loginController.signIn(context, user);
                                  } else {
                                    const snackBar = SnackBar(
                                      content: Text("Form isn't valid!"),
                                    );
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(snackBar);
                                  }
                                },
                                child: Text("Sign in",
                                    textAlign: TextAlign.right,
                                    style: Styles.headLineStyle9))),
                        const SizedBox(height: 22),
                        Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 3.0),
                            child: Row(children: [
                              const Expanded(
                                  child: Divider(
                                      thickness: 0.5, color: Colors.grey)),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 17.0),
                                child: Text("or continue with",
                                    style: Styles.headLineStyle8),
                              ),
                              const Expanded(
                                  child: Divider(
                                      thickness: 0.5, color: Colors.grey)),
                            ])),
                        const SizedBox(height: 11),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.center,
                        //   children: [
                        //     MaterialButton(
                        //       height: 20,
                        //       onPressed: () {},
                        //       child: IconButton(
                        //         onPressed: () {},
                        //         icon: Image.asset("images/google.png"),
                        //         iconSize: 35,
                        //       ),
                        //     ),
                        //     MaterialButton(
                        //       height: 20,
                        //       onPressed: () {},
                        //       child: IconButton(
                        //         onPressed: () {},
                        //         icon: Image.asset(
                        //           "images/FaceBook.jpg",
                        //           fit: BoxFit.cover,
                        //         ),
                        //         iconSize: 35,
                        //       ),
                        //     ),
                        //   ],
                        // ),
                        //  const SizedBox(height: 6),
                        Container(
                          alignment: Alignment.center,
                          child: Text(
                              "By signing in, you agree to our Terms and Conditions.",
                              style: Styles.headLineStyle8),
                        ),
                        const SizedBox(height: 48),
                        Container(
                            width: 340,
                            height: 45,
                            decoration: BoxDecoration(
                              color: const Color(0XFFF4F7FA),
                              border: Border.all(
                                  color: const Color(0XFF1765FC), width: 1.5),
                              borderRadius: BorderRadius.circular(150),
                            ),
                            child: MaterialButton(
                              onPressed: () {
                                Get.to(Mainpage());
                              },
                              child: Text("Sign in as a guest",
                                  textAlign: TextAlign.right,
                                  style: Styles.headLineStyle10),
                            )),
                        const SizedBox(height: 17),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Don't have an account?",
                                style: Styles.headLineStyle8),
                            MaterialButton(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 11, vertical: 18),
                              minWidth: 20,
                              onPressed: () {
                                Get.to(() => SignUp());
                              },
                              child: Text("Register",
                                  style: Styles.headLineStyle10),
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            ])));
  }
}
