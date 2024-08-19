// import 'dart:convert';
//
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
//
// import '../model/notification.dart';
// import '../views/detailAd/detail.recebedor.dart';

// class LocalNotification {
//   NotificationPop notification = NotificationPop();
//   static final FlutterLocalNotificationsPlugin _notiPlugin =
//       FlutterLocalNotificationsPlugin();
//
//   static void initialize() {
//     const iosInitializationSetting = DarwinInitializationSettings();
//     final InitializationSettings initialSettings = InitializationSettings(
//       android: AndroidInitializationSettings(
//         '@mipmap/ic_launcher',
//       ),
//       iOS: iosInitializationSetting,
//     );
//     _notiPlugin.initialize(initialSettings,
//         onDidReceiveBackgroundNotificationResponse: onDidReceiveBackgroundNotificationResponse,
//         onDidReceiveNotificationResponse: (NotificationResponse details) {
//       print('onDidReceiveNotificationResponse Function');
//       print(details.payload);
//       print(details.payload != null);
//
//       final Map<String, dynamic> payloadMap = json.decode(details.payload!);
//       final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
//
//       print("${details.payload} AASADASD");
//       if (payloadMap['type'] == "anuncio") {
//         final idAnuncio = payloadMap['id_anuncio'];
//         print(idAnuncio);
//         Navigator.of(navigatorKey.currentState!.context).push(MaterialPageRoute(
//           builder: (context) => DetailRecebedor(idAd: idAnuncio, veio: "0"),
//         ));
//       }
//       final idAnuncio = payloadMap['id_anuncio'];
//       print(idAnuncio);
//     });
//   }
//   static void handleNotification(RemoteMessage message) {
//     print("Chegou aqui ${message.data}");
//
//     final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
//
//     print("$message AASADASD");
//     if (message.data['type'] == "anuncio") {
//       final idAnuncio = message.data['id_anuncio'];
//       print(idAnuncio);
//       Navigator.of(navigatorKey.currentState!.context).push(MaterialPageRoute(
//         builder: (context) => DetailRecebedor(idAd: idAnuncio, veio: "0"),
//       ));
//     }
//    // final Map<String, dynamic> payloadMap = json.decode(payload);
//     final idAnuncio = message.data['id_anuncio'];
//     print(idAnuncio);
//
//
//     final tipo = message.data['type'];
//     print("click");
//
//
//     // Aqui, você pode adicionar mais condições para outros tipos de notificação, se necessário
//   }
//   static void onDidReceiveBackgroundNotificationResponse(NotificationResponse details) {
//     // ...
//   }
//
//   static void showNotification(RemoteMessage message) {
//     NotificationPop notification = NotificationPop.fromJson(message.data);
//
//     print(" dados da notificaçao ${message.data}");
//     const iosNotificatonDetail = DarwinNotificationDetails();
//     final NotificationDetails notiDetails = NotificationDetails(
//       android: AndroidNotificationDetails(
//         'br.com.repasse.push_notification',
//         'push_notification',
//         importance: Importance.max,
//         priority: Priority.high,
//       ),
//       iOS: DarwinNotificationDetails()
//     );
//
//     _notiPlugin.show(
//       DateTime.now().microsecond,
//       notification.title,
//       notification.description,
//       notiDetails,
//       payload: message.data.toString(),
//     );
//    // getNotification(notification);
//   }
//
//   void getNotification(RemoteMessage message){
//     print('Os dados chegou aqui');
//     notification = NotificationPop.fromJson(message.data);
//   }
// }
