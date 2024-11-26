import 'package:flutter/material.dart';
import 'package:flutter_tickets_booking_agency/Navigationbar/Account/account.dart';
import 'package:flutter_tickets_booking_agency/Navigationbar/Account/controller.dart';
import 'package:flutter_tickets_booking_agency/appstyle.dart';
import 'package:get/get.dart';

class ContactPage extends StatelessWidget {
  final ContactController _controller = Get.put(ContactController());

  ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Contact Us', style: Styles.headLineStyle23),
          centerTitle: true,
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(Icons.arrow_back)),
          elevation: 0,
          backgroundColor: const Color(0XFFE1EDFF),
        ),
        body: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      padding: EdgeInsets.all(30),
                      color: const Color(0XFFE1EDFF),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            onChanged: (value) =>
                                _controller.contactMessage.update((val) {
                              val!.name = value;
                            }),
                            decoration: InputDecoration(
                                fillColor: Colors.white,
                                filled: true,
                                hintText: ("Enter your Name"),
                                hintStyle: Styles.headLineStyle7,
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.always,
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 30),
                                label: Container(
                                  margin:
                                      const EdgeInsets.symmetric(horizontal: 9),
                                  child: Text("Name",
                                      style: Styles.headLineStyle28),
                                ),
                                suffixIcon: Padding(
                                  padding: const EdgeInsets.only(right: 26),
                                  child: Icon(
                                    Icons.person_2_outlined,
                                    color: Colors.grey.shade400,
                                  ),
                                ),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10))),
                          ),
                          const SizedBox(height: 25),
                          TextFormField(
                            onChanged: (value) =>
                                _controller.contactMessage.update((val) {
                              val!.email = value;
                            }),
                            decoration: InputDecoration(
                                fillColor: Colors.white,
                                filled: true,
                                hintText: ("Enter your e-mail"),
                                hintStyle: Styles.headLineStyle7,
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.always,
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 30),
                                label: Container(
                                  margin:
                                      const EdgeInsets.symmetric(horizontal: 9),
                                  child: Text("E-mail",
                                      style: Styles.headLineStyle28),
                                ),
                                suffixIcon: Padding(
                                  padding: const EdgeInsets.only(right: 26),
                                  child: Icon(
                                    Icons.email_outlined,
                                    color: Colors.grey.shade400,
                                  ),
                                ),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10))),
                          ),
                          const SizedBox(height: 27),
                          TextFormField(
                            onChanged: (value) =>
                                _controller.contactMessage.update((val) {
                              val!.message = value;
                            }),
                            maxLines: 4,
                            decoration: InputDecoration(
                                fillColor: Colors.white,
                                filled: true,
                                hintText: ("Enter your Message"),
                                hintStyle: Styles.headLineStyle7,
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.always,
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 30),
                                label: Container(
                                  margin:
                                      const EdgeInsets.symmetric(horizontal: 9),
                                  child: Text("Your Message",
                                      style: Styles.headLineStyle28),
                                ),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10))),
                          ),
                          const SizedBox(height: 50),
                          Obx(
                            () => Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: 190,
                                  height: 45,
                                  decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 124, 181, 209),
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                  child: MaterialButton(
                                    onPressed: _controller.isValid
                                        ? () async {
                                            _controller.sendMessage();
                                            await Get.to(() => Account());
                                          }
                                        : null,
                                    child: const Text(
                                      'Send Message',
                                      style: TextStyle(
                                          letterSpacing: 0.2,
                                          fontSize: 16,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 140,
                          )
                        ],
                      ),
                    ),
                  ]),
            )));
  }
}
