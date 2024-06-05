import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:my_task/app/ui/notification/notified_page.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:flutter_native_timezone/flutter_native_timezone.dart';
// import 'package:timezone/timezone.dart' as tz;

class NotifyHelper {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  initializeNotification() async {
    // _configureLocalTimezone();
    // FlutterNativeTimezone.getAvailableTimezones();
    // this is for latest iOS settings
    final DarwinInitializationSettings initializationSettingsIOS =
        DarwinInitializationSettings(
            requestSoundPermission: false,
            requestBadgePermission: false,
            requestAlertPermission: false,
            onDidReceiveLocalNotification: onDidReceiveLocalNotification);

    final AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('appicon');

    final InitializationSettings initializationSettings =
        InitializationSettings(
      iOS: initializationSettingsIOS,
      android: initializationSettingsAndroid,
    );

    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: onDidReceiveNotificationResponse,
    );
  }

  // scheduledNotification(int hour, int minutes, TaskModel task) async {
  //   await flutterLocalNotificationsPlugin.zonedSchedule(
  //       task.id!.toInt(),
  //       task.title,
  //       task.note,
  //       tz.TZDateTime.now(tz.local).add(const Duration(seconds: 5)),
  // _convertTime(hour, minutes)
  //       const NotificationDetails(
  //           android: AndroidNotificationDetails(
  //               'your channel id', 'your channel name')),
  //       androidAllowWhileIdle: true,
  //       uiLocalNotificationDateInterpretation:
  //           UILocalNotificationDateInterpretation.absoluteTime,
  //        matchDateTimeComponents: DateTimeComponents.time,
  //        payload: "${task.title}|" + "${task.note}|");
  // }

  // tz.TZDateTime _covertTime(int hour, int minutes){
  //   final tz.TZDateTime now = tz.TZDateTime.now(tz.local);
  //   tz.TZDateTime scheduleDate = tz.TZDateTime(tz.local, now.year, now.month, now.day, hour, minutes);
  //   if(scheduleDate.isBefore(now)) {
  //     scheduleDate = scheduleDate.add(const Duration(days: 1));
  //   }
  //   return scheduleDate;
  // }

  // Future<void> _configureLocalTimezone() async {
  //   tz.initializeTimeZones();
  //   final String timezone = await FlutterNativeTimezone.getLocalTimezone();
  //   tz.setLocation(tz.getLocation(timezone));
  // }

  void onDidReceiveNotificationResponse(
      NotificationResponse notificationResponse) async {
    final String? payload = notificationResponse.payload;
    if (notificationResponse.payload != null) {
      debugPrint('notification payload: $payload');
    }
    if (payload == "Theme Changed") {
      print("Nothing navigate to");
    } else {
      await Get.to(
        () => NotifiedPage(label: payload),
      );
    }
  }

  void requestIOSPermissions() {
    flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            IOSFlutterLocalNotificationsPlugin>()
        ?.requestPermissions(
          alert: true,
          badge: true,
          sound: true,
        );
  }

  displayNotification({required String title, required String body}) async {
    print("doing test");
    var androidPlatformChannelSpecifics = new AndroidNotificationDetails(
        'your channel id', 'your channel name',
        importance: Importance.max, priority: Priority.high);
    var iOSPlatformChannelSpecifics = new DarwinNotificationDetails();
    var platformChannelSpecifics = new NotificationDetails(
        android: androidPlatformChannelSpecifics,
        iOS: iOSPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin.show(
      0,
      title,
      body,
      platformChannelSpecifics,
      payload: title,
    );
  }

  // Future selectNotification(String payload) async {
  //   if (payload != null) {
  //     print('notification payload: $payload');
  //   } else {
  //     print("Notification Done");
  //   }
  //if(payload == "Theme Changed"){
  //print("Nothing to Navigate to ");
  //}else {
  //   Get.to(() => SecondScreen(payload));}
  // }

  Future onDidReceiveLocalNotification(
      int id, String? title, String? body, String? payload) async {
    Get.dialog(Text("Welcome to Flutter"));
  }
}
