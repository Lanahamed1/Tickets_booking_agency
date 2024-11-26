import 'package:flutter/material.dart';
import 'package:flutter_tickets_booking_agency/Navigationbar/Account/Contatus.dart';
import 'package:flutter_tickets_booking_agency/Navigationbar/Account/privacy.dart';
import 'package:flutter_tickets_booking_agency/Navigationbar/Account/profile.dart';
import 'package:flutter_tickets_booking_agency/appstyle.dart';
import 'package:flutter_tickets_booking_agency/token_manager.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class Account extends StatelessWidget {
  Account({super.key});
  Future<void> logOut() async {
    try {
      await TokenManager.clearToken();
      print('Logged out successfully');
    } catch (error) {
      print('Error logging out: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: const Color(0XFFE1EDFF),
          elevation: 0.0,
          title: Text('Profile', style: Styles.headLineStyle23),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {},
          ),
        ),
        body: SingleChildScrollView(
            child: Container(
                padding: const EdgeInsets.all(20),
                //   color: Colors.blue,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 25,
                      ),
                      const CircleAvatar(
                        radius: 70,
                        backgroundImage:
                            AssetImage('images/photo_2024-04-01_19-43-20.jpg'),
                      ),
                      const SizedBox(height: 24),
                      Profilemenuitem(
                          title: 'My Account',
                          icon: Icons.account_circle,
                          onPress: () {
                            Get.to(() => Profile());
                          }),
                      const Divider(
                        thickness: 0.3,
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Profilemenuitem(
                          title: 'Help Center',
                          icon: Icons.call,
                          onPress: () {
                            Get.to(() => ContactPage());
                          }),
                      const Divider(
                        thickness: 0.3,
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Profilemenuitem(
                          title: 'Privacy Policy',
                          icon: Icons.privacy_tip_outlined,
                          onPress: () {
                            Get.to(() => const Privacy());
                          }),
                      const Divider(
                        thickness: 0.3,
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Profilemenuitem(
                        title: 'Log Out',
                        icon: Icons.logout,
                        onPress: () {
                          logOut();
                        },
                      )
                    ]))));
  }
}

class Profilemenuitem extends StatelessWidget {
  const Profilemenuitem({
    super.key,
    required this.title,
    required this.icon,
    required this.onPress,
    this.endIcon = true,
    this.textColor,
  });
  final String title;
  final IconData icon;
  final VoidCallback onPress;
  final bool endIcon;
  final Color? textColor;
  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: Container(
            width: 37,
            height: 37,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: const Color(0XFFE1EDFF)),
            child: Icon(
              icon,
              color: const Color.fromARGB(255, 2, 146, 219),
            )),
        title: Text(title, style: Styles.headLineStyle31),
        trailing: endIcon
            ? Container(
                width: 28,
                height: 28,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.grey[200]),
                child: Container(
                  child: const Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 13,
                    color: Color(0xFF3b3b3b),
                  ),
                ),
              )
            : null,
        onTap: onPress);
  }
}
