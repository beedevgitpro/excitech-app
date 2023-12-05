import 'package:excitech/resource/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'module/splash/splash_screen.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  // FirebaseMessaging.onBackgroundMessage(firebaseMessageBackgroundHandler);
  //
  // await plugin
  //     .resolvePlatformSpecificImplementation<
  //         AndroidFlutterLocalNotificationsPlugin>()
  //     ?.createNotificationChannel(channel);
  // await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
  //     alert: true, sound: true, badge: true);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

// const AndroidNotificationChannel channel = AndroidNotificationChannel(
//   "id",
//   "name",
// );
// final FlutterLocalNotificationsPlugin plugin =
//     FlutterLocalNotificationsPlugin();
//
// Future<void> firebaseMessageBackgroundHandler(RemoteMessage message) async {
//   await Firebase.initializeApp();
// }

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  // @override
  // void initState() {
  //   var androidSettings =
  //       const AndroidInitializationSettings("@mipmap/ic_launcher");
  //   var iosSetting = const DarwinInitializationSettings();
  //   var settings =
  //       InitializationSettings(android: androidSettings, iOS: iosSetting);
  //   plugin.initialize(settings);
  //   FirebaseMessaging.instance.getInitialMessage();
  //   FirebaseMessaging.onMessage.listen((RemoteMessage message) {
  //     Firebase.initializeApp();
  //     RemoteNotification? notification = message.notification;
  //     AndroidNotification? android = message.notification?.android;
  //     if (notification != null && android != null) {
  //       plugin.show(
  //           notification.hashCode,
  //           notification.title,
  //           notification.body,
  //           NotificationDetails(
  //             android: AndroidNotificationDetails(channel.id, channel.name,
  //                 channelDescription: channel.description,
  //                 icon: "@mipmap/ic_launcher"),
  //             iOS: const DarwinNotificationDetails(),
  //           ));
  //     }
  //   });
  //   FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
  //     Firebase.initializeApp();
  //     RemoteNotification? notification = message.notification;
  //     AndroidNotification? android = message.notification?.android;
  //     if (notification != null && android != null) {
  //       showDialog(
  //           context: context,
  //           builder: (_) {
  //             return AlertDialog(
  //               title: Text(notification.title ?? ""),
  //               content: SingleChildScrollView(
  //                 child: Column(
  //                   children: [
  //                     Text(notification.body ?? ""),
  //                   ],
  //                 ),
  //               ),
  //             );
  //           });
  //     }
  //   });
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      theme: ThemeData(
        primaryColor: AppColors.darkColor,
        fontFamily: 'sf-ui-display-bold',
      ),
    );
  }
}
