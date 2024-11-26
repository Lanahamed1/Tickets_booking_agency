import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tickets_booking_agency/Navigationbar/Account/Contatus.dart';
import 'package:flutter_tickets_booking_agency/Screen/welcome_page.dart';
import 'package:get/get.dart';
import 'firebase_options.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';

// void main() {
//   runApp(const MyApp());
// }

Future<void> main() async {
   WidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp(
   options: DefaultFirebaseOptions.currentPlatform,
   );
  // TODO: Request permission
 final messaging = FirebaseMessaging.instance;

   final settings = await messaging.requestPermission(
     alert: true,
     announcement: false,
     badge: true,
     carPlay: false,
     criticalAlert: false,
     provisional: false,
     sound: true,
   );
   // TODO: replace with your own VAPID key
   const vapidKey = "<YOUR_PUBLIC_VAPID_KEY_HERE>";
   // TODO: Register with FCM
  if (kDebugMode) {
     print('Permission granted: ${settings.authorizationStatus}');
   }
   String? token;

   if (DefaultFirebaseOptions.currentPlatform == DefaultFirebaseOptions.web) {
     token = await messaging.getToken(
       vapidKey: vapidKey,
     );
   } else {
     token = await messaging.getToken();
   }

   if (kDebugMode) {
     print('Registration Token=$token');
  }

//   // TODO: Set up foreground message handler

 // todo Set up background message handler

   runApp(MyApp());
 }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'VieWise',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.blue),
        home: Start());
  }
}
