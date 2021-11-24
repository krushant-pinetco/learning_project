import 'dart:async';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

class HomeTabController extends GetxController with SingleGetTickerProviderMixin {
  String startStop = "Start";

  late String timeString;

  String _formatDateTime(DateTime dateTime) {
    return DateFormat.Hm().format(dateTime);
  }

  @override
  void onInit() {
    timeString = _formatDateTime(DateTime.now());
    Timer.periodic(Duration(seconds: 1), (Timer t) => _getTime());
    super.onInit();
  }

  void _getTime() {
    final DateTime now = DateTime.now();
    final String formattedDateTime = _formatDateTime(now);
    timeString = formattedDateTime;
  }

  void timerStart() {
    print("Timer Start And Stop::::::::::::::::");
    timeString == "Start" ? "Start" : "Stop";
    update();
  }
}
