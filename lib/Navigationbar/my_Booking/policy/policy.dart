import 'package:flutter/material.dart';
import 'package:flutter_tickets_booking_agency/Navigationbar/Main_page.dart';
import 'package:flutter_tickets_booking_agency/Navigationbar/my_Booking/my_booking.dart';
import 'package:flutter_tickets_booking_agency/Navigationbar/my_Booking/my_booking_model.dart';
import 'package:flutter_tickets_booking_agency/Navigationbar/my_Booking/policy/cancel_controller.dart';
import 'package:flutter_tickets_booking_agency/appstyle.dart';
import 'package:get/get.dart';

class Policy extends StatelessWidget {
  final int id;
  final TextEditingController username = TextEditingController();
  final TextEditingController password = TextEditingController();
  GlobalKey<FormState> formstate = GlobalKey();
  final CancelController cancelController = Get.put(CancelController());

  Policy({required this.id}); // Update the constructor to accept the id

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(50),
        alignment: Alignment.bottomCenter,
        child: Column(
          children: [
            Center(
              child: Text(
                "We are dedicated to providing the best services to our customers. If you wish to cancel this reservation, we would like to inform you that a cancellation fee of 30% of the total amount will be charged. Thank you for your cooperation",
                style: Styles.headLineStyle27,
              ),
            ),
            const SizedBox(
              height: 90,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MaterialButton(
                  color: const Color.fromARGB(255, 55, 183, 247),
                  minWidth: 80,
                  height: 50,
                  onPressed: () {
                    Get.defaultDialog(
                      title: "Cancel Booking",
                      titleStyle: const TextStyle(
                          fontSize: 22,
                          color: Colors.black87,
                          fontWeight: FontWeight.w500),
                      content: Column(
                        children: [
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
                                      hintText: ("Enter your Email"),
                                      hintStyle: Styles.headLineStyle7,
                                      labelText: 'Username',
                                      labelStyle: Styles.headLineStyle25),
                                ),
                                TextFormField(
                                  controller: password,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "The field is empty";
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                      hintText: ("Enter your password"),
                                      hintStyle: Styles.headLineStyle7,
                                      labelText: 'Password',
                                      labelStyle: Styles.headLineStyle25),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Get.back();
                          },
                          child: Text(
                            'No',
                            style: Styles.headLineStyle26,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            if (formstate.currentState!.validate()) {
                              User user = User(
                                password: password.text,
                                username: username.text,
                              );
                              Get.defaultDialog(
                                title: "Confirmation",
                                middleText:
                                    "Are you sure you want to cancel this booking?",
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Get.back();
                                    },
                                    child: Text('No',
                                        style: Styles.headLineStyle26),
                                  ),
                                  TextButton(
                                    onPressed: () async {
                                      await cancelController.cancelBooking(
                                          user.username, user.password, id);
                                      if (!cancelController.isLoading.value) {
                                        Get.back();
                                        Get.snackbar(
                                            colorText: const Color.fromARGB(
                                                255, 196, 7, 7),
                                            barBlur: 15,
                                            duration:
                                                const Duration(seconds: 5),
                                            'Booking Canceled ',
                                            'This booking has already been Canceled.');
                                        Get.delete();
                                        Get.to(() => MyBooking());
                                      }
                                    },
                                    child: Text('Yes',
                                        style: Styles.headLineStyle26),
                                  ),
                                ],
                              );
                            } else {
                              const snackBar = SnackBar(
                                content: Text("Form isn't valid!"),
                              );
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                            }
                          },
                          child: Text('Yes', style: Styles.headLineStyle26),
                        ),
                      ],
                    );
                  },
                  child: Row(
                    children: [
                      Text(
                        'Accept',
                        style: Styles.headLineStyle24,
                      ),
                      const Icon(
                        Icons.check,
                        color: Color.fromARGB(255, 86, 255, 92),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  width: 80,
                ),
                MaterialButton(
                  color: const Color.fromARGB(255, 55, 183, 247),
                  minWidth: 80,
                  height: 50,
                  onPressed: () {
                    Get.back();
                  },
                  child: Row(
                    children: [
                      Text(
                        'rejected',
                        style: Styles.headLineStyle24,
                      ),
                      const Icon(
                        Icons.close_rounded,
                        color: Colors.red,
                      )
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 320,
            ),
            Container(
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Thank you for your cooperation ",
                    style: Styles.headLineStyle27,
                  ),
                  const Icon(
                    Icons.emoji_emotions_outlined,
                    color: Colors.black,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
