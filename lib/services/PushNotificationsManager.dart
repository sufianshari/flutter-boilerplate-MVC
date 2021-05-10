import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// class PushNotificationsManager {
//   PushNotificationsManager._();

//   factory PushNotificationsManager() => instance;

//   static final PushNotificationsManager instance = PushNotificationsManager._();

//   final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
//   bool _initialized = false;

//   BuildContext context;

//   Future<void> init({BuildContext context}) async {
//     if (!_initialized) {
//       this.context = context;
//       // For iOS request permission first.
//       _firebaseMessaging.requestNotificationPermissions();
//       _firebaseMessaging.configure();

//       _firebaseMessaging.configure(
//         onMessage: (Map<String, dynamic> message) async {},
//         onLaunch: (Map<String, dynamic> message) async {},
//         onResume: (Map<String, dynamic> message) async {
//           if (message['data'] != null) {
//             if (message['data']['screen'] != null) {
//               if (context != null) {
//                 switch (message['data']['screen']) {
//                   case 'order':
//                     // Navigator.push(
//                     //   context,
//                     //   MaterialPageRoute(
//                     //     builder: (BuildContext context) => OrderScreen(),
//                     //   ),
//                     // );
//                     break;
//                   default:
//                     // Navigator.push(
//                     //   context,
//                     //   MaterialPageRoute(
//                     //     builder: (BuildContext context) => OrderScreen(),
//                     //   ),
//                     // );
//                     break;
//                 }
//               }
//             }
//           }
//         },
//       );

//       _initialized = true;
//     }
//   }

//   Future<bool> removeFCM() {
//     return _firebaseMessaging.deleteInstanceID();
//   }

//   Future<String> getToken() async {
//     return await _firebaseMessaging.getToken();
//   }
// }
