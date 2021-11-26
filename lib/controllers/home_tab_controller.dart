import 'dart:async';

import 'package:get/get.dart';

class HomeTabController extends GetxController with SingleGetTickerProviderMixin {
  Timer? timer;
  String startStop = "Start";
  bool isRunning = true;
  static Duration countdownDuration = Duration();
  Duration duration = const Duration();
  dynamic seconds;
  bool isCountdown = true;

  // UpdateTimer Functions
  void _addTime() {
    final addSeconds = isCountdown ? 1 : 0;
    seconds = (duration.inSeconds + addSeconds);
    if (seconds < 0) {
      timer?.cancel();
    } else {
      duration = Duration(seconds: seconds);
      print("TIMER START /*****************/ , $duration");
    }
    update();
  }

  void reset() {
    if (isCountdown) {
      print("RESET TIMER /#####################/");
      duration = countdownDuration;
    } else {
      duration = Duration();
    }
    update();
  }

  void stopTimer({bool resets = true}) {
    if (resets) {
      print("INSERT TIMER : @@@@@@@@@@@@@@@@@@@@@");
      reset();
      // _addTime();
    }
    timer!.cancel();
    print("STOP TIMER::::");
    update();
  }

  void startTimer({bool resets = true}) {
    print("START TIMER::::");
    timer = Timer.periodic(Duration(seconds: 1), (_) => _addTime());
    update();
  }
}
