import 'dart:async';
import 'package:flutter/material.dart';
import 'package:battery_plus/battery_plus.dart';

import 'notificationfile.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}




class _MyHomePageState extends State<MyHomePage> {
  bool _light = false;
  late bool onoff;
  var bet;
  var val;
  var battery =Battery();
  int percentage =100;
  late Timer timer;
  BatteryState batteryState = BatteryState.full;
  late StreamSubscription streamSubscription;
  late final NotificationService service;

  @override
  void initState() {
    service = NotificationService();
    service.intialize();
    super.initState();
    // tz.initializeTimeZones();
    // calling the method to get battery state
    // getBatteryState();

    // calling the method to get battery percentage



  }
// method created to display battery percent
  void getBatteryPerentage() async {
    final level = await battery.batteryLevel;
    percentage = level;

    setState(() {});
    print(level);
    // return percentage;
  }

// method to know the state of the battery
  void getBatteryState() {
    streamSubscription = battery.onBatteryStateChanged.listen((state) {
      batteryState = state;
      bet = batteryState.toString();
      setState(() {});
      print(batteryState);
    });
  }


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      height: 150,
      child: FittedBox(
        child: Switch.adaptive(
          value: _light,
          onChanged: (bool value){
            val=value.toString();
            print(val);
            if(val == 'true'){
              print(value);
              Timer.periodic(const Duration(seconds: 5), (timer) {
                getBatteryPerentage();
                getBatteryState();
                if(percentage <= 20 && bet == 'BatteryState.discharging' && val == 'true') {
                  // service.addNotification("title", "hii", 5);
                  print("battery zaada hai");
                  service.showNotification(id: 0, title: 'Battery', body: 'please Charge battey is very less');
                }
                if(percentage <= 20 && bet == 'BatteryState.charging' && val == 'true'){
                  print("Charge ho rha hai");
                  // service.showNotification(id: 0, title: 'Battery', body: 'Charging');
                  service.cancelAllNotifications();
                }
                if(percentage >= 80 && percentage < 100 && bet == 'BatteryState.charging' && val == 'true'){
                  print("zada hai bhai");
                  // service.addNotification("title", "hii", 5);
                  service.showNotification(id: 0, title: 'Battery', body: 'Battery above 80%');

                }
                if(percentage == 100 && bet == 'BatteryState.full' && val == 'true'){
                  service.showNotification(id: 0, title: 'Battery', body: 'Battery is full please unplug the charger');

                }
                else{
                  service.cancelAllNotifications();
                }
              });

              print("hio");
              // getBatteryState();
              //
            }
            if (val == 'false'){
              print("stopped");
              service.cancelAllNotifications();
            }
            onoff=value;
            setState((){
              _light = value;
            });
          },

        ),
      ),
    );
  }
}
