/**
 * Created by Jaimin on 21/03/24.
 */

import 'dart:developer';

import 'Strings.dart';

class Console {
  static void Log(String title, var message) {
    if (isLog == true) {
      log('$title : $message', time: DateTime.now());
    }
  }
}
