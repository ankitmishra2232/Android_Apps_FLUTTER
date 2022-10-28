import 'package:flutter_local_notifications/flutter_local_notifications.dart';


class NotificationService {
  NotificationService();

  final _notificationservice = FlutterLocalNotificationsPlugin();


  Future <void> intialize() async{
    final AndroidInitializationSettings androidInitializationSettings =
    AndroidInitializationSettings('@drawable/ic_stat_battery_alert');

    final InitializationSettings settings =
    InitializationSettings(
      android: androidInitializationSettings,
    );
    await _notificationservice.initialize(
        settings,
        // onSelectNotification: (payload){
        //   print("payload");
        // }
      onDidReceiveNotificationResponse:(payload) {
        print('payload');
      },
    );
  }
  Future<NotificationDetails> _notificationDetails() async{
    const AndroidNotificationDetails androidNotificationDetails =
    AndroidNotificationDetails(
      'channelId',
      'channelName',
      channelDescription: 'description',
      importance: Importance.max,
      priority: Priority.max,
      playSound: true,
      // sound: RawResourceAndroidNotificationSound('app/src/main/res/sound/notification.wav'),
    );
    return NotificationDetails(android: androidNotificationDetails);
  }
  Future<void> showNotification({
    required int id,
    required String title,
    required String body,
  } ) async{
    final details = await _notificationDetails();
    await _notificationservice.show(id, title, body, details);
  }

  Future<void> cancelAllNotifications() async {
    await _notificationservice.cancelAll();
  }


}